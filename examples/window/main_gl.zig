const fb = @import("window.zig");
const platform_fb = gl.platform_fb;

const WIDTH: u32 = 800;
const HEIGHT: u32 = 600;

var s_buffer = []u32 {0} ** (WIDTH * HEIGHT);

pub fn main() !void {
    try platform_fb.open("Framebuffer Test\x00", WIDTH, HEIGHT);

    var x: usize = 0;

    while (true) {
        var i: usize = 0;
        while (i < WIDTH * HEIGHT) : (i += 1) {
            s_buffer[i] = fb.rgb(@truncate(u8, i * 3 + x * 2), @truncate(u8, i*2 + x * 5), @truncate(u8, i*5 + 5 * 3)); 
        }
        platform_fb.update(s_buffer[0..]) catch break;
        x = (x + 1) % 255;
    }

    platform_fb.close();
}
