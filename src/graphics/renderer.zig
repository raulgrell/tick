use @import("../system/index.zig");
use @import("../math/index.zig");
use @import("../graphics/sprite.zig");

const shader = @import("shader.zig");

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
    shader: &shader.TextureShader,
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
    
    pub fn init(s: &shader.TextureShader, fb_width: usize, fb_height: usize) -> BatchRenderer {
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

    pub fn begin(r: &BatchRenderer) {
        c.glBindVertexArray(r.vao);
        r.numGlyphs = 0;
    }

    pub fn submit(
            r: &BatchRenderer,
            destRect: &const Vec4,
            uvRect: &const Vec4,
            texture: &const Texture,
            depth: f32,
            colour: &const Vec4,
            angle: f32) -> void {
        r.glyphs[r.numGlyphs] = Glyph.init(destRect, uvRect, texture, depth, colour);
        r.numGlyphs += 1;
    }

    pub fn end(r: &BatchRenderer) {
        // Set up all pointers for fast sorting
        for (r.glyphs[0..r.numGlyphs]) | *g, i | {
            r.glyphPointers[i] = g;
        }
        r.sortGlyphs();
        r.createRenderBatches();
        debug.assertNoErrorGL();
    }

    pub fn render(r: &BatchRenderer) {
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

    pub fn destroy(r: &BatchRenderer) {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.vbo != 0) c.glDeleteBuffers(1, &r.vbo);
        if (r.ibo != 0) c.glDeleteBuffers(1, &r.ibo);
    }

    fn sortGlyphs(r: &BatchRenderer) {
        
    }

    fn createRenderBatches(r: &BatchRenderer) {
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
                }
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

const rectangleVertices = [][3]c.GLfloat {
    []c.GLfloat{0.0, 0.0, 0.0},
    []c.GLfloat{0.0, 1.0, 0.0},
    []c.GLfloat{1.0, 0.0, 0.0},
    []c.GLfloat{1.0, 1.0, 0.0},
};

const rectangleUV = [][2]c.GLfloat{
    []c.GLfloat{0, 0},
    []c.GLfloat{0, 1},
    []c.GLfloat{1, 0},
    []c.GLfloat{1, 1},
};

const triangleVertices = [][3]c.GLfloat {
    []c.GLfloat{0.0, 0.0, 0.0},
    []c.GLfloat{0.0, 1.0, 0.0},
    []c.GLfloat{1.0, 0.0, 0.0},
};

const triangleUV = [][2]c.GLfloat{
    []c.GLfloat{0, 0},
    []c.GLfloat{0, 1},
    []c.GLfloat{1, 0},
};

pub const IMRenderer = struct {
    shader: &shader.TextureShader,
    vao: c.GLuint,
    projection: Mat4,
    rectangleBuffer: c.GLuint,
    rectangleUV: c.GLuint,
    triangleBuffer: c.GLuint,
    triangleUV: c.GLuint,

    fn init(s: &shader.TextureShader, fb_width: usize, fb_height: usize) -> IMRenderer {
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

        return r
    }

    fn begin (r: &IMRenderer) {
        c.glBindVertexArray(r.vao);
        r.shader.program.bind();
    }

    fn end(r: &IMRenderer) {
        r.shader.program.unbind();
        c.glBindVertexArray(0);        
    }

    pub fn draw_rect(r: &IMRenderer, texture: &Texture, x: f32, y: f32, w: f32, h: f32) {
        const model = Mat4.diagonal(1).translate(x, y, 0.0).scale(w, h, 0.0);
        const mvp = r.projection.mul(model);
        r.shader.program.setUniform_mat4(r.shader.uniform_mvp, mvp);
        r.shader.program.setUniform_int(r.shader.uniform_tex, c.GLint(texture.id));

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleBuffer);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_position));
        c.glVertexAttribPointer(c.GLuint(r.shader.attrib_position), 3, c.GL_FLOAT, c.GL_FALSE, 0, null);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleUV);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_uv));
        c.glVertexAttribPointer(c.GLuint(r.shader.attrib_uv), 2, c.GL_FLOAT, c.GL_FALSE, 0, null);

        texture.bind();
        
        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, 4);
    }

    fn draw_text(r: &IMRenderer, s: &Spritesheet, text: []const u8, left: f32, top: f32, size: f32) {
        for (text) |col, i| {
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

    fn draw_sprite(r: &IMRenderer, s: &Sprite, left: f32, top: f32, width: f32, height: f32) {
        const model = Mat4.diagonal(1).translate(left, top, 0.0).scale(width, height, 0.0);
        const mvp = r.projection.mul(model);
        s.draw(r.shader, mvp);
    }

    fn destroy(r: &IMRenderer) {
        if (r.vao != 0)             c.glDeleteVertexArrays(1, &r.vao);
        if (r.rectangleBuffer != 0) c.glDeleteBuffers(1, &r.rectangleBuffer);
        if (r.rectangleUV != 0)     c.glDeleteBuffers(1, &r.rectangleUV);
        if (r.triangleBuffer != 0)  c.glDeleteBuffers(1, &r.triangleBuffer);
        if (r.triangleUV != 0)      c.glDeleteBuffers(1, &r.triangleUV);
    }
};

pub const StripRenderer = struct {
    shader: &shader.PrimitiveShader,
    vao: c.GLuint,
    projection: Mat4,
    rectangleBuffer: c.GLuint,
    triangleBuffer: c.GLuint,

    fn init(s: &shader.PrimitiveShader, fb_width: usize, fb_height: usize) -> StripRenderer {
        var r = StripRenderer {
            .shader = s,
            .vao = 0,
            .projection = Mat4.orthographic( 0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0 ),
            .rectangleBuffer = 0,
            .triangleBuffer = 0,
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

        c.glGenBuffers(1, &r.triangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.triangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            3 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &triangleVertices[0][0]),
            c.GL_STATIC_DRAW
        );

        return r
    }

    fn begin (r: &StripRenderer) {
        c.glBindVertexArray(r.vao);
        r.shader.program.bind();
    }

    fn end(r: &StripRenderer) {
        r.shader.program.unbind();
        c.glBindVertexArray(0);        
    }

    pub fn submitMvp(r: &StripRenderer, color: &const Vec4, mvp: &const Mat4) {
        r.shader.program.setUniform_vec4(r.shader.uniform_color, color);
        r.shader.program.setUniform_mat4(r.shader.uniform_mvp, mvp);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleBuffer);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_position));
        c.glVertexAttribPointer(
            c.GLuint(r.shader.attrib_position),
            3,
            c.GL_FLOAT,
            c.GL_FALSE,
            0,
            null
        );

        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, 4);
    }

    pub fn submit(r: &StripRenderer, color: &const Vec4, x: f32, y: f32, w: f32, h: f32) {
        const model = Mat4.diagonal(1).translate(x, y, 0.0).scale(w, h, 0.0);
        const mvp = r.projection.mul(model);
        r.submitMvp(color, mvp);
    }

    fn destroy(r: &StripRenderer) {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.rectangleBuffer != 0) c.glDeleteBuffers(1, &r.rectangleBuffer);
        if (r.triangleBuffer != 0) c.glDeleteBuffers(1, &r.triangleBuffer);
    }
};

var s_indices: [MAX_INDICES]c.GLuint = undefined;
var s_vertices: [MAX_VERTICES]Vertex = undefined;

pub const LineRenderer = struct {
    shader: &shader.PrimitiveShader,
    vao: c.GLuint,
    vbo: c.GLuint,
    ibo: c.GLuint,
    projection: Mat4,
    vertices: []Vertex,
    numVertices: c_uint,
    indices: []c.GLuint,
    numIndices: c_uint,
    numElements: c_int,

    pub fn init(s: &shader.PrimitiveShader, fb_width: usize, fb_height: usize) -> LineRenderer {
        var r = LineRenderer {
            .shader = s,
            .vao = 0,
            .vbo = 0,
            .ibo = 0,
            .projection = Mat4.orthographic( 0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0 ),
            .vertices = s_vertices[0..],
            .numVertices = 0,
            .indices = s_indices[0..],
            .numIndices = 0,
            .numElements = 0
        };
        
        c.glGenVertexArrays(1, &r.vao);
        c.glBindVertexArray(r.vao);

        c.glGenBuffers(1, &r.vbo);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.vbo);

        c.glGenBuffers(1, &r.ibo);
        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, r.ibo);

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
            c.GL_FALSE,
            @sizeOf(Vertex),
            @intToPtr(&c_void,  @offsetOf(Vertex, "colour"))
        );

        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, 0);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);
        c.glBindVertexArray(0);

        return r;
    }

    pub fn begin (r: &LineRenderer) {
        c.glBindVertexArray(r.vao);
    }

    pub fn end(r: &LineRenderer) {
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.vbo);
        c.glBufferData(c.GL_ARRAY_BUFFER, r.numVertices * @sizeOf(Vertex), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ARRAY_BUFFER, 0, r.numVertices * @sizeOf(Vertex), @ptrCast(&c_void, r.vertices.ptr));
        c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);

        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, r.ibo);
        c.glBufferData(c.GL_ELEMENT_ARRAY_BUFFER, r.numIndices * @sizeOf(c.GLuint), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ELEMENT_ARRAY_BUFFER, 0, r.numIndices * @sizeOf(c.GLuint), @ptrCast(&c_void, r.indices.ptr));
        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, 0);

        r.numElements = (c_int)(r.numIndices);
        r.numIndices = 0;
        r.numVertices = 0;

        debug.assertNoErrorGL();
    }

    pub fn drawLine(r: &LineRenderer, colour: &const Vec4, a: &const Vec3, b: &const Vec3,) {
        const i = r.numVertices;

        r.vertices[i].position = *a;
        r.vertices[i].colour = *colour;
        r.vertices[i + 1].position = *b;
        r.vertices[i + 1].colour = *colour;

        r.numVertices += 2;

        const j = r.numIndices;

        r.indices[j] = i;
        r.indices[j + 1] = i + 1;

        r.numIndices += 2;
    }

    pub fn drawPolygon(r: &LineRenderer, colour: &const Vec4, center: &const Vec3, radius: f32, angle: f32, numSides: c_int) {
        const vertexOffset = r.numVertices;

        { var i = 0; while( i < numSides) : ( i += 1 ) {
            const internalAngle = ( float(i) / numSides ) * PI * 2.0 + angle;
            r.vertices[vertexOffset + i].position.x = cos(internalAngle) * radius + center.x;
            r.vertices[vertexOffset + i].position.y = sin(internalAngle) * radius + center.y;
            r.vertices[vertexOffset + i].colour = colour;
        }}

        r.numVertices += numSides;

        const indexOffset = r.numIndices;

        var j = 0;

        while( j < numSides - 1) : ( j += 2 ) {
            _indices[indexOffset + j] = vertexOffset + j;
            _indices[indexOffset + j + 1] = vertexOffset + j + 1;
        }

        r.indices[indexOffset + j] = vertexOffset + numSides - 1;
        r.indices[indexOffset + j + 1] = vertexOffset;
        r.numIndices += numSides * 2;
    }

    pub fn render(r: &LineRenderer) {
        r.shader.program.bind();
        r.shader.program.setUniform_mat4(r.shader.uniform_mvp,  &r.projection);

        c.glLineWidth(1.0);
        c.glBindVertexArray(r.vao);
        c.glDrawElements(c.GL_LINES, r.numElements, c.GL_UNSIGNED_INT, @intToPtr(&c_void, r.ibo));
        c.glBindVertexArray(0);

        r.shader.program.unbind();

        debug.assertNoErrorGL();
    }

    pub fn destroy(r: &LineRenderer) {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.vbo != 0) c.glDeleteBuffers(1, &r.vbo);
        if (r.ibo != 0) c.glDeleteBuffers(1, &r.ibo);
    }
};