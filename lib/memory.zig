const math = @import("std").math;
const assert = @import("std").debug.assert;

const builtin = @import("builtin");
const os = @import("std").os;
const Os = builtin.Os;

error NoMem;

pub const Memory = struct {
    bytes: []u8,
    used: usize,
    allocations: usize,

    pub fn map(size: usize) %[]u8 {
        switch (builtin.os) {
            Os.linux, Os.darwin, Os.macosx, Os.ios => {
                const p = os.posix;
                const addr = p.mmap(null, size, p.PROT_READ|p.PROT_WRITE,
                    p.MAP_PRIVATE|p.MAP_ANONYMOUS|p.MAP_NORESERVE, -1, 0);
                if (addr == p.MAP_FAILED) {
                    return error.NoMem;
                } else {
                    return @intToPtr(&u8, addr)[0..size];
                }
            },
            else => @compileError("Unsupported OS"),
        }
    }

    pub fn unmap(bytes: []u8) void {
        switch (builtin.os) {
            Os.linux, Os.darwin, Os.macosx, Os.ios => {
                _ = os.posix.munmap(bytes.ptr, bytes.len);
            },
            else => @compileError("Unsupported OS"),
        }
    }

    pub fn init(size: usize) %Memory {
        return Memory { .bytes = try Memory.map(size), .used = 0, .allocations = 0, };
    }

    pub fn deinit(self: Memory) void {
        Memory.unmap(self.bytes);
        self.used = 0;
        self.allocations = 0;
    }

    pub fn proxy(bytes: []u8)Memory {
        return Memory { .bytes = bytes, .used = 0, .allocations = 0, };
    }
};

test "Memory" {
    var dynamic_bytes = %%Memory.map(1024);
    Memory.unmap(dynamic_bytes);
}

pub fn StaticMemory(comptime size: usize)type {
    return struct {
        bytes: [size]u8,

        const Self = this;
        
        pub fn init()Self {
            return Self {
                .bytes = []u8{0} ** size,
            };
        }
    };
}

test "Static Memory" {
    var static_bytes = StaticMemory(1024).init();    
}

pub const Allocator = struct {
    /// Allocate byte_count bytes and return them in a slice, with the
    /// slicer's pointer aligned at least to alignment bytes.
    allocFn: fn (self: &Allocator, byte_count: usize, alignment: usize) %[]u8,
    
    /// Guaranteed: old_mem.len > 0 and alignment >= alignment of old_mem.ptr
    reallocFn: fn (self: &Allocator, old_mem: []u8, new_byte_count: usize, alignment: usize) %[]u8,

    freeFn: fn (self: &Allocator, ptr: &u8) void,

    /// Aborts the program if an allocation fails.
    fn checkedAlloc(self: &Allocator, comptime T: type, n: usize)[]T {
        return alloc(self, T, n) catch |err| {
            %%io.stderr.printf("allocation failure: {}\n", @errorName(err));
            os.abort();
        };
    }

    fn create(self: &Allocator, comptime T: type) %&T {
        const slice = try self.alloc(T, 1);
        return &(slice)[0];
    }

    fn destroy(self: &Allocator, ptr: var) void {
        self.free(ptr[0..1]);
    }

    fn init(self: &Allocator, comptime T: type, data: &const T) %&T {
        var object = try self.create(T);
        *object = *data;
        return object;
    }

    fn init_array(self: &Allocator, comptime T: type, n: usize, data: &const T) %[]T {
        var array = try self.alloc(T, n);
        for (array) | *object | {
            *object = *data;
        }
        return array;
    }

    fn alloc(self: &Allocator, comptime T: type, n: usize) %[]T {
        const byte_count = try math.mul(usize, @sizeOf(T), n);
        const byte_slice = try self.allocFn(self, byte_count, @alignOf(T));
        return ([]T)(@alignCast(@alignOf(T), byte_slice));
    }

    fn realloc(self: &Allocator, comptime T: type, old_mem: []T, n: usize) %[]T {
        if (old_mem.len == 0) {
            return self.alloc(T, n);
        }

        // Assert that old_mem.ptr is properly aligned.
        _ = @alignCast(@alignOf(T), old_mem.ptr);

        const byte_count = try math.mul(usize, @sizeOf(T), n);
        const byte_slice = try self.reallocFn(self, ([]u8)(old_mem), byte_count, @alignOf(T));
        return ([]T)(@alignCast(@alignOf(T), byte_slice));
    }

    fn free(self: &Allocator, memory: var) void {
        const const_slice = ([]const u8)(memory);
        if (memory.len == 0)
            return;
        const ptr = @intToPtr(&u8, @ptrToInt(const_slice.ptr));
        self.freeFn(self, ptr);
    }
};

pub fn Cursor(comptime T: type)type {
    return struct {
        data: []const T,

        const Self = this;

        pub fn init(data: []const T)Self {
            return Self {
                .data = data
            };
        }

        pub fn peek(self: &Self) T {
            return if (self.data.len > 0) self.data[0] else unreachable; // null instead?
        }

        pub fn advance(self: &Self) void {
            if (self.data.len > 0) self.data = self.data[1..];
        }

        pub fn next(self: &Self) T {
            if (self.data.len > 0) {
                const t = self.data[0];
                self.data = self.data[1..];
                return t;
            } else {
                // return null ?
                unreachable;
            }
        }

        pub fn seek(self: &Self, item: T) void {
            while(self.data.len > 0 and self.data[0] != item) {
                self.data = self.data[1..];
            }
        }

        pub fn match(self: &Self, item: T)bool {
            if (self.data.len > 0 and self.data[0] == item) {
                self.data = self.data[1..];
                return true;
            } else {
                return false;
            }
        }
    };
}

const stdmem = @import("std").mem;

test "Cursor" {
    const str = "string";
    var cur = Cursor(u8).init(str);

    cur.advance();
    assert(stdmem.eql(u8, cur.data, "tring"));
    assert(cur.match('t'));
    assert(stdmem.eql(u8, cur.data, "ring"));    
    assert(!cur.match('1'));
    assert(stdmem.eql(u8, cur.data, "ring"));
    assert(cur.peek() == 'r'); 
}

//TODO: byte/word/page optmization or b/w/p aware cursor?

pub fn copy(comptime T: type, dest: []T, source: []const T)[]T {
    @setRuntimeSafety(false);
    assert(dest.len >= source.len);
    for (source) |s, i| dest[i] = s;
    return dest;
}

pub fn move(comptime T: type, dest: []T, src: []const T)[]T {
    @setRuntimeSafety(false);
    assert(dest.len >= src.len);

    // Same address
    if (dest.ptr == src.ptr) return dest;
    
    // No overlap
    if (@ptrToInt(src.ptr) + (src.len * @sizeOf(T)) <= @ptrToInt(dest.ptr)
            or @ptrToInt(dest.ptr) + (dest.len * @sizeOf(T)) <= @ptrToInt(src.ptr)) {
        // Safe to memcopy
        return copy(T, dest, src);
    }

    // Overlapping buffers
    if (@ptrToInt(dest.ptr) < @ptrToInt(src.ptr)) {
        for (src) |s, i| dest[i] = s;
    } else {
        for (src) |s, i| dest[src.len - i - 1] = src[src.len - i - 1]; 
    }
    
    return dest;
}

pub fn isPowerOfTwo(address: usize) bool  {
    assert(address > 0);
    return !((address & (address - 1) != 0));
}

pub fn forward(address: usize, alignment: u8) usize {
    const align_minus_one = alignment - 1;
    const aligner = ~(align_minus_one);
    return ((address + align_minus_one) & aligner);
}

pub fn forwardAdjustment(address: usize, alignment: u8) usize  {
    const align_minus_one = alignment - 1;    
    const adjustment = alignment - (address & align_minus_one);
    return if (adjustment == alignment) adjustment else 0;
}

pub fn forwardAdjustmentHeader(address: usize, alignment: u8, header_size: usize)usize {
    var space_needed = header_size;
    var adjustment =  forwardAdjustment(address, alignment);
    if(adjustment < space_needed) {
        space_needed -= adjustment;
        //Increase adjustment to fit header
        adjustment += alignment * (space_needed / alignment);
        if(space_needed % alignment > 0)
            adjustment += alignment;
    }
    return adjustment;
}

pub fn backward(address: usize, alignment: u8) usize {
    const align_minus_one = alignment - 1;
    const aligner = ~(align_minus_one);
    return (address & aligner);
}

pub fn backwardAdjustment(address: usize, alignment: u8) usize  {
    const align_minus_one = alignment - 1;
    const adjustment = (address & align_minus_one);
    return if (adjustment == alignment) adjustment else 0;
}

pub inline fn read_16le(data: []const u8) u16 {
    return u16(data[0]) | (u16(data[1]) << 8);
}

pub inline fn read_16net(data: []const u8) u16 {
    return u16(data[1]) | (u16(data[0]) << 8);
}

pub inline fn write_16le(data: []u8, v: u16) void {
    data[0] = v;
    data[1] = v >> 8;
}

pub inline fn write_16net(data: []u8, v: u16) void {
    data[1] = v;
    data[0] = v >> 8;
}

pub inline fn read_32le(data: []const u8) u32 {
    return u32(data[0]) |
           (u32(data[1]) << 8) |
           (u32(data[2]) << 16) |
           (u32(data[3]) << 24);
}

pub inline fn read_32net(data: []const u8) u32 {
    return u32(data[3]) |
           (u32(data[2]) << 8) |
           (u32(data[1]) << 16) |
           (u32(data[0]) << 24);
}

pub inline fn write_32le(data: []u8, v: u32) void {
    data[0] = v;
    data[1] = v >> 8;
    data[2] = v >> 16;
    data[3] = v >> 24;
}

pub inline fn write_32net(data: []u8, v: u32) void {
    data[3] = v;
    data[2] = v >> 8;
    data[1] = v >> 16;
    data[0] = v >> 24;
}

pub inline fn read_64le(data: []const u8) u64 {
    return u64(data[0]) |
           (u64(data[1]) << 8) |
           (u64(data[2]) << 16) |
           (u64(data[3]) << 24) |
           (u64(data[4]) << 32) |
           (u64(data[5]) << 40) |
           (u64(data[6]) << 48) |
           (u64(data[7]) << 56);
}

pub inline fn read_64net(data: []const u8) u64 {
    return u64(data[7]) |
           (u64(data[6]) << 8) |
           (u64(data[5]) << 16) |
           (u64(data[4]) << 24) |
           (u64(data[3]) << 32) |
           (u64(data[2]) << 40) |
           (u64(data[1]) << 48) |
           (u64(data[0]) << 56);
}

pub inline fn write_64le(data: []u8, v: u64) void {
    data[0] = v;
    data[1] = v >> 8;
    data[2] = v >> 16;
    data[3] = v >> 24;
    data[4] = v >> 32;
    data[5] = v >> 40;
    data[6] = v >> 48;
    data[7] = v >> 56;
}

pub inline fn write_64net(data: []u8, v: u64) void {
    data[7] = v;
    data[6] = v >> 8;
    data[5] = v >> 16;
    data[4] = v >> 24;
    data[3] = v >> 32;
    data[2] = v >> 40;
    data[1] = v >> 48;
    data[0] = v >> 56;
}