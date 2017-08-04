use @import("align.zig");
use @import("allocators.zig");
// use @import("base64.zig");
use @import("c.zig");
// use @import("combinator.zig");
// use @import("float.zig");
// use @import("generic.zig");
use @import("hash.zig");
// use @import("huffman.zig");
use @import("memory.zig");
// use @import("observer.zig");
// use @import("parse.zig");
// use @import("regex.zig");
// use @import("search.zig");
// use @import("sort.zig");

use @import("containers/arrayList.zig");

const io = @import("std").io;

pub fn assert(predicate: bool, msg: []const u8) {
    if (!ok) {
        %%io.stdout.printf("{}\n", msg);
        unreachable // assertion failure
    }
}

test "Lib" {

}