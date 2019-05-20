const std = @import("std");
const assert = std.debug.assert;
const os = std.os;

pub const allocator = std.heap.c_allocator;
pub const panic = std.debug.panic;

const c = @import("platform.zig");

const game = @import("game.zig");
const debug_gl = @import("debug_gl.zig");
const AllShaders = @import("all_shaders.zig").AllShaders;
const StaticGeometry = @import("static_geometry.zig").StaticGeometry;
const RawImage = @import("png.zig").RawImage;
const embedImage = @import("png.zig").embedImage;

const font_raw = embedImage("../assets/fontx.bin",  576, 128, 32);

export fn onKeyDown(keyCode: c_int, state: u8) void {
  if (state == 0) return;
  const t = &game.tetris_state;
  switch (keyCode) {
      c.KEY_ESCAPE, c.KEY_P => game.userTogglePause(t),
      c.KEY_SPACE => game.userDropCurPiece(t),
      c.KEY_DOWN => game.userCurPieceFall(t),
      c.KEY_LEFT => game.userMoveCurPiece(t, -1),
      c.KEY_RIGHT => game.userMoveCurPiece(t, 1),
      c.KEY_UP => game.userRotateCurPiece(t, 1),
      c.KEY_SHIFT => game.userRotateCurPiece(t, -1),
      c.KEY_R => game.restartGame(t),
      c.KEY_CTRL => game.userSetHoldPiece(t),
      else => {},
  }
}

export fn onKeyUp(button: c_int, x: c_int, y: c_int) void {

}

export fn onMouseDown(button: c_int, x: c_int, y: c_int) void {

}

export fn onMouseUp(button: c_int, x: c_int, y: c_int) void {

}

export fn onMouseMove(x: c_int, y: c_int) void {

}

var vertex_array_object: c.GLuint = undefined;
export fn onInit() void {
    const t = &game.tetris_state;
    t.framebuffer_width = 500;
    t.framebuffer_height = 660;

    c.glGenVertexArrays(1, &vertex_array_object);
    c.glBindVertexArray(vertex_array_object);

    t.all_shaders = AllShaders.create();
    t.static_geometry = StaticGeometry.create();
    t.font.init(font_raw, game.font_char_width, game.font_char_height) catch unreachable;

    t.prng = std.rand.DefaultPrng.init(@intCast(u64, c.getRandomSeed()));
    t.rand = &t.prng.random;

    game.resetProjection(t);

    game.restartGame(t);

    c.glClearColor(0.0, 0.0, 0.0, 1.0);
    c.glEnable(c.GL_BLEND);
    c.glBlendFunc(c.GL_SRC_ALPHA, c.GL_ONE_MINUS_SRC_ALPHA);
    c.glPixelStorei(c.GL_UNPACK_ALIGNMENT, 1);

    c.glViewport(0, 0, t.framebuffer_width, t.framebuffer_height);

    debug_gl.assertNoError();
}

var prev_time: c_int = 0;
export fn onAnimationFrame(now_time: c_int) void {
    const t = &game.tetris_state;
    const elapsed = @intToFloat(f32, now_time - prev_time) / 1000.0;
    prev_time = now_time;

    c.glClear(c.GL_COLOR_BUFFER_BIT | c.GL_DEPTH_BUFFER_BIT | c.GL_STENCIL_BUFFER_BIT);

    game.nextFrame(t, elapsed);
    game.draw(t);
}

export fn onDestroy() void {
    const t = &game.tetris_state;
    t.all_shaders.destroy();
    t.static_geometry.destroy();
    t.font.deinit();
    c.glDeleteVertexArrays(1, &vertex_array_object);
}
