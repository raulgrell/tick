const t = @import("../index.zig");

const Lighting = struct {
    lights: ArrayList(Light),

    pub fn init() Lighting {
        return Lighting {
            .lights = ArrayList(Light).init()
        };
    }

    pub fn destroy() void {
        self.lights.deinit();
    }

    pub fn add(light: *Light) *Light {
        self.lights.append(light);
        return light;
    }

    pub fn remove(light: *Light) void {
        self.lights.remove(light);
    }
};

const Light = struct {
    color: Vec4,
    position: Vec3,
    direction: Vec3,
    lightVector: Vec3,
    intensity: f32,
    size: f32,

    pub fn init(direction: *const Vec3, color: *const Vec4, intensity: f32, size: usize)Light {
        return Light {
            .color = color,
            .position = vec3(0, 0, 0),
            .direction = direction,
            .lightVector = vec3(0, 0, 0),
            .intensity = intensity,
            .size = size
        };
    }

    pub fn draw(self: *Light, r: *BatchRenderer) void {
        const destRect = vec4(self.position.x, self.position.y, self.size, self.size );
        const uvRect = vec4(-1.0, -1.0, 2.0, 2.0);
        r.submit(destRect, uvRect, 0, 0, self.colour, 0);
    }

    pub fn render(self: Light, r: *LightRenderer) void {
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

    pub fn init()LightShader {
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

    pub fn destroy(self: *LightShader) void {
        self.program.destroy();
    }
};

const Colour = struct {
    rgba: [4]f32,

    pub fn init(r: f32, g: f32, b: f32, a: f32) void {
        return Colour {
            .rgba = []f32 { r, g, b, a } 
        };
    }
};

const ColourRGBA = struct {
    rgba: [4]u8,

    pub fn init(r: u8, g: u8, b: u8, a: u8) void {
        return ColourRGBA {
            .rgba = []u8 { r, g, b, a } 
        };
    }
};

const ColourRGB = struct {
    rgb: [3]u8,

    pub fn init(r: u8, g: u8, b: u8) void {
        return ColourRGB {
            .rgb = []u8 { r, g, b } 
        };
    }
};

pub fn RGBtoINT(color: *const ColourRGB)u32 {
    return 65536 * color.r + 256 * color.g + color.b;
}

pub fn INTtoRGB(color: u32)ColourRGB {
    return ColourRGB {
        .r = ( color / 65536 ) % 256,
        .g = ( color / 256 ) % 256,
        .b = color % 256,
    };
}

const Material = struct {
    diffuse: Colour,
    ambient: Colour,
    specular: Colour,
    emission: Colour,
    shininess: f32,

    pub fn apply(self: *Material) void {
        c.glMaterialfv(c.GL_FRONT, c.GL_AMBIENT, self.ambient.rgba);
        c.glMaterialfv(c.GL_FRONT, c.GL_DIFFUSE, self.diffuse.rgba);
        c.glMaterialfv(c.GL_FRONT, c.GL_SPECULAR, self.specular.rgba);
        c.glMaterialfv(c.GL_FRONT, c.GL_EMISSION, self.emission.rgba);
        c.glMaterialf(c.GL_FRONT, c.GL_SHININESS, self.shininess);
    }
};

const LightGray  = Vec4.init(200, 200, 200, 255 );   // Light Gray
const Gray       = Vec4.init(130, 130, 130, 255 );   // Gray
const DarkGray   = Vec4.init(80, 80, 80, 255 );      // Dark Gray
const Yellow     = Vec4.init(253, 249, 0, 255 );     // Yellow
const Gold       = Vec4.init(255, 203, 0, 255 );     // Gold
const Orange     = Vec4.init(255, 161, 0, 255 );     // Orange
const Pink       = Vec4.init(255, 109, 194, 255 );   // Pink
const Red        = Vec4.init(230, 41, 55, 255 );     // Red
const Maroon     = Vec4.init(190, 33, 55, 255 );     // Maroon
const Green      = Vec4.init(0, 228, 48, 255 );      // Green
const Lime       = Vec4.init(0, 158, 47, 255 );      // Lime
const DarkGreen  = Vec4.init(0, 117, 44, 255 );      // Dark Green
const SkyBlue    = Vec4.init(102, 191, 255, 255 );   // Sky Blue
const Blue       = Vec4.init(0, 121, 241, 255 );     // Blue
const DarkBlue   = Vec4.init(0, 82, 172, 255 );      // Dark Blue
const Purple     = Vec4.init(200, 122, 255, 255 );   // Purple
const Violet     = Vec4.init(135, 60, 190, 255 );    // Violet
const DarkPurple = Vec4.init(112, 31, 126, 255 );    // Dark Purple
const Beige      = Vec4.init(211, 176, 131, 255 );   // Beige
const Brown      = Vec4.init(127, 106, 79, 255 );    // Brown
const DarkBrown  = Vec4.init(76, 63, 47, 255 );      // Dark Brown
const White      = Vec4.init(255, 255, 255, 255 );   // White
const Black      = Vec4.init(0, 0, 0, 255 );         // Black
const Blank      = Vec4.init(0, 0, 0, 0 );           // Blank (Transparent)
const Magenta    = Vec4.init(255, 0, 255, 255 );     // Magenta
const White      = Vec4.init(255, 255, 255, 255 );   // My own White (raylib logo)