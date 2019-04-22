
pub const StripRenderer = struct {
    shader: *PrimitiveShader,
    vao: c.GLuint,
    projection: Mat4,
    rectangleBuffer: c.GLuint,
    triangleBuffer: c.GLuint,

    fn init(s: *PrimitiveShader, fb_width: usize, fb_height: usize) StripRenderer {
        var r = StripRenderer {
            .shader = s,
            .vao = 0,
            .projection = Mat4.orthographic(0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0),
            .rectangleBuffer = 0,
            .triangleBuffer = 0,
        };

        c.glGenVertexArrays(1, &r.vao);
        c.glBindVertexArray(r.vao);
        
        c.glGenBuffers(1, &r.rectangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, self.rectangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            4 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &rectangleVertices[0][0]),
            c.GL_STATIC_DRAW
       );

        c.glGenBuffers(1, &r.triangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, self.triangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            3 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &triangleVertices[0][0]),
            c.GL_STATIC_DRAW
       );

        return r;
    }

    fn begin (self: *StripRenderer) void {
        c.glBindVertexArray(r.vao);
        self.shader.program.bind();
    }

    fn end(self: *StripRenderer) void {
        self.shader.program.unbind();
        c.glBindVertexArray(0);        
    }

    pub fn submit(self: *StripRenderer, color: *const Vec4, x: f32, y: f32, w: f32, h: f32) void {
        const model = Mat4.diagonal(1).translate(x, y, 0.0).scale(w, h, 0.0);
        const mvp = self.projection.mul(model);
        self.submitMvp(color, mvp);
    }

    pub fn submitMvp(self: *StripRenderer, color: *const Vec4, mvp: *const Mat4) void {
        self.shader.program.setUniform_vec4(r.shader.uniform_color, color);
        self.shader.program.setUniform_mat4(r.shader.uniform_mvp, mvp);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, self.rectangleBuffer);
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

    fn destroy(self: *StripRenderer) void {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.rectangleBuffer != 0) c.glDeleteBuffers(1, &r.rectangleBuffer);
        if (r.triangleBuffer != 0) c.glDeleteBuffers(1, &r.triangleBuffer);
    }
};