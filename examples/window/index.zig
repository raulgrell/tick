
const builtin = @import("builtin");
const is_windows = builtin.os == builtin.Os.windows;
const fb = if (is_windows) @import("win32/win32_fb.zig") else @import("x11/xlib_fb.zig");

pub fn rgb(r: u8, g: u8, b: u8) u32 {
    return u32(r) << 16 | u32(g) << 8 | b;
}

pub const FB = struct {
    open: fn(name: []const u8, width: u32, height: u32) error!void,
    update: fn(buffer: []u32) error!void,
    close: fn() void,
};

pub const platform_fb = FB {
    .open = fb.open,
    .update = fb.update,
    .close = fb.close
};

