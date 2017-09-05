use @import("../system/index.zig");
use @import("../math/index.zig");

pub const ShaderProgram = struct {
    programID: c.GLuint,
    vertexShaderID: c.GLuint,
    fragmentShaderID: c.GLuint,
    geometryShaderID: ?c.GLuint,
    numAttributes: u32,
    numUniforms: u32,

    pub fn init(vertex_source: []const u8, frag_source: []const u8, geometry_source: ?[]u8 ) -> ShaderProgram {
        var sp = ShaderProgram {
            .programID = undefined,
            .vertexShaderID = undefined,
            .fragmentShaderID = undefined,
            .geometryShaderID = null,
            .numAttributes = 0,
            .numUniforms = 0,
        };

        sp.vertexShaderID = compile(vertex_source, c"vertex", c.GL_VERTEX_SHADER);
        sp.fragmentShaderID = compile(frag_source, c"fragment", c.GL_FRAGMENT_SHADER);
        sp.geometryShaderID = if ( geometry_source) | geo_source | {
            compile(geo_source, c"geometry", c.GL_GEOMETRY_SHADER)
        } else {
            null
        };
        
        sp.programID = c.glCreateProgram();

        sp.link();

        debug.assertNoErrorGL();

        if ( sp.geometryShaderID) | geo_id | {
            c.glDetachShader(sp.programID, geo_id);
        }
        c.glDetachShader(sp.programID, sp.fragmentShaderID);
        c.glDetachShader(sp.programID, sp.vertexShaderID);

        if ( sp.geometryShaderID) | geo_id | {
            c.glDeleteShader(geo_id);
        }
        c.glDeleteShader(sp.fragmentShaderID);
        c.glDeleteShader(sp.vertexShaderID);

        return sp;
    }

    fn compile(source: []const u8, name: &const u8, kind: c.GLenum) -> c.GLuint {
        const shader_id = c.glCreateShader(kind);
        const source_ptr: ?&const u8 = &source[0];
        const source_len = c.GLint(source.len);
        
        c.glShaderSource(shader_id, 1, &source_ptr, &source_len);
        c.glCompileShader(shader_id);

        var ok: c.GLint = undefined;
        c.glGetShaderiv(shader_id, c.GL_COMPILE_STATUS, &ok);
        if (ok != 0)
            return shader_id;

        var error_size: c.GLint = undefined;
        c.glGetShaderiv(shader_id, c.GL_INFO_LOG_LENGTH, &error_size);

        const message = %%c.mem.alloc(u8, usize(error_size));
        c.glGetShaderInfoLog(shader_id, error_size, &error_size, &message[0]);
        _ = c.printf(c"Error compiling %s shader:\n%s\n", name, &message[0]);
        c.abort();  
    }

    pub fn setUniform_int(sp: &const ShaderProgram, uniform_id: c.GLint, value: c_int) {
        c.glUniform1i(uniform_id, value);
    }

    pub fn setUniform_float(sp: &const ShaderProgram, uniform_id: c.GLint, value: f32) {
        c.glUniform1f(uniform_id, value);
    }

    pub fn setUniform_vec3(sp: &const ShaderProgram, uniform_id: c.GLint, value: &const Vec3) {
        c.glUniform3fv(uniform_id, 1, @ptrCast(&f32, value));
    }

    pub fn setUniform_vec4(sp: &const ShaderProgram, uniform_id: c.GLint, value: &const Vec4) {
        c.glUniform4fv(uniform_id, 1, @ptrCast(&f32, value));
    }

    pub fn setUniform_mat4(sp: &const ShaderProgram, uniform_id: c.GLint, value: &const Mat4) {
        c.glUniformMatrix4fv(uniform_id, 1, c.GL_FALSE, &value.data[0][0]);
    }

    pub fn link(sp: &const ShaderProgram) -> void {
        c.glAttachShader(sp.programID, sp.vertexShaderID);
        c.glAttachShader(sp.programID, sp.fragmentShaderID);
        if (sp.geometryShaderID) | geo_id | {
            c.glAttachShader(sp.programID, geo_id);
        }

        c.glLinkProgram(sp.programID);

        var ok: c.GLint = undefined;
        c.glGetProgramiv(sp.programID, c.GL_LINK_STATUS, &ok);
        if (ok != 0) {
            return;
        }

        var error_size: c.GLint = undefined;
        c.glGetProgramiv(sp.programID, c.GL_INFO_LOG_LENGTH, &error_size);
        const message = %%c.mem.alloc(u8, usize(error_size));
        c.glGetProgramInfoLog(sp.programID, error_size, &error_size, &message[0]);
        _ = c.printf(c"Error linking shader program: %s\n", &message[0]);
        c.abort();
    }

    pub fn addAttribute(sp: &const ShaderProgram, name: []&const u8) -> void {
        c.glBindAttribLocation(sp.programID, sp.numAttributes, name);
        sp.numAttributes += 1;
    }

    pub fn addUniform(sp: &const ShaderProgram, name: []&const u8) -> void {
        c.glBindAttribLocation(sp.programID, sp.numAttributes, name);
        sp.numAttributes += 1;
    }

    pub fn getAttributeLocation(sp: &const ShaderProgram, name: &const u8) -> c.GLint {
        const id = c.glGetAttribLocation(sp.programID, name);
        if (id == -1) {
            _ = c.printf(c"invalid attrib: %s\n", name);
            c.abort();
        }
        return id;
    }

    pub fn getUniformLocation(sp: &const ShaderProgram, name: &const u8) -> c.GLint {
        const id = c.glGetUniformLocation(sp.programID, name);
        if (id == -1) {
            _ = c.printf(c"invalid uniform: %s\n", name);
            c.abort();
        }
        return id;
    }

    pub fn bind(sp: &const ShaderProgram) -> void {
        c.glUseProgram(sp.programID);
        // { var i = u8(0); while (i < sp.numAttributes; i += 1) {
        //     c.glEnableVertexAttribArray(i);
        // }}
    }

    pub fn unbind(sp: &const ShaderProgram) -> void {
        // { var i = u8(0); while (i < sp.numAttributes; i += 1) {
        //     c.glDisableVertexAttribArray(i);
        // }}
        c.glUseProgram(0);
    }

    pub fn destroy(sp: &const ShaderProgram) -> void {
        if (sp.programID != 0) c.glDeleteProgram(sp.programID);
    }
};

pub const TextureShader = struct {
    program: ShaderProgram,
    attrib_position: c.GLint,
    attrib_color: c.GLint,
    attrib_uv: c.GLint,
    uniform_mvp: c.GLint,
    uniform_tex: c.GLint,

    pub fn init() -> TextureShader {
        var shader: TextureShader = undefined;
        shader.program = ShaderProgram.init(
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

        shader.attrib_position = shader.program.getAttributeLocation(c"VertexPosition");
        shader.attrib_color = shader.program.getAttributeLocation(c"VertexColor");
        shader.attrib_uv = shader.program.getAttributeLocation(c"VertexUV");
        shader.uniform_mvp = shader.program.getUniformLocation(c"MVP");
        shader.uniform_tex = shader.program.getUniformLocation(c"Tex");

        debug.assertNoErrorGL();

        return shader;
    }

    pub fn destroy(shader: &TextureShader) {
        shader.program.destroy();
    }
};

pub const PrimitiveShader = struct {
    program: ShaderProgram,
    attrib_position: c.GLint,
    attrib_color: c.GLint,
    uniform_mvp: c.GLint,
    uniform_color: c.GLint,

    pub fn init() -> PrimitiveShader {
        var shader: PrimitiveShader = undefined;
        shader.program = ShaderProgram.init(
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

        shader.attrib_position = shader.program.getAttributeLocation(c"VertexPosition");
        shader.attrib_color = shader.program.getAttributeLocation(c"VertexColor");
        shader.uniform_mvp = shader.program.getUniformLocation(c"MVP");
        shader.uniform_color = shader.program.getUniformLocation(c"Color");

        return shader;
    }

    pub fn destroy(shader: &PrimitiveShader) {
        shader.program.destroy();
    }
};

const ShaderManager = struct {
    shaders: ArrayList(Shader),

    pub fn init() -> ShaderManager {
        ShaderManager {
            .shaders =  ArrayList(Shader).init(),
        }
    }

    pub fn getShader(self: &Self, name: []const u8) -> ?Shader {
        for (self.shaders.toSlice()) | s | {
            if (mem.eql(s.name, name)) return s;
        }
        return null;
    }

    pub fn add(self: &Self, shader: &const Shader) {
        self.shaders.push(shader);
    }

    pub fn clean(self: &Self) {
        for (self.shaders.toSlice()) | s | {
            s.destroy();
        }
    }

    pub fn reload_shader(shader: &const Shader) {
        for (self.shaders.toSlice()) | s | {
            if (s == shader) {
                const name = shader.GetName();
                const path = shader.GetFilePath();
                s.destroy();
                s = shader.CreateFromFile(name, path, s);
                return;
            }
        }
    }
};

