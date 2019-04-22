
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
var s_glyph_pointers: [MAX_GLYPHS]*const Glyph = undefined;
var s_batches: [MAX_GLYPHS]RenderBatch = undefined;

pub const BatchRenderer = struct {
    shader: *TextureShader,
    vao: c.GLuint,
    vbo: c.GLuint,
    ibo: c.GLuint,
    glyphs: []Glyph,
    glyphPointers: []*const Glyph,
    numGlyphs: usize,
    renderBatches: []RenderBatch,
    numBatches: usize,
    sortType: GlyphSortType,
    projection: Mat4,
    
    pub fn init(s: *TextureShader, fb_width: usize, fb_height: usize)BatchRenderer {
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

    pub fn begin(r: *BatchRenderer) void {
        c.glBindVertexArray(r.vao);
        r.numGlyphs = 0;
    }

    pub fn submit(
            r: *BatchRenderer,
            destRect: *const Vec4,
            uvRect: *const Vec4,
            glyph_texture: *const Texture,
            depth: f32,
            colour: *const Vec4,
            angle: f32) void {
        r.glyphs[r.numGlyphs] = Glyph.init(destRect, uvRect, glyph_texture, depth, colour);
        r.numGlyphs += 1;
    }

    pub fn end(r: *BatchRenderer) void {
        // Set up all pointers for fast sorting
        for (r.glyphs[0..r.numGlyphs]) | *g, i | {
            r.glyphPointers[i] = g;
        }
        r.sortGlyphs();
        r.createRenderBatches();
        debug.assertNoErrorGL();
    }

    pub fn render(r: *BatchRenderer) void {
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

    pub fn destroy(r: *BatchRenderer) void {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.vbo != 0) c.glDeleteBuffers(1, &r.vbo);
        if (r.ibo != 0) c.glDeleteBuffers(1, &r.ibo);
    }

    fn sortGlyphs(r: *BatchRenderer) void {
        
    }

    fn createRenderBatches(r: *BatchRenderer) void {
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