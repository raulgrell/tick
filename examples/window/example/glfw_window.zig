const M_PI : f32 = 3.141592653589793;
const attrib_index : c_uint =  0;

const Context = struct {
    program: c.GLuint,
    uniform_time: c.GLint,
    vbo_point: c.GLuint,
    vao_point: c.GLuint,
    framecount: long,
    time: f64,
};

const square = []f32  {
    -1.0,  1.0,
    -1.0, -1.0,
     1.0,  1.0,
     1.0, -1.0
};

pub fn main() !void {

    // TODO: Init window

    /* Shader sources */
    const vert_shader =
        \\#version 330
        \\layout(location = 0) in vec2 point;
        \\uniform float time;
        \\void main() {
        \\    mat2 rotate = mat2(cos(time), -sin(time), sin(time), cos(time));
        \\    gl_Position = vec4(0.75 * rotate * point, 0.0, 1.0);
        \\}
    ;

    const frag_shader =
        \\#version 330
        \\out vec4 color;
        \\void main() {
        \\    color = vec4(1, 0.15, 0.15, 0);
        \\}
    ;

    /* Compile and link OpenGL program */
    const vert = compile_shader(c.GL_VERTEX_SHADER, vert_shader);
    const frag = compile_shader(c.GL_FRAGMENT_SHADER, frag_shader);
    context.program = link_program(vert, frag);
    context.uniform_time = c.glGetUniformLocation(context.program, "time");
    c.glDeleteShader(frag);
    c.glDeleteShader(vert);

    /* Prepare vertex buffer object (VBO) */
    c.glGenBuffers(1, &context.vbo_point);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, context.vbo_point);
    c.glBufferData(c.GL_ARRAY_BUFFER, @sizeOf(square), square, c.GL_STATIC_DRAW);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);

    /* Prepare vertrex array object (VAO) */
    c.glGenVertexArrays(1, &context.vao_point);
    c.glBindVertexArray(context.vao_point);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, context.vbo_point);
    c.glVertexAttribPointer(attrib_index, 2, c.GL_FLOAT, c.GL_FALSE, 0, 0);
    c.glEnableVertexAttribArray(attrib_index);
    c.glBindBuffer(c.GL_ARRAY_BUFFER, 0);
    c.glBindVertexArray(0);

    /* Start main loop */
    context.time = c.glfwGetTime();
    context.framecount = 0;

    while (!glfwWindowShouldClose(context.window)) {
        c.glClearColor(0.15, 0.15, 0.15, 1);
        c.glClear(c.GL_COLOR_BUFFER_BIT);

        c.glUseProgram(context.program);
        c.glUniform1f(context.uniform_time, context.time);
        c.glBindVertexArray(context.vao_point);
        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, countof(square) / 2);
        c.glBindVertexArray(0);
        c.glUseProgram(0);

        c.glfwSwapBuffers(context.window);
        c.glfwPollEvents();
        
        context.time = c.glfwGetTime();
        context.framecount++;
    }
    
    std.debug.warn("Exiting ...\n");

    /* Cleanup and exit */
    c.glDeleteVertexArrays(1, &context.vao_point);
    c.glDeleteBuffers(1, &context.vbo_point);
    c.glDeleteProgram(context.program);

    c.glfwTerminate();
}

pub fn compileShader(shader_type: c.GLenum, source: *const u8) c.GLuint {
    var shader = c.glCreateShader(shader_type);
    c.glShaderSource(shader, 1, &source, null);
    c.glCompileShader(shader);
    var param: c.GLint = undefined;
    c.glGetShaderiv(shader, c.GL_COMPILE_STATUS, &param);
    if (param == 0) {
        var log: [4096]c.GLchar = undefined;
        c.glGetShaderInfoLog(shader, @sizeOf(log), null, log);
        std.debug.warn("error: {}: {}\n", if (shader_type == c.GL_FRAGMENT_SHADER) "frag" else "vert", log);
        c.abort();
    }
    return shader;
}

pub fn linkProgram(vert: c.GLuint, frag: c.GLuint) c.GLuint {
    var program = c.glCreateProgram();
    c.glAttachShader(program, vert);
    c.glAttachShader(program, frag);
    c.glLinkProgram(program);

    var param: c.GLint = undefined;
    c.glGetProgramiv(program, c.GL_LINK_STATUS, &param);
    if (param == 0) {
        var log: [4096]c.GLchar = undefined;
        c.glGetProgramInfoLog(program, @sizeOf(log), null, log);
        std.debug.warn("error: link: {}\n", log);
        c.abort();
    }
    return program;
}
