use @import("../system/index.zig");
use @import("../math/index.zig");

pub const ShaderProgram = struct {
    programID: c.GLuint,
    vertexShaderID: c.GLuint,
    fragmentShaderID: c.GLuint,
    geometryShaderID: ?c.GLuint,
    numAttributes: u32,
    numUniforms: u32,

    pub fn init(vertex_source: []const u8, frag_source: []const u8, geometry_source: ?[]u8 )ShaderProgram {
        var self = ShaderProgram {
            .programID = undefined,
            .vertexShaderID = undefined,
            .fragmentShaderID = undefined,
            .geometryShaderID = null,
            .numAttributes = 0,
            .numUniforms = 0,
        };

        self.vertexShaderID = compile(vertex_source, c"vertex", c.GL_VERTEX_SHADER);
        self.fragmentShaderID = compile(frag_source, c"fragment", c.GL_FRAGMENT_SHADER);
        self.geometryShaderID = if ( geometry_source) | geo_source | 
            compile(geo_source, c"geometry", c.GL_GEOMETRY_SHADER)
        else 
            null;
        
        self.programID = c.glCreateProgram();

        self.link();

        debug.assertNoErrorGL();

        if ( self.geometryShaderID) | geo_id | {
            c.glDetachShader(self.programID, geo_id);
        }
        c.glDetachShader(self.programID, self.fragmentShaderID);
        c.glDetachShader(self.programID, self.vertexShaderID);

        if ( self.geometryShaderID) | geo_id | {
            c.glDeleteShader(geo_id);
        }
        c.glDeleteShader(self.fragmentShaderID);
        c.glDeleteShader(self.vertexShaderID);

        return self;
    }

    fn compile(source: []const u8, name: *const u8, kind: c.GLenum)c.GLuint {
        const shader_id = c.glCreateShader(kind);
        const source_ptr: ?*const u8 = &source[0];
        const source_len = c.GLint(source.len);
        
        c.glShaderSource(shader_id, 1, &source_ptr, &source_len);
        c.glCompileShader(shader_id);

        var ok: c.GLint = undefined;
        c.glGetShaderiv(shader_id, c.GL_COMPILE_STATUS, &ok);
        if (ok != 0)
            return shader_id;

        var error_size: c.GLint = undefined;
        c.glGetShaderiv(shader_id, c.GL_INFO_LOG_LENGTH, &error_size);

        const message = c.mem.alloc(u8, usize(error_size)) catch unreachable;
        c.glGetShaderInfoLog(shader_id, error_size, &error_size, &message[0]);
        _ = warn("Error compiling {} shader:\n{}\n", std.cstr.toSliceConst(name), std.cstr.toSliceConst(message.ptr));
        c.abort();  
    }

    pub fn setUniform_int(sp: *const ShaderProgram, uniform_id: c.GLint, value: c_int) void {
        c.glUniform1i(uniform_id, value);
    }

    pub fn setUniform_float(sp: *const ShaderProgram, uniform_id: c.GLint, value: f32) void {
        c.glUniform1f(uniform_id, value);
    }

    pub fn setUniform_vec3(sp: *const ShaderProgram, uniform_id: c.GLint, value: *const Vec3) void {
        c.glUniform3fv(uniform_id, 1, @ptrCast(&f32, @alignCast(4, value)));
    }

    pub fn setUniform_vec4(sp: *const ShaderProgram, uniform_id: c.GLint, value: *const Vec4) void {
        c.glUniform4fv(uniform_id, 1, @ptrCast(&f32, @alignCast(4, value)));
    }

    pub fn setUniform_mat4(sp: *const ShaderProgram, uniform_id: c.GLint, value: *const Mat4) void {
        c.glUniformMatrix4fv(uniform_id, 1, c.GL_FALSE, &value.data[0][0]);
    }

    pub fn link(sp: *const ShaderProgram) void {
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
        const message = c.mem.alloc(u8, usize(error_size)) catch unreachable;
        c.glGetProgramInfoLog(sp.programID, error_size, &error_size, &message[0]);
        _ = warn("Error linking shader program: {}\n", std.cstr.toSliceConst(message.ptr));
        c.abort();
    }

    pub fn addAttribute(sp: *const ShaderProgram, name: []*const u8) void {
        c.glBindAttribLocation(sp.programID, sp.numAttributes, name);
        sp.numAttributes += 1;
    }

    pub fn addUniform(sp: *const ShaderProgram, name: []*const u8) void {
        c.glBindAttribLocation(sp.programID, sp.numAttributes, name);
        sp.numAttributes += 1;
    }

    pub fn getAttributeLocation(sp: *const ShaderProgram, name: *const u8)c.GLint {
        const id = c.glGetAttribLocation(sp.programID, name);
        if (id == -1) {
            _ = warn("invalid attrib: {}\n", std.cstr.toSliceConst(name));
            c.abort();
        }
        return id;
    }

    pub fn getUniformLocation(sp: *const ShaderProgram, name: *const u8)c.GLint {
        const id = c.glGetUniformLocation(sp.programID, name);
        if (id == -1) {
            _ = warn("invalid uniform: {}\n", std.cstr.toSliceConst(name));
            c.abort();
        }
        return id;
    }

    pub fn bind(sp: *const ShaderProgram) void {
        c.glUseProgram(sp.programID);
        // { var i = u8(0); while (i < sp.numAttributes; i += 1) {
        //     c.glEnableVertexAttribArray(i);
        // }}
    }

    pub fn unbind(sp: *const ShaderProgram) void {
        // { var i = u8(0); while (i < sp.numAttributes; i += 1) {
        //     c.glDisableVertexAttribArray(i);
        // }}
        c.glUseProgram(0);
    }

    pub fn destroy(sp: *const ShaderProgram) void {
        if (sp.programID != 0) c.glDeleteProgram(sp.programID);
    }
};

const ShaderManager = struct {
    // replace with linear map, comptime
    shaders: ArrayList(Shader),

    pub fn init()ShaderManager {
        return ShaderManager {
            .shaders =  ArrayList(Shader).init(),
        };
    }

    pub fn getShader(self: *Self, name: []const u8)?Shader {
        for (self.shaders.toSlice()) | s | {
            if (mem.eql(s.name, name)) return s;
        }
        return null;
    }

    pub fn add(self: *Self, shader: *const Shader) void {
        self.shaders.push(shader);
    }

    pub fn clean(self: *Self) void {
        for (self.shaders.toSlice()) | s | {
            s.destroy();
        }
    }

    pub fn reload_shader(shader: *const Shader) void {
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
