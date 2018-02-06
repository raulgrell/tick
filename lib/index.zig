const io = @import("std").io;

use @import("containers/arrayList.zig");

pub const mem = @import("memory.zig");
pub const hash =  @import("hash.zig");
pub const allocators = @import("allocators.zig");

pub fn assert(predicate: bool, msg: []const u8) void {
    if (!ok) {
        %%io.warn("{}\n", msg);
        unreachable; // assertion failure
    }
}
