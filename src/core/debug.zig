const std = @import("std");
const builtin = @import("builtin");

const c = @import("c.zig");

pub const is_on = if (builtin.mode == builtin.Mode.ReleaseFast) c.GL_FALSE else c.GL_TRUE;

pub fn assert(predicate: bool, msg: []const u8) void {
    if (!ok) {
        std.debug.warn("{}\n", msg);
        unreachable;
    }
}

pub fn assertNoErrorGL() void {
    if (builtin.mode == builtin.Mode.ReleaseFast) {
        var err = c.glGetError();
        if (err != c.GL_NO_ERROR) {
            while ( err != c.GL_NO_ERROR ) : (err = c.glGetError()) {
                const message = getErrorString(err);
                std.debug.warn(c"GL error: %s\n", message);
            }
            std.os.abort();
        }
    }
}

fn getErrorString(err: c.GLuint)[]const u8 {
    return switch ( err ) {
        c.GL_INVALID_OPERATION => "Invalid Operation",
        c.GL_INVALID_ENUM => "Invalid Enum",
        c.GL_INVALID_VALUE => "Invalid Value",
        c.GL_OUT_OF_MEMORY => "Out of Memory",
        c.GL_INVALID_FRAMEBUFFER_OPERATION => "Invalid Framebuffer Operation",
        else => "Unknown OpenGL error",
    }
}