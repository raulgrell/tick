const assert  = @import("std").debug.assert;
const std_mem = @import("std").mem;

const memory   = @import("memory.zig");
const Allocator = memory.Allocator;
const Memory = memory.Memory;

pub const LinearAllocator = struct {
    allocator: Allocator,
    bytes: []u8,
    current_pos: usize,

    fn init(capacity: usize) %LinearAllocator {
        var mem = try Memory.map(capacity);
        return LinearAllocator {
            .allocator = Allocator {
                .allocFn = alloc,
                .reallocFn = realloc,
                .freeFn = free,
            },
            .bytes = mem,
            .current_pos = 0,
        };
    }

    fn deinit(self: &LinearAllocator) void {
        Memory.unmap(self.bytes);
    }

    fn clear(self: &LinearAllocator) void {
        self.current_pos = 0;
    }

    fn alloc(allocator: &Allocator, size: usize, alignment: u8) %[]u8 {
        assert(align.isPowerOfTwo(alignment));
        const self = @fieldParentPtr(LinearAllocator, "allocator", allocator);
        const adjustment = align.forwardAdjustment(self.current_pos, alignment);
        const aligned_address = self.current_pos + adjustment;
        const end_address = aligned_address + size;

        if (end_address > self.bytes.len)
            return error.NoMem;
        
        self.current_pos = end_address;
        return self.bytes[aligned_address..end_address];
    }

    fn realloc(allocator: &Allocator, old_mem: []u8, new_size: usize, alignment: u8) %[]u8  {
        const result = try alloc(allocator, new_size, alignment);
        std_mem.copy(u8, result, old_mem);
        return result;
    }

    fn free(allocator: &Allocator, old_mem:[]u8 ) void {
        // Use clear instead
    }
};

test "LinearAllocator" {
    var a = %%LinearAllocator.init(1024);

    var s_array = %%a.allocator.alloc(S,8);

    { var i = usize(0); while(i < 16) : (i += 1) {
        s_array[i % 8].s = %%a.allocator.create(S);
    }}

    a.clear()
}

pub const ProxyAllocator = struct {
    allocator: Allocator,
    target: &Allocator,
    allocations: usize,
    memory_used: usize,

    fn init(target: &Allocator) ProxyAllocator {
        ProxyAllocator {
            .allocator = Allocator {
                .allocFn = alloc,
                .reallocFn = realloc,
                .freeFn = free,
            },
            .target = target,
            .allocations = 0,
            .memory_used = 0
        }
    }

    fn alloc(allocator: &Allocator, size: usize, alignment: u8) %[]u8 {
        const self = @fieldParentPtr(LinearAllocator, "allocator", allocator);
        self.allocations += 1;
        // const mem = self.allocator.memory.used;
        const object = self.allocator.allocFn(self.allocator, size, alignment);
        // self.memory_used += self.allocator.memory.used - mem;
        return object;
    }

    fn realloc(a: &Allocator, old_mem: []u8, new_size: usize, alignment: u8) %[]u8 {
        return error.Invalid;
    }

    fn free(a: &Allocator, old_mem: []u8)-> void {
        const self = @fieldParentPtr(LinearAllocator, "allocator", allocator);
        self.allocations -= 1;
        // const mem = self.allocator.memory.used;
        self.allocator.freeFn(self.allocator, old_mem);
        // self.memory.used -= mem - self.allocator.memory.used;
    }
};

test "Proxy Allocator" {
    var a = %%LinearAllocator.init(1024);

    var s_array = %%a.allocator.alloc(S,8);

    { var i = usize(0); while(i < 16) : (i += 1) {
        s_array[i % 8].s = %%a.allocator.create(S);
    }}

    a.clear()
}

pub const PoolAllocator = struct {
    allocator: Allocator,
    data: []u8,
    memory_used: usize,
    objectSize: usize,
    objectAlignment: u8,
    objectPool: &usize,

    fn init(comptime T: type, size: usize) %PoolAllocator {
        assert(@sizeOf(T) >= @sizeOf(usize));

        var mem = try Memory.map(size);
        var self = PoolAllocator {
            .allocator = Allocator {
                .allocFn = alloc,
                .reallocFn = realloc,
                .freeFn = free,
            },
            .data = mem,
            .memory_used = 0,
            .objectSize = @sizeOf(T),
            .objectAlignment = @alignOf(T),
            .objectPool = undefined,
        };

        const adjustment = align.forwardAdjustment((usize)(self.data.ptr), self.objectAlignment);
        const capacity = (size - adjustment) / self.objectSize;

        self.objectPool = @ptrCast(&usize, &self.data[adjustment]);

        var free_address = self.objectPool;

        { var i: usize = 0; while(i < capacity - 1) : (i += 1) {
            *free_address = (usize)(&self.data[i * self.objectSize + adjustment]);
            free_address = @intToPtr(&usize, *free_address);
        }}

        return self;
    }

    fn deinit(self: &PoolAllocator) void {
        Memory.unmap(self.bytes);
    }

    fn alloc(a: &Allocator, size: usize, alignment: u8) %[]u8 {
        const self = @fieldParentPtr(PoolAllocator, "allocator", a);

        if (self.memory_used + size >= self.data.len) {
            return error.NoMem;
        }

        const alloc_ptr = *self.objectPool;
        self.objectPool = @intToPtr(&usize, alloc_ptr);
        self.memory_used += size * self.objectSize;
        return ([]u8)(@intToPtr(&usize, alloc_ptr)[0..size]);
    }

    fn realloc(a: &Allocator, old_mem: []u8, new_size: usize, alignment: u8) %[]u8 {
        return error.Invalid;
    }

    fn free(a: &Allocator, old_mem: []u8) void {
        const self = @fieldParentPtr(PoolAllocator, "allocator", a);
        *@ptrCast(&usize, old_mem.ptr) = (usize)(*self.objectPool);
        self.objectPool = @ptrCast(&usize, old_mem.ptr);
        self.memory_used -= old_mem.len;
    }
};

test "PoolAllocator" {
    var a = %%PoolAllocator.init(S,8192);
    var s_array = %%a.allocator.alloc(S,8);

    for (s_array) | *s | {
        (*s).s = %%a.allocator.create(S);
    }

    for (s_array) | s | {
        a.allocator.destroy(s.s);
    }

    a.allocator.free(s_array);
}

pub const StackAllocator = struct {
    allocator: Allocator,
    data: []u8,
    allocations: usize,
    curr_address: usize,
    prev_address: usize,

    const AllocationHeader = struct {
        prev_address: usize,
        adjustment: usize,
    };

    fn init(capacity: usize) %StackAllocator {
        var mem = try Memory.map(capacity);
        return StackAllocator {
            .allocator = Allocator {
                .allocFn = alloc,
                .reallocFn = realloc,
                .freeFn = free,
            },
            .data = mem,
            .allocations = 0,
            .curr_address = 0,
            .prev_address = 0,
        };
    }

    fn deinit(self: &StackAllocator) void {
        Memory.unmap(self.bytes);
    }
    
    pub fn clear(s: &StackAllocator) void {
        s.allocations = 0;
        s.curr_address = 0;
        s.prev_address = 0;
    }

    fn alloc(a: &Allocator, size: usize, alignment: u8) %[]u8 {
        const self = @fieldParentPtr(StackAllocator, "allocator", a);
        const adjustment = align.forwardAdjustmentHeader(
            self.curr_address,
            alignment,
            @sizeOf(AllocationHeader)
        );

        if(self.curr_address + adjustment + size > self.data.len)
            return error.NoMem;

        const aligned_pos = self.curr_address + adjustment;

        //Add Allocation Header
        var header = @ptrCast(&AllocationHeader, &self.data[aligned_pos - @sizeOf(AllocationHeader)]);

        header.adjustment    = adjustment;
        header.prev_address  = self.prev_address;
        self.prev_address = aligned_pos;
        self.curr_address = aligned_pos + size;
        self.allocations += 1;

        return self.data[aligned_pos .. aligned_pos + size];
    }

    fn realloc(a: &Allocator, old_mem: []u8, new_size: usize, alignment: u8) %[]u8 {
        return error.Invalid
    }

    fn free(a: &Allocator, old_mem: []u8) void {
        const self = @fieldParentPtr(StackAllocator, "allocator", a);
        // assert( (usize)(&old_mem[0]) == self.prev_address );

        var header = @intToPtr(&AllocationHeader, (usize)(old_mem.ptr) - @sizeOf(AllocationHeader));
        self.curr_address = (usize)(old_mem.ptr) - header.adjustment;
        self.prev_address = header.prev_address;
        self.allocations -= 1;
    }
};

test "StackAllocator" {
    var a = %%StackAllocator.init(1024);

    var s_array = %%a.allocator.alloc(S,8);

    for (s_array) | *s | {
        (*s).s = %%a.allocator.create(S);
    }

    for (s_array) | s | {
        a.allocator.destroy(s.s);
    }

    a.allocator.free(s_array);

    a.clear();
}


pub const FreeListAllocator = struct {
    allocator: Allocator,    
    data: []u8,
    allocations: usize,
    mem_used: usize,
    free_blocks: ?&FreeBlock,

    const AllocationHeader = struct {
        size: usize,
        adjustment: usize,
    };

    const FreeBlock = struct {
        size: usize,
        next: ?&FreeBlock,
    };

    fn init(size: usize) %FreeListAllocator {
        var mem = try Memory.map(size);
        var self = FreeListAllocator {
            .allocator = Allocator {
                .allocFn = alloc,
                .reallocFn = realloc,
                .freeFn = free,
            },
            .data = mem,
            .allocations = 0,
            .mem_used = 0,
            .free_blocks = undefined,
        };

        var free_blocks = @ptrCast(&FreeBlock, self.data.ptr);
        free_blocks.size = size;
        free_blocks.next = null;
        self.free_blocks = free_blocks;

        return self;
    }

    fn deinit(self: &FreeListAllocator) void {
        Memory.unmap(self.bytes);
    }

    fn alloc(a: &Allocator, size: usize, alignment: u8) %[]u8 {
        const self = @fieldParentPtr(FreeListAllocator, "allocator", a);

        var prev_free_block: ?&FreeBlock = null;
        var free_block     : ?&FreeBlock = self.free_blocks;

        while(free_block) | block | {  
            const adjustment = align.forwardAdjustmentHeader((usize)(free_block), alignment, @sizeOf(AllocationHeader));
            var total_size = size + adjustment;

            //If allocation doesn't fit in this FreeBlock, try the next
            if (block.size < total_size) {
                prev_free_block = free_block;
                free_block = block.next;
                continue;
            }

            assert(@sizeOf(AllocationHeader) >= @sizeOf(FreeBlock));

            // If the free block is too small for more allocations
            if(block.size <= @sizeOf(AllocationHeader) + total_size) {
                //Increase allocation size instead of creating a new FreeBlock
                total_size = block.size;
                
                if (prev_free_block) | previous | {
                    previous.next = block.next;
                } else {
                    self.free_blocks = block.next;
                }
            } else {
                //Else create a new FreeBlock containing remaining memory
                var next_block = @intToPtr(&FreeBlock, (usize)(block) + total_size);
                next_block.size = block.size - total_size;
                next_block.next = block.next;
                
                if(prev_free_block) | previous | {
                    previous.next = next_block;
                }
                else {
                    self.free_blocks = next_block;
                }
            }

            const aligned_address = (usize)(free_block) + adjustment;
        
            var header = @intToPtr(&AllocationHeader, aligned_address - @sizeOf(AllocationHeader));
            header.size       = total_size;
            header.adjustment = adjustment;

            self.mem_used += total_size;
            self.allocations += 1;

            assert(align.forwardAdjustment((usize)(aligned_address), alignment) == 0);

            return ([]u8)(@intToPtr(&usize, aligned_address)[0..total_size]);
        }

        return error.NoMem
    }

    fn realloc(a: &Allocator, old_mem: []u8, new_size: usize, alignment: u8) %[]u8 {
        return error.Invalid
    }

    fn free(a: &Allocator, old_mem: []u8) void {
        const self = @fieldParentPtr(FreeListAllocator, "allocator", a);
        const header = @intToPtr(&AllocationHeader, (usize)(old_mem.ptr) - @sizeOf(AllocationHeader));

        const block_start = (usize)(old_mem.ptr) - header.adjustment;
        const block_size  = header.size;
        const block_end   = block_start + block_size;

        var prev_free_block: ?&FreeBlock = null;
        var free_block: ?&FreeBlock = self.free_blocks;

        while (free_block) | block | {
            if( (usize)(free_block) >= block_end )
                // Free block comes after old block
                break;
            prev_free_block = block;
            free_block = block.next;
        }

        if (prev_free_block) | block | {
            if((usize)(block) + block.size == block_start) {
                block.size += block_size;
            } else {
                var temp = @intToPtr(&FreeBlock, block_start);
                temp.size = block_size;
                temp.next = block.next;
                block.next = temp;
                prev_free_block = temp;
            }
        } else {
            var block = @intToPtr(&FreeBlock, block_start);
            block.size = block_size;
            block.next = self.free_blocks;
            prev_free_block = block;
            self.free_blocks = block;
        }

        var previous = ??prev_free_block;

        if( free_block ) | block | {
            if((usize)(block) == block_end) {
                previous.size += block.size;
                previous.next = block.next;
            }
        }

        self.allocations -= 1;
        self.mem_used -= block_size;
    }
};

 test "FreeListAllocator" {
     var a = %%FreeListAllocator.init(8192);
     var s_array = %%a.allocator.alloc(S,8);
     for (s_array) | *s | {
         (*s).s = %%a.allocator.create(S);
     }
     for (s_array) | s | {
         a.allocator.destroy(s.s);
     }
     a.allocator.free(s_array);
 }

const S = struct { s: &S, };
