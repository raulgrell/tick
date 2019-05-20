const std = @import("std");
const glfw = @import("window.zig");
const c = glfw.c;

const attrib_index : c_uint =  0;

const Context = struct {
    program: c.GLuint,
    uniform_time: c.GLint,
    vbo_point: c.GLuint,
    vao_point: c.GLuint,
    framecount: usize,
    time: f64,
};

const square = []f32 {
    -1.0, -1.0,
    -1.0,  1.0,
     1.0,  1.0,
     1.0, -1.0
};

const vert_shader =
    c\\#version 330
    c\\layout(location = 0) in vec2 point;
    c\\out vec4 point_color;
    c\\uniform float time;
    c\\void main() {
    c\\    gl_Position = vec4(point, 0.0, 1.0);
    c\\}
;

const frag_shader =
    c\\#version 330
    c\\in vec4 point_color;
    c\\out vec4 color;
    c\\uniform float time;
    c\\void main() {
    c\\    color = point_color;
    c\\}
;

pub fn main() !void {
    // Init window
    var window = try glfw.Window.init(c"App", 800, 600, glfw.WindowMode.Windowed);
    var context = Context {
        .program = 0,
        .uniform_time = 0,
        .vbo_point = 0,
        .vao_point = 0,
        .framecount = 0,
        .time = 0,
    };

    // Compile and link OpenGL program
    const vert = try compileShader(c.GL_VERTEX_SHADER, vert_shader);
    const frag = try compileShader(c.GL_FRAGMENT_SHADER, frag_shader);
    context.program = try linkProgram(vert, frag);
    context.uniform_time = c.glGetUniformLocation(context.program, c"time");
    c.glDeleteShader(frag);
    c.glDeleteShader(vert);

    // Prepare vertex buffer object (VBO)
    c.glGenBuffers(1, &context.vbo_point);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, context.vbo_point);
    c.glBufferData(c.GL_ARRAY_BUFFER, @intCast(c_long, square.len), &square, c.GL_STATIC_DRAW);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);

    // Prepare vertrex array object (VAO)
    c.glGenVertexArrays(1, &context.vao_point);
    c.glBindVertexArray(context.vao_point);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, context.vbo_point);
    c.glVertexAttribPointer(attrib_index, 2, c.GL_FLOAT, c.GL_FALSE, 0, null);
    c.glEnableVertexAttribArray(attrib_index);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);
    c.glBindVertexArray(0);

    // Start main loop
    context.time = c.glfwGetTime();
    context.framecount = 0;

    glfw.Window.setClearColor(0.15, 0.15, 0.15, 1);

    while (window.running()) {
        window.clear();

        c.glUseProgram(context.program);
        c.glUniform1f(context.uniform_time, @floatCast(f32, context.time));
        c.glBindVertexArray(context.vao_point);
        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, @intCast(c_int, square.len));
        c.glBindVertexArray(0);
        c.glUseProgram(0);

        window.update();
        
        context.time = c.glfwGetTime();
        context.framecount += 1;
    }
    
    std.debug.warn("Exiting ...\n");

    // Cleanup and exit
    c.glDeleteVertexArrays(1, &context.vao_point);
    c.glDeleteBuffers(1, &context.vbo_point);
    c.glDeleteProgram(context.program);

    c.glfwTerminate();
}


pub fn compileShader(shader_type: c.GLenum, source: ?[*]const u8) !c.GLuint {
    var shader = c.glCreateShader(shader_type);
    c.glShaderSource(shader, 1, @ptrCast([*]const ?[*]const u8, &source), null);
    c.glCompileShader(shader);
    var param: c.GLint = undefined;
    c.glGetShaderiv(shader, c.GL_COMPILE_STATUS, &param);
    if (param == 0) {
        var log: [4096]c.GLchar = undefined;
        c.glGetShaderInfoLog(shader, @intCast(c_int, log.len), null, &log);
        std.debug.warn("Compile error: {}: {}\n", if (shader_type == c.GL_FRAGMENT_SHADER) "frag" else "vert", log);
        return error.CompileShader;
    }
    return shader;
}

pub fn linkProgram(vert: c.GLuint, frag: c.GLuint) !c.GLuint {
    var program = c.glCreateProgram();
    c.glAttachShader(program, vert);
    c.glAttachShader(program, frag);
    c.glLinkProgram(program);

    var param: c.GLint = undefined;
    c.glGetProgramiv(program, c.GL_LINK_STATUS, &param);
    if (param == 0) {
        var log: [4096]c.GLchar = undefined;
        c.glGetProgramInfoLog(program, @intCast(c_int, log.len), null, &log);
        std.debug.warn("Link error: {}\n", log);
        return error.LinkShader;
    }
    return program;
}