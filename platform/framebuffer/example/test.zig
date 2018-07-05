const fb = @import("../src/index.zig");

const WIDTH: c_ulong = 800;
const HEIGHT: c_ulong = 600;

var s_buffer = []u32 {0} ** (WIDTH * HEIGHT);

pub const platform_fb = fb.win32_fb;

pub fn main() error!void {
    try platform_fb.open("Noise Test", c_long(WIDTH), c_long(HEIGHT));

    while (true) {
        var i: usize = 0;
        var state: c_int = 0;

        while (i < WIDTH * HEIGHT) : (i += 1) {
            s_buffer[i] = fb.rgb(@truncate(u8, i), @truncate(u8, i), @truncate(u8, i)); 
        }

        state = platform_fb.update(s_buffer[0..]);

        if (state < 0) break;
    }

    platform_fb.close();
}
