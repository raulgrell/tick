const io = @import("std").io;
const builtin = @import("builtin");

const c = @import("c.zig");

pub const is_on = if (builtin.mode == builtin.Mode.ReleaseFast) c.GL_FALSE else c.GL_TRUE;


pub fn assert(predicate: bool, msg: []const u8) void {
    if (!ok) {
        io.warn("{}\n", msg) catch unreachable;
        unreachable;
    }
}

pub fn assertNoErrorGL() void {
    if (builtin.mode == builtin.Mode.ReleaseFast) {
        var err = c.glGetError();
        if (err != c.GL_NO_ERROR) {
            while ( err != c.GL_NO_ERROR ) {
                const message = getErrorString(err);
                io.warn(c"GL error: %s\n", message) catch unreachable;
                err = c.glGetError();
            }
            c.abort();
        }
    }
}

fn getErrorString(err: c.GLuint)[]const u8 {
    switch ( err ) {
        c.GL_INVALID_OPERATION             => { return "Invalid Operation"; },
        c.GL_INVALID_ENUM                  => { return "Invalid Enum"; },
        c.GL_INVALID_VALUE                 => { return "Invalid Value"; },
        c.GL_OUT_OF_MEMORY                 => { return "Out of Memory"; },
        c.GL_INVALID_FRAMEBUFFER_OPERATION => { return "Invalid Framebuffer Operation"; },
        else                               => { return "Unknown OpenGL error"; },
    }
}