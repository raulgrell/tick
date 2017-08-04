pub const c = @cImport({
    @cInclude("stdlib.h");
    @cInclude("stdio.h");
});

const Allocator = @import("memory.zig").Allocator;

pub const LibcAllocator = struct {
    allocator: Allocator,
    
    pub fn init() -> %LibcAllocator {
        LibcAllocator {
            .allocator = Allocator {
                .allocFn = malloc,
                .reallocFn = realloc,
                .freeFn = free,
            }
        }
    }

    fn malloc(self: &Allocator, size: usize, alignment: u8) -> %[]u8 {
        return @ptrCast(&u8, c.malloc(c.size_t(size)) ?? return error.NoMem)[0..size];
    }

    fn realloc(self: &Allocator, old_mem: []u8, new_size: usize, alignment: u8) -> %[]u8 {
        return @ptrCast(&u8, c.realloc(@ptrCast(&c_void, old_mem.ptr), c.size_t(new_size)) ?? return error.NoMem)[0..new_size];
    }

    fn free(self: &Allocator, old_mem: []u8) -> void {
        c.free(@ptrCast(&c_void, old_mem.ptr));
    }
};

pub var mem = %%LibcAllocator.init();

const S = struct { s: &S, };

test "LibcAllocator" {
    
    var s_array = %%mem.allocator.alloc(S,8);

    { var i = usize(0); while(i < 8) : (i += 1) {
        s_array[i].s = %%mem.allocator.create(S);
    }}

    { var i = usize(0); while(i < 8) : (i += 1) {
        mem.allocator.destroy(s_array[i].s);
    }}

    mem.allocator.free(s_array);
}
