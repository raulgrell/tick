use @import("../math/index.zig");
use @import("../system/index.zig");

use @import("../graphics/index.zig");
use shader;

const MAX_INDICES  = 1024;
const MAX_VERTICES = 1024;

pub const PrimitiveShader = struct {
    program: ShaderProgram,
    attrib_position: c.GLint,
    attrib_color: c.GLint,
    uniform_mvp: c.GLint,
    uniform_color: c.GLint,

    pub fn init() PrimitiveShader {
        var self: PrimitiveShader = undefined;
        self.program = ShaderProgram.init(
            \\#version 330 core
            \\in vec3 VertexPosition;
            \\in vec4 VertexColor;
            \\out vec4 FragmentColor;
            \\uniform mat4 MVP;
            \\void main(void) {
            \\    gl_Position = vec4(VertexPosition, 1.0) * MVP;
            \\    FragmentColor = VertexColor;
            \\}
        ,
            \\#version 330 core
            \\in vec4 FragmentColor;
            \\out vec4 OutputColor;
            \\uniform vec4 Color;
            \\void main(void) {
            \\    OutputColor = Color + vec4(FragmentColor.rgb, 0);
            \\}
        , null);

        self.attrib_position = self.program.getAttributeLocation(c"VertexPosition");
        self.attrib_color = self.program.getAttributeLocation(c"VertexColor");
        self.uniform_mvp = self.program.getUniformLocation(c"MVP");
        self.uniform_color = self.program.getUniformLocation(c"Color");

        return self;
    }

    pub fn destroy(self: *PrimitiveShader) void {
        self.program.destroy();
    }
};

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

var s_indices: [MAX_INDICES]c.GLuint = undefined;
var s_vertices: [MAX_VERTICES]Vertex = undefined;

pub const LineRenderer = struct {
    shader: *PrimitiveShader,
    vao: c.GLuint,
    vbo: c.GLuint,
    ibo: c.GLuint,
    projection: Mat4,
    vertices: []Vertex,
    numVertices: c_uint,
    indices: []c.GLuint,
    numIndices: c_uint,
    numElements: c_int,

    pub fn init(s: *PrimitiveShader, fb_width: usize, fb_height: usize) LineRenderer {
        var r = LineRenderer {
            .shader = s,
            .vao = 0,
            .vbo = 0,
            .ibo = 0,
            .projection = Mat4.orthographic(0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0),
            .vertices = s_vertices[0..],
            .numVertices = 0,
            .indices = s_indices[0..],
            .numIndices = 0,
            .numElements = 0
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
        c.glBufferData(c.GL_ARRAY_BUFFER, self.numVertices * @sizeOf(Vertex), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ARRAY_BUFFER, 0, self.numVertices * @sizeOf(Vertex), @ptrCast(&c_void, self.vertices.ptr));
        c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);

        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, self.ibo);
        c.glBufferData(c.GL_ELEMENT_ARRAY_BUFFER, self.numIndices * @sizeOf(c.GLuint), @intToPtr(&c_void, 0), c.GL_DYNAMIC_DRAW);
        c.glBufferSubData(c.GL_ELEMENT_ARRAY_BUFFER, 0, self.numIndices * @sizeOf(c.GLuint), @ptrCast(&c_void, self.indices.ptr));
        c.glBindBuffer(c.GL_ELEMENT_ARRAY_BUFFER, 0);

        self.numElements = (c_int)(self.numIndices);
        self.numIndices = 0;
        self.numVertices = 0;

        debug.assertNoErrorGL();
    }

    pub fn drawLine(self: *LineRenderer, colour: *const Vec4, a: *const Vec3, b: *const Vec3) void {
        const i = self.numVertices;

        self.vertices[i].position = *a;
        self.vertices[i].colour = *colour;
        self.vertices[i + 1].position = *b;
        self.vertices[i + 1].colour = *colour;

        self.numVertices += 2;

        const j = self.numIndices;

        self.indices[j] = i;
        self.indices[j + 1] = i + 1;

        self.numIndices += 2;
    }

    pub fn drawPolygon(self: *LineRenderer, colour: *const Vec4, center: *const Vec3, radius: f32, angle: f32, numSides: c_int) void {
        const vertexOffset = self.numVertices;

        var i = 0;
        while (i < numSides) : (i += 1) {
            const internalAngle = (float(i) / numSides) * PI * 2.0 + angle;
            self.vertices[vertexOffset + i].position.x = cos(internalAngle) * radius + center.x;
            self.vertices[vertexOffset + i].position.y = sin(internalAngle) * radius + center.y;
            self.vertices[vertexOffset + i].colour = colour;
        }

        self.numVertices += numSides;

        const indexOffset = self.numIndices;

        var j = 0;
        while (j < numSides - 1) : (j += 2) {
            self.indices[indexOffset + j] = vertexOffset + j;
            self.indices[indexOffset + j + 1] = vertexOffset + j + 1;
        }

        self.indices[indexOffset + j] = vertexOffset + numSides - 1;
        self.indices[indexOffset + j + 1] = vertexOffset;
        self.numIndices += numSides * 2;
    }

    pub fn render(self: *LineRenderer) void {
        self.shader.program.bind();
        self.shader.program.setUniform_mat4(r.shader.uniform_mvp,  &r.projection);

        c.glLineWidth(1.0);
        c.glBindVertexArray(r.vao);
        c.glDrawElements(c.GL_LINES, self.numElements, c.GL_UNSIGNED_INT, @intToPtr(&c_void, self.ibo));
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

const Polygon = struct {
    vertices: ArrayList(Vertex),

    fn rectangle(rect: *const Rectangle, color: *const Colour) Polygon {
        self.setPos(rect.getPos());

        self.vertices.resize(4);

        self.vertices[0].setPos(0.0, 0.0, 0.0);
        self.vertices[0].setUV(0.0, 0.0);
        self.vertices[0].setColor(color);

        self.vertices[1].setPos(0.0, rect.height, 0.0);
        self.vertices[1].setUV(0.0, 0.0);
        self.vertices[1].setColor(color);

        self.vertices[2].setPos(rect.width, rect.height, 0.0);
        self.vertices[2].setUV(0.0, 0.0);
        self.vertices[2].setColor(color);

        self.vertices[3].setPos(rect.width, 0.0, 0.0);
        self.vertices[3].setUV(0.0, 0.0);
        self.vertices[3].setColor(color);
    }

    fn regular(center_position: Vec2, radius: f32, color: *const Color, num_verts: usize) Polygon {
        self.setPos(center_position);

        if(num_verts == -1) {
            num_verts = radius;
        }

        self.vertices.resize(num_verts);

        const PIx2 = 2.0 * PI;

        for(vertices) | v, i | {

            const angle = (i / num_verts) * PIx2;

            self.vertices[i].setPos(
                cos(angle) * radius,
                sin(angle) * radius,
                0.0);

            self.vertices[i].setUV(0.0, 0.0);
            self.vertices[i].setColor(color);
        }
    }

    fn vertices(verts: ArrayList(Vec2), color: Color) void {
        self.vertices.resize(verts.size());

        for(verts) | v, i | {
            self.vertices[i].setPos(verts[i].x, verts[i].y, 0.0);
            self.vertices[i].setUV(0.0, 0.0);
            self.vertices[i].setColor(color);
        }
    }

    fn addVertex(vertex: Vertex) void {
        self.vertices.push_back(vertex);
    }

    fn getVerts() []Vertex {
        return &self.vertices;
    }

    fn getIndices() []usize {
        var indices = ((3 * (self.vertices.size())) - 6);
        var currentIndex = 0;

        for(self.vertices) {
            indices[currentIndex + 0] = 0;
            indices[currentIndex + 1] = i;
            indices[currentIndex + 2] = i + 1;
            currentIndex += 3;
        }

        return indices;
    }

    fn getIndexCount() usize {
        return uint((3 * (self.vertices.size())) - 6);
    }

    fn getModelMatrix() Mat3 {
        self.reconstructTransform();
        return self.getTransform().getMatrix();
    }

    fn render(renderer: *Renderer) void {
        renderer.submit(this);
    }
};