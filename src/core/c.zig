const builtin = @import("builtin");
const is_windows = builtin.os == builtin.Os.windows;

pub use @cImport({
    if (is_windows) {
        @cInclude()
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

pub fn ptr(p: var) t: {
    const T = @typeOf(p);
    const info = @typeInfo(@typeOf(p)).Pointer;
    break :t if (info.is_const) ?[*]const info.child else ?[*]info.child;
} {
    return @ptrCast(@typeInfo(@typeOf(this)).Fn.return_type.?, p);
}