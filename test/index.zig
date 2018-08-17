const std = @import("std");
const core  = @import("../src/core/index.zig");

extern GAME: core.API;

pub fn main() !void {
    var args_it = std.os.args();
    var args_list = std.ArrayList([]const u8).init(std.debug.global_allocator);
    defer args_list.deinit();

    while (args_it.next(allocator)) | arg | {
        try args_list.append(try unwrapArg(arg));
    }

    var app = core.App.init();
    
    switch(args_list.len) {
        1 => { app.run(GAME); },
        2 => { app.runHot("./zig-cache/libgame.so", "GAME"); },
        else => { showUsage(); }
    }
}

fn showUsage() void {
    std.debug.warn("Usage: lang [path]\n");
}