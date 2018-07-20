const builtin = @import("builtin");
const is_windows = builtin.os == builtin.Os.windows;

pub use @cImport({
    // C
    @cInclude("math.h");
    @cInclude("stdlib.h");
    @cInclude("stdio.h");
    @cInclude("stdint.h");

    if (is_windows) {

    } else {
        @cInclude("unistd.h");
        @cInclude("sys/types.h");
        @cInclude("sys/stat.h");
        @cInclude("dlfcn.h");
    }

    // GL
    @cInclude("glad/glad.h");
    
    // Libs
    @cInclude("png.h");
    @cInclude("GLFW/glfw3.h");
    @cInclude("soundio/soundio.h");
});

