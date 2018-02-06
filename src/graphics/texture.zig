const tick = @import("../tick.zig");

use tick.math;

use tick.system;
use tick.system.asset;

use tick.graphics;
use tick.graphics.shader;
use tick.graphics.sprite;

const TextureFilterMode = enum {
    Nearest,
    Bilinear,
    Trilinear,
    Anisotropic4x,
    Anisotropic8x,
    Anisotropic16x,
};

const TextureWrapMode = enum {
    Repeat,
    Clamp,
    Mirror
};

const BlendMode = enum { 
    Alpha,
    Additive,
    Multiply
};

pub const TextureShader = struct {
    program: ShaderProgram,
    attrib_position: c.GLint,
    attrib_color: c.GLint,
    attrib_uv: c.GLint,
    uniform_mvp: c.GLint,
    uniform_tex: c.GLint,

    pub fn init()TextureShader {
        var self: TextureShader = undefined;
        self.program = ShaderProgram.init(
            \\#version 330 core
            \\in vec3 VertexPosition;
            \\in vec4 VertexColor;
            \\in vec2 VertexUV;
            \\out vec4 FragmentColor;
            \\out vec2 FragmentUV;
            \\uniform mat4 MVP;
            \\void main(void) {
            \\    gl_Position = vec4(VertexPosition, 1.0) * MVP;
            \\    FragmentUV = VertexUV;
            \\    FragmentColor = VertexColor;
            \\}
        ,
            \\#version 330 core
            \\in vec4 FragmentColor;
            \\in vec2 FragmentUV;
            \\out vec4 OutputColor;
            \\uniform sampler2D Tex;
            \\void main(void) {
            \\    OutputColor = texture(Tex, FragmentUV) + vec4(FragmentColor.rgb, 0);
            \\}
        , null);

        self.attrib_position = self.program.getAttributeLocation(c"VertexPosition");
        self.attrib_color = self.program.getAttributeLocation(c"VertexColor");
        self.attrib_uv = self.program.getAttributeLocation(c"VertexUV");
        self.uniform_mvp = self.program.getUniformLocation(c"MVP");
        self.uniform_tex = self.program.getUniformLocation(c"Tex");

        debug.assertNoErrorGL();

        return self;
    }

    pub fn destroy(self: &TextureShader) void {
        self.program.destroy();
    }
};

const MAX_GLYPHS   = 1024;
const MAX_BATCHES  = 1024;
const MAX_INDICES  = 1024;
const MAX_VERTICES = 1024;

pub const GlyphSortType = enum {
    NONE,
    FRONT_TO_BACK,
    BACK_TO_FRONT,
    TEXTURE,
};

pub const RenderBatch = struct {
    offset: c.GLuint,
    numVertices: c.GLuint,
    textureID: c.GLuint,
};

var s_glyphs: [MAX_GLYPHS]Glyph = undefined;
var s_glyph_pointers: [MAX_GLYPHS]&const Glyph = undefined;
var s_batches: [MAX_GLYPHS]RenderBatch = undefined;

pub const BatchRenderer = struct {
    shader: &TextureShader,
    vao: c.GLuint,
    vbo: c.GLuint,
    ibo: c.GLuint,
    glyphs: []Glyph,
    glyphPointers: []&const Glyph,
    numGlyphs: usize,
    renderBatches: []RenderBatch,
    numBatches: usize,
    sortType: GlyphSortType,
    projection: Mat4,
    
    pub fn init(s: &TextureShader, fb_width: usize, fb_height: usize)BatchRenderer {
        var r = BatchRenderer {
            .shader = s,
            .vao = 0,
            .vbo = 0,
            .ibo = 0,
            .projection = Mat4.orthographic( 0.0, f32(fb_width), f32(fb_height), 0.0, -1.0, 1.0 ),
            .glyphs = s_glyphs[0..],
            .glyphPointers = s_glyph_pointers[0..],
            .numGlyphs = 0,
            .renderBatches= s_batches[0..],
            .numBatches = 0,
            .sortType = GlyphSortType.TEXTURE,
        };

        c.glGenVertexArrays(1, &r.vao);
        c.glGenBuffers(1, &r.vbo);

        c.glBindVertexArray(r.vao);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.vbo);

        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_position));
        c.glVertexAttribPointer(
            c.GLuint(r.shader.attrib_position),
            3,
            c.GL_FLOAT,
            c.GL_FALSE,
            @sizeOf(Vertex),
            @intToPtr(&c_void, @offsetOf(Vertex, "position"))
        );

        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_color));
        c.glVertexAttribPointer(
            c.GLuint(r.shader.attrib_color),
            4,
            c.GL_FLOAT,
            c.GL_TRUE,
            @sizeOf(Vertex),
            @intToPtr(&c_void, @offsetOf(Vertex, "colour"))
        );
        
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_uv));
        c.glVertexAttribPointer(
            c.GLuint(r.shader.attrib_uv),
            4,
            c.GL_FLOAT,
            c.GL_FALSE,
            @sizeOf(Vertex),
            @intToPtr(&c_void, @offsetOf(Vertex, "uv"))
        );

        c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);
        c.glBindVertexArray(0);

        return r;
    }

    pub fn begin(r: &BatchRenderer) void {
        c.glBindVertexArray(r.vao);
        r.numGlyphs = 0;
    }

    pub fn submit(
            r: &BatchRenderer,
            destRect: &const Vec4,
            uvRect: &const Vec4,
            glyph_texture: &const Texture,
            depth: f32,
            colour: &const Vec4,
            angle: f32) void {
        r.glyphs[r.numGlyphs] = Glyph.init(destRect, uvRect, glyph_texture, depth, colour);
        r.numGlyphs += 1;
    }

    pub fn end(r: &BatchRenderer) void {
        // Set up all pointers for fast sorting
        for (r.glyphs[0..r.numGlyphs]) | *g, i | {
            r.glyphPointers[i] = g;
        }
        r.sortGlyphs();
        r.createRenderBatches();
        debug.assertNoErrorGL();
    }

    pub fn render(r: &BatchRenderer) void {
        r.shader.program.bind();
        r.shader.program.setUniform_mat4(r.shader.uniform_mvp,  &r.projection);

        c.glBindVertexArray(r.vao);
        
        debug.assertNoErrorGL();        
        
        for (r.renderBatches[0..r.numBatches]) | batch, i| {
            c.glBindTexture(c.GL_TEXTURE_2D, batch.textureID);
            c.glDrawArrays(c.GL_TRIANGLES, c_int(batch.offset), c_int(batch.numVertices));
        }

        c.glBindVertexArray(0);
        r.shader.program.unbind();
        debug.assertNoErrorGL();
    }

    pub fn destroy(r: &BatchRenderer) void {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.vbo != 0) c.glDeleteBuffers(1, &r.vbo);
        if (r.ibo != 0) c.glDeleteBuffers(1, &r.ibo);
    }

    fn sortGlyphs(r: &BatchRenderer) void {
        
    }

    fn createRenderBatches(r: &BatchRenderer) void {
        var vertices: [MAX_VERTICES]Vertex = undefined;
        if (r.numGlyphs == 0) return;

        var currentOffset: usize = 0;
        var currentVertex: usize = 0;
        var currentBatch: usize = 0;

        // First Batch
        r.renderBatches[0] = RenderBatch {
            .offset = c_uint(currentOffset),
            .numVertices = 6,
            .textureID = r.glyphPointers[0].texture.id,
        };

        vertices[currentVertex + 0] = r.glyphPointers[0].topLeft;
        vertices[currentVertex + 1] = r.glyphPointers[0].bottomLeft;
        vertices[currentVertex + 2] = r.glyphPointers[0].bottomRight;
        vertices[currentVertex + 3] = r.glyphPointers[0].bottomRight;
        vertices[currentVertex + 4] = r.glyphPointers[0].topRight;
        vertices[currentVertex + 5] = r.glyphPointers[0].topLeft;
        currentVertex += 6;
        currentOffset += 6;

        for(r.glyphPointers[1..r.numGlyphs]) | g, i | {
            const current_glyph = i + 1;
            if (r.glyphPointers[current_glyph].texture.id 
                    != r.glyphPointers[current_glyph - 1].texture.id) {
                currentBatch += 1;
                r.renderBatches[currentBatch] = RenderBatch {
                    .offset = c_uint(currentOffset),
                    .numVertices = 6,
                    .textureID = r.glyphPointers[current_glyph].texture.id, 
                };
            } else {
                // If its part of the current batch, just increase numVertices
                r.renderBatches[currentBatch].numVertices += 6;
            }

            vertices[currentVertex + 0] = g.topLeft;
            vertices[currentVertex + 1] = g.bottomLeft;
            vertices[currentVertex + 2] = g.bottomRight;
            vertices[currentVertex + 3] = g.bottomRight;
            vertices[currentVertex + 4] = g.topRight;
            vertices[currentVertex + 5] = g.topLeft;
            currentVertex += 6;
            currentOffset += 6;
        }

        r.numBatches = currentBatch + 1;

        // Buffer vertices
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.vbo);
        c.glBufferData(c.GL_ARRAY_BUFFER, c_long(currentVertex * @sizeOf(Vertex)), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ARRAY_BUFFER, 0, c_long(currentVertex * @sizeOf(Vertex)), @ptrCast(&c_void, &vertices));
        c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);

        // Buffer indices
        // c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, r.ibo);
        // c.glBufferData(c.GL_ELEMENT_ARRAY_BUFFER, c_long(currentIndex * @sizeof(c.GLuint)), @intToPtr(&c_void, 0), GL_DYNAMIC_DRAW);
        // c.glBufferSubData(c.GL_ELEMENT_ARRAY_BUFFER, 0, c_long(currentIndex * @sizeof(c.GLuint)), @ptrCast(&c_void, &vertices));
        // c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, 0);
    }
};

pub const IMRenderer = struct {
    shader: &TextureShader,
    vao: c.GLuint,
    projection: Mat4,
    rectangleBuffer: c.GLuint,
    rectangleUV: c.GLuint,
    triangleBuffer: c.GLuint,
    triangleUV: c.GLuint,

    fn init(s: &TextureShader, fb_width: usize, fb_height: usize)IMRenderer {
        var r = IMRenderer {
            .shader = s,
            .vao = 0,
            .projection = Mat4.orthographic( 0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0 ),
            .rectangleBuffer = 0,
            .rectangleUV = 0,
            .triangleBuffer = 0,
            .triangleUV = 0,
        };

        c.glGenVertexArrays(1, &r.vao);
        c.glBindVertexArray(r.vao);
        
        c.glGenBuffers(1, &r.rectangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            4 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &rectangleVertices[0][0]),
            c.GL_STATIC_DRAW
        );      

        c.glGenBuffers(1, &r.rectangleUV);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleUV);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            4 * 2 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &rectangleUV[0][0]),
            c.GL_STATIC_DRAW
        );

        c.glGenBuffers(1, &r.triangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.triangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            3 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &triangleVertices[0][0]),
            c.GL_STATIC_DRAW
        );

        c.glGenBuffers(1, &r.triangleUV);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.triangleUV);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            3 * 2 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &triangleUV[0][0]),
            c.GL_STATIC_DRAW
        );

        return r;
    }

    fn begin (r: &IMRenderer) void {
        c.glBindVertexArray(r.vao);
        r.shader.program.bind();
    }

    fn end(r: &IMRenderer) void {
        r.shader.program.unbind();
        c.glBindVertexArray(0);        
    }

    pub fn draw_rect(r: &IMRenderer, rect_texture: &Texture, x: f32, y: f32, w: f32, h: f32) void {
        const model = Mat4.diagonal(1).translate(x, y, 0.0).scale(w, h, 0.0);
        const mvp = r.projection.mul(model);
        r.shader.program.setUniform_mat4(r.shader.uniform_mvp, mvp);
        r.shader.program.setUniform_int(r.shader.uniform_tex, c.GLint(rect_texture.id));

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleBuffer);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_position));
        c.glVertexAttribPointer(c.GLuint(r.shader.attrib_position), 3, c.GL_FLOAT, c.GL_FALSE, 0, null);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleUV);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_uv));
        c.glVertexAttribPointer(c.GLuint(r.shader.attrib_uv), 2, c.GL_FLOAT, c.GL_FALSE, 0, null);

        rect_texture.bind();
        
        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, 4);
    }

    fn draw_text(r: &IMRenderer, s: &Spritesheet, string: []const u8, left: f32, top: f32, size: f32) void {
        for (string) |col, i| {
            if (col <= '~') {
                const char_left = left + f32(i * s.width) * size;
                const model = Mat4.diagonal(1).translate(char_left, top, 0.0).scale(size, size, 0.0);
                const mvp = r.projection.mul(model);
                s.draw(r.shader, col, mvp);
            } else {
                unreachable;
            }
        }
    }

    fn draw_sprite(r: &IMRenderer, s: &Sprite, left: f32, top: f32, width: f32, height: f32) void {
        const model = Mat4.diagonal(1).translate(left, top, 0.0).scale(width, height, 0.0);
        const mvp = r.projection.mul(model);
        s.draw(r.shader, mvp);
    }

    fn destroy(r: &IMRenderer) void {
        if (r.vao != 0)             c.glDeleteVertexArrays(1, &r.vao);
        if (r.rectangleBuffer != 0) c.glDeleteBuffers(1, &r.rectangleBuffer);
        if (r.rectangleUV != 0)     c.glDeleteBuffers(1, &r.rectangleUV);
        if (r.triangleBuffer != 0)  c.glDeleteBuffers(1, &r.triangleBuffer);
        if (r.triangleUV != 0)      c.glDeleteBuffers(1, &r.triangleUV);
    }
};

pub const Glyph = struct {
    bottomLeft: Vertex,
    topLeft: Vertex,
    topRight: Vertex,
    bottomRight: Vertex,
    texture: &const Texture,
    depth: f32,

    fn init(destRect: &const Vec4, uvRect: &const Vec4, glyph_texture: &const Texture, depth: f32, colour: &const Vec4)Glyph {
        const tlv = Vertex {
            .position = vec3(destRect.x, destRect.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y)
        };

        const blv = Vertex {
            .position = vec3(destRect.x, destRect.y + destRect.w, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y + uvRect.w)
        };

        const brv = Vertex {
            .position = vec3(destRect.x + destRect.z, destRect.y + destRect.w, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y + uvRect.w),
        };

        const trv = Vertex {
            .position = vec3(destRect.x + destRect.z, destRect.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y),
        };

        return Glyph {
            .bottomLeft = blv,
            .topLeft = tlv,
            .topRight = trv, 
            .bottomRight = brv, 
            .texture = glyph_texture,
            .depth = depth
        };
    }

    fn initR(destRect: Vec4, uvRect: Vec4, texture: c.GLuint, depth: f32, colour: Vec4, angle: f32)Glyph {
        // To get center position
        const halfDims = vec2( destRect.z / 2.0, destRect.w / 2.0  );

        // Center at origin
        const bl = vec2(-halfDims.x, -halfDims.y );
        const tl = vec2(-halfDims.x,  halfDims.y );
        const tr = vec2( halfDims.x,  halfDims.y );
        const br = vec2( halfDims.x, -halfDims.y );

        // rotate the points

        bl = rotate(bl, angle) + halfDims;
        tl = rotate(tl, angle) + halfDims;
        tr = rotate(tr, angle) + halfDims;
        br = rotate(br, angle) + halfDims;

        const blv = Vertex {
            .position = vec3(destRect.x + bl.x, destRect.y + bl.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y)
        };

        const tlv = Vertex {
            .position = vec3(destRect.x + tl.x, destRect.y + tl.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y + uvRect.w)
        };

        const trv = Vertex {
            .position = vec3(destRect.x + tr.x, destRect.y + tr.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y + uvRect.w)
        };

        const brv = Vertex {
            .position = vec3(destRect.x + br.x, destRect.y + br.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y)
        };

        return Glyph {
            .bottomLeft = blv,
            .topLeft = tlv,
            .topRight = trv, 
            .bottomRight = brv, 
            .textureID = texture,
            .depth = depth
        };
    }
};

pub const Texture = struct {
    img: asset.PngImage,    
    id: c.GLuint,
    path: []const u8,

    pub fn init(compressed_bytes: []const u8) %Texture {
        var t: Texture = undefined;
        t.img = try PngImage.create(compressed_bytes);

        c.glGenTextures(1, &t.id);
        errdefer c.glDeleteTextures(1, &t.id);

        c.glBindTexture(c.GL_TEXTURE_2D, t.id);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_WRAP_S, c.GL_REPEAT);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_WRAP_T, c.GL_REPEAT);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_MAG_FILTER, c.GL_LINEAR);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_MIN_FILTER, c.GL_LINEAR_MIPMAP_LINEAR);
        c.glPixelStorei(c.GL_PACK_ALIGNMENT, 4);
        c.glTexImage2D(c.GL_TEXTURE_2D, 0, c_int(t.img.color_type), c_int(t.img.width), c_int(t.img.height),
                0, c_uint(t.img.color_type), c.GL_UNSIGNED_BYTE, @ptrCast(&c_void, &t.img.raw[0]));

        c.glGenerateMipmap(c.GL_TEXTURE_2D);
        c.glBindTexture(c.GL_TEXTURE_2D, 0);

        return t;
    }

    pub fn bind(t: &Texture) void {
        c.glActiveTexture(c.GL_TEXTURE0 + t.id);
        c.glBindTexture(c.GL_TEXTURE_2D, t.id);
    }

    pub fn unbind(t: &Texture) void {
        c.glBindTexture(c.GL_TEXTURE_2D, 0);
    }
    
    pub fn deinit(t: &Texture) void {
        c.glDeleteTextures(1, &t.id);
        t.img.destroy();
    }
};

fn GenTextureMipmaps(texture: &const Texture) void {
    rlglGenerateMipmaps(texture);
}

fn SetTextureFilter(texture: &const Texture, filter_mode: TextureFilterMode) void {
    switch (filter_mode) {
        TextureFilterMode.Point => {
            if (texture.mipmaps > 1) {
                rlTextureParameters(texture.id, RL_TEXTURE_MIN_FILTER, RL_FILTER_MIP_NEAREST);
                rlTextureParameters(texture.id, RL_TEXTURE_MAG_FILTER, RL_FILTER_NEAREST);
            } else {
                rlTextureParameters(texture.id, RL_TEXTURE_MIN_FILTER, RL_FILTER_NEAREST);
                rlTextureParameters(texture.id, RL_TEXTURE_MAG_FILTER, RL_FILTER_NEAREST);
            }
        },
        TextureFilterMode.Bilinear => {
            if (texture.mipmaps > 1) {
                rlTextureParameters(texture.id, RL_TEXTURE_MIN_FILTER, RL_FILTER_LINEAR_MIP_NEAREST);
                rlTextureParameters(texture.id, RL_TEXTURE_MAG_FILTER, RL_FILTER_LINEAR);
            } else {
                rlTextureParameters(texture.id, RL_TEXTURE_MIN_FILTER, RL_FILTER_LINEAR);
                rlTextureParameters(texture.id, RL_TEXTURE_MAG_FILTER, RL_FILTER_LINEAR);
            }
        },
        TextureFilterMode.Trilinear => {
            if (texture.mipmaps > 1) {
                rlTextureParameters(texture.id, RL_TEXTURE_MIN_FILTER, RL_FILTER_MIP_LINEAR);
                rlTextureParameters(texture.id, RL_TEXTURE_MAG_FILTER, RL_FILTER_LINEAR);
            } else {
                rlTextureParameters(texture.id, RL_TEXTURE_MIN_FILTER, RL_FILTER_LINEAR);
                rlTextureParameters(texture.id, RL_TEXTURE_MAG_FILTER, RL_FILTER_LINEAR);
            }
        },
        TextureFilterMode.Anisotropic4x => rlTextureParameters(texture.id, RL_TEXTURE_ANISOTROPIC_FILTER, 4),
        TextureFilterMode.Anisotropic8x => rlTextureParameters(texture.id, RL_TEXTURE_ANISOTROPIC_FILTER, 8),
        TextureFilterMode.Anisotropic16x => rlTextureParameters(texture.id, RL_TEXTURE_ANISOTROPIC_FILTER, 16),
        else => {}
    }
}

// Set texture wrapping mode
fn SetTextureWrap(texture: &const Texture, wrap_mode: TextureWrapMode) void {
    switch (wrap_mode) {
        WRAP_REPEAT => {
            rlTextureParameters(texture.id, RL_TEXTURE_WRAP_S, RL_WRAP_REPEAT);
            rlTextureParameters(texture.id, RL_TEXTURE_WRAP_T, RL_WRAP_REPEAT);
        },
        WRAP_CLAMP => {
            rlTextureParameters(texture.id, RL_TEXTURE_WRAP_S, RL_WRAP_CLAMP);
            rlTextureParameters(texture.id, RL_TEXTURE_WRAP_T, RL_WRAP_CLAMP);
        },
        WRAP_MIRROR => {
            rlTextureParameters(texture.id, RL_TEXTURE_WRAP_S, RL_WRAP_CLAMP_MIRROR);
            rlTextureParameters(texture.id, RL_TEXTURE_WRAP_T, RL_WRAP_CLAMP_MIRROR);
        },
        else => {}
    }
}