use @import("../math/index.zig");
const shader = @import("../graphics/shader.zig");

const c = @import("../system/c.zig");

const Light = struct {
    color: Vec4,
    position: Vec3,
    direction: Vec3,
    lightVector: Vec3,
    intensity: f32,
    size: f32,

    pub fn init(direction: &const Vec3, color: &const Vec4, intensity: f32, size: usize) -> Light {
        Light {
            .color = color,
            .position = vec3(0, 0, 0),
            .direction = direction,
            .lightVector = vec3(0, 0, 0),
            .intensity = intensity,
            .size = size
        }
    }

    pub fn draw(self: &Light, r: &BatchRenderer) {
        const destRect = vec4(self.position.x, self.position.y, self.size, self.size );
        const uvRect = vec4(-1.0, -1.0, 2.0, 2.0);
        r.submit(destRect, uvRect, 0, 0, self.colour, 0);
    }

    pub fn render(self: Light, r: &LightRenderer) -> void {
        lr.submit(self.position, self.size, self.colour);
    }
};

pub const LightShader = struct {
    program: shader.ShaderProgram,
    attrib_position: c.GLint,
    attrib_color: c.GLint,
    attrib_uv: c.GLint,
    uniform_mvp: c.GLint,
    uniform_tex: c.GLint,
    uniform_color: c.GLint,

    pub fn init() -> LightShader {
        var self: LightShader = undefined;

        self.program = shader.ShaderProgram.init(
            \\#version 330 core
            \\in vec3 VertexPosition;
            \\in vec4 VertexColor;
            \\in vec2 VertexUV;
            \\out vec4 FragmentColor;
            \\out vec2 FragmentUV;
            \\uniform mat4 MVP;
            \\void main(void) {
            \\    gl_Position.xy = (MVP * vec4(VertexPosition, 1.0)).xy;
            \\    gl_Position.z = 0.0;
            \\    gl_Position.w = 1.0;
            \\    FragmentColor = VertexColor;
            \\    FragmentUV = VertexUV;
            \\}
        ,
            \\#version 330 core
            \\in vec4 FragmentColor;
            \\in vec2 FragmentUV;
            \\out vec4 OutputColor;
            \\void main() {
            \\    OutputColor = vec4(FragmentColor.rgb, FragmentColor.a * (pow(0.01, length(FragmentUV)) - 0.01));
            \\}
        , null);

        self.attrib_position = self.program.getAttributeLocation(c"VertexPosition");
        self.attrib_color = self.program.getAttributeLocation(c"VertexColor");
        self.attrib_uv = self.program.getAttributeLocation(c"VertexUV");
        self.uniform_mvp = self.program.getUniformLocation(c"MVP");

        return self;
    }

    pub fn destroy(self: &LightShader) {
        self.program.destroy();
    }
};

const LightSetup = struct {
    lights: ArrayList(Light),

    pub fn init() -> LightSetup {
        LightSetup {
            .lights = ArrayList(Light).init()
        }
    }

    pub fn destroy() {
        self.lights.deinit();
    }

    pub fn add(light: &Light) -> &Light {
        self.lights.append(light);
        return light;
    }

    pub fn remove(light: &Light) {
        self.lights.remove(light);
    }
};


const Colour = struct {
    rgba: [4]f32,

    pub fn init(r: f32, g: f32, b: f32, a: f32) {
        Colour {
            .rgba = []f32 { r, g, b, a } 
        }
    }
};

const Material = struct {
    diffuse: Colour,
    ambient: Colour,
    specular: Colour,
    emission: Colour,
    shininess: f32,

    pub fn apply(self: &Material) {
        c.glMaterialfv(GL_FRONT, GL_AMBIENT, self.ambient.rgba);
        c.glMaterialfv(GL_FRONT, GL_DIFFUSE, self.diffuse.rgba);
        c.glMaterialfv(GL_FRONT, GL_SPECULAR, self.specular.rgba);
        c.glMaterialfv(GL_FRONT, GL_EMISSION, self.emission.rgba);
        c.glMaterialf(GL_FRONT, GL_SHININESS, self.shininess);
    }
};

