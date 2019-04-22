const builtin = @import("builtin");
const is_windows = builtin.os == builtin.Os.windows;

const glfw = @import("glfw/index.zig");
const fb = if (is_windows) @import("win32/win32_fb.zig") else @import("xlib/xlib_fb.zig");
const gl = if (is_windows) @import("win32/win32_gl.zig") else @import("xlib/xlib_gl.zig");

pub fn rgb(r: u8, g: u8, b: u8) u32 {
    return u32(r) << 16 | u32(g) << 8 | b;
}

pub const Platform = struct {
    open: fn(name: []const u8, width: u32, height: u32) anyerror!void,
    update: fn(buffer: []u32) anyerror!void,
    close: fn() void,
};

pub const platform_glfw = Platform {
    .open = glfw.open,
    .update = glfw.update,
    .close = glfw.close
};

pub const platform_fb = Platform {
    .open = fb.open,
    .update = fb.update,
    .close = fb.close
};

pub const platform_gl = Platform {
    .open = gl.open,
    .update = gl.update,
    .close = gl.close
};

pub const platform_term = Platform {
    .open = term.open,
    .update = term.update,
    .close = term.close
};

