const win = @import("win32.zig");
const x11 = @import("x11.zig");

pub fn rgb(r: u8, g: u8, b: u8) u32 {
    return u32(r) << 16 | u32(g) << 8 | b;
}

pub const FB = struct {
    open: fn(name: []const u8, width: c_long, height: c_long) error!void,
    update: fn(buffer: []u32) c_int,
    close: fn() void,
};

pub const win32_fb = FB {
    .open = win.open,
    .update = win.update,
    .close = win.close
};

pub const x11_fb = FB {
    .open = x11.open,
    .update = x11.update,
    .close = x11.close
};
