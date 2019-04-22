const t = @import("../index.zig");

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