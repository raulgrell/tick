
var s_indices: [MAX_INDICES]c.GLuint = undefined;
var s_vertices: [MAX_VERTICES]Vertex = undefined;

pub const LineRenderer = struct {
    shader: *PrimitiveShader,
    vao: c.GLuint,
    vbo: c.GLuint,
    ibo: c.GLuint,
    projection: Mat4,
    vertices: []Vertex,
    num_vertices: c_uint,
    indices: []c.GLuint,
    num_indices: c_uint,
    num_elements: c_int,

    pub fn init(s: *PrimitiveShader, fb_width: usize, fb_height: usize) LineRenderer {
        var r = LineRenderer {
            .shader = s,
            .vao = 0,
            .vbo = 0,
            .ibo = 0,
            .projection = Mat4.orthographic(0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0),
            .vertices = s_vertices[0..],
            .num_vertices = 0,
            .indices = s_indices[0..],
            .num_indices = 0,
            .num_elements = 0
        };
        
        c.glGenVertexArrays(1, &r.vao);
        c.glBindVertexArray(r.vao);

        c.glGenBuffers(1, &r.vbo);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, self.vbo);

        c.glGenBuffers(1, &r.ibo);
        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, self.ibo);

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

    pub fn begin (self: *LineRenderer) void {
        c.glBindVertexArray(self.vao);
    }

    pub fn end(self: *LineRenderer) void {
        c.glBindBuffer(c.GL_ARRAY_BUFFER, self.vbo);
        c.glBufferData(c.GL_ARRAY_BUFFER, self.num_vertices * @sizeOf(Vertex), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ARRAY_BUFFER, 0, self.num_vertices * @sizeOf(Vertex), @ptrCast(&c_void, self.vertices.ptr));
        c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);

        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, self.ibo);
        c.glBufferData(c.GL_ELEMENT_ARRAY_BUFFER, self.num_indices * @sizeOf(c.GLuint), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ELEMENT_ARRAY_BUFFER, 0, self.num_indices * @sizeOf(c.GLuint), @ptrCast(&c_void, self.indices.ptr));
        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, 0);

        self.num_elements = (c_int)(self.num_indices);
        self.num_indices = 0;
        self.num_vertices = 0;

        debug.assertNoErrorGL();
    }

    pub fn drawLine(self: *LineRenderer, colour: *const Vec4, a: *const Vec3, b: *const Vec3) void {
        const i = self.num_vertices;
        self.vertices[i].position = *a;
        self.vertices[i].colour = *colour;
        self.vertices[i + 1].position = *b;
        self.vertices[i + 1].colour = *colour;
        self.num_vertices += 2;

        const j = self.num_indices;
        self.indices[j] = i;
        self.indices[j + 1] = i + 1;
        self.num_indices += 2;
    }

    pub fn drawPolygon(self: *LineRenderer, colour: *const Vec4, center: *const Vec3, radius: f32, angle: f32, numSides: c_int) void {
        const vertexOffset = self.num_vertices;

        var i = 0;
        while (i < numSides) : (i += 1) {
            const internalAngle = (float(i) / numSides) * PI * 2.0 + angle;
            self.vertices[vertexOffset + i].position.x = cos(internalAngle) * radius + center.x;
            self.vertices[vertexOffset + i].position.y = sin(internalAngle) * radius + center.y;
            self.vertices[vertexOffset + i].colour = colour;
        }

        self.num_vertices += numSides;

        const indexOffset = self.num_indices;

        var j = 0;
        while (j < numSides - 1) : (j += 2) {
            self.indices[indexOffset + j] = vertexOffset + j;
            self.indices[indexOffset + j + 1] = vertexOffset + j + 1;
        }

        self.indices[indexOffset + j] = vertexOffset + numSides - 1;
        self.indices[indexOffset + j + 1] = vertexOffset;
        self.num_indices += numSides * 2;
    }

    pub fn render(self: *LineRenderer) void {
        self.shader.program.bind();
        self.shader.program.setUniform_mat4(r.shader.uniform_mvp,  &r.projection);

        c.glLineWidth(1.0);
        c.glBindVertexArray(r.vao);
        c.glDrawElements(c.GL_LINES, self.num_elements, c.GL_UNSIGNED_INT, @intToPtr(&c_void, self.ibo));
        c.glBindVertexArray(0);

        self.shader.program.unbind();

        debug.assertNoErrorGL();
    }

    pub fn destroy(self: *LineRenderer) void {
        if (r.vao != 0) c.glDeleteVertexArrays(1, &r.vao);
        if (r.vbo != 0) c.glDeleteBuffers(1, &r.vbo);
        if (r.ibo != 0) c.glDeleteBuffers(1, &r.ibo);
    }
};