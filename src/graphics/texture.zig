const t = @import("../index.zig");

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

    pub fn destroy(self: *TextureShader) void {
        self.program.destroy();
    }
};


pub const Texture = struct {
    img: asset.PngImage,
    id: c.GLuint,

    pub fn init(compressed_bytes: []const u8) !Texture {
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
        c.glTexImage2D(
            c.GL_TEXTURE_2D, 0, c_int(t.img.color_type), 
            c_int(t.img.width), c_int(t.img.height), 0,
            c_uint(t.img.color_type), c.GL_UNSIGNED_BYTE, t.img.raw.ptr);

        c.glGenerateMipmap(c.GL_TEXTURE_2D);
        c.glBindTexture(c.GL_TEXTURE_2D, 0);

        return t;
    }

    pub fn bind(t: *Texture) void {
        c.glActiveTexture(c.GL_TEXTURE0 + t.id);
        c.glBindTexture(c.GL_TEXTURE_2D, t.id);
    }

    pub fn unbind(t: *Texture) void {
        c.glBindTexture(c.GL_TEXTURE_2D, 0);
    }
    
    pub fn deinit(t: *Texture) void {
        c.glDeleteTextures(1, &t.id);
        t.img.destroy();
    }
};
