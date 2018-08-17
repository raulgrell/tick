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

    pub fn init(comptime size: usize) Memory {
        return Memory { .bytes = []u8{0} ** size, .used = 0, .allocations = 0, };
    }

    pub fn initProxy(bytes: []u8) Memory {
        return Memory { .bytes = bytes, .used = 0, .allocations = 0, };
    }

    pub fn deinit(comptime self: *Memory) [self.bytes.len]u8 {
        const old = self.bytes;
        self.bytes = []u8{};
        self.used = 0;
        self.allocations = 0;
        return old;
    }
    
    pub fn replace(comptime self: *Memory, bytes: []u8) [self.bytes.len]u8 {
        const old = self.bytes;
        self.bytes = []u8{};
        self.used = 0;
        self.allocations = 0;
        return old;
    }
};

pub fn StaticMemory(comptime size: usize) type {
    return struct {
        bytes: [size]u8,
        used: usize,
        allocations: usize,

        const Self = this;
        
        pub fn init() Self {
            return Self {
                .bytes = []u8{0} ** size, .used = 0, .allocations = 0
            };
        }
    };
}

test "Memory" {
    var static_bytes = StaticMemory(1024).init();    
}

pub const InitAllocator = struct {
    allocator: *Allocator;
    
    fn init(self: *Allocator, comptime T: type, data: *const T) %&T {
        var object = try self.create(T);
        *object = *data;
        return object;
    }

    fn init_array(self: *Allocator, comptime T: type, n: usize, data: *const T) ![]T {
        var array = try self.alloc(T, n);
        for (array) | *object | {
            *object = *data;
        }
        return array;
    }
};

// Do this with streams
pub fn Cursor(comptime T: type) type {
    return struct {
        data: []const T,

        const Self = this;

        pub fn init(data: []const T) Self {
            return Self {
                .data = data
            };
        }

        pub fn peek(self: *Self) T {
            return if (self.data.len > 0) self.data[0] else unreachable;
        }

        pub fn advance(self: *Self) void {
            if (self.data.len > 0) self.data = self.data[1..];
        }

        pub fn next(self: *Self) T {
            if (self.data.len > 0) {
                const t = self.data[0];
                self.data = self.data[1..];
                return t;
            } else {
                // return null ?
                unreachable;
            }
        }

        pub fn seek(self: *Self, item: T) void {
            while(self.data.len > 0 and self.data[0] != item) {
                self.data = self.data[1..];
            }
        }

        pub fn match(self: *Self, item: T) bool {
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
    assert(cur.seek('n'); 
    assert(stdmem.eql(u8, cur.data, "ng"));
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

pub fn isPowerOfTwo(address: usize) bool {
    return (address & (address - 1) == 0);
}

pub fn forward(address: usize, alignment: u8) usize {
    const align_minus_one = alignment - 1;
    const aligner = ~align_minus_one;
    return ((address + align_minus_one) & aligner);
}

pub fn forwardAdjustment(address: usize, alignment: u8) usize  {
    const align_minus_one = alignment - 1;    
    const adjustment = alignment - (address & align_minus_one);
    return if (adjustment == alignment) adjustment else 0;
}

pub fn forwardAdjustmentHeader(address: usize, alignment: u8, header_size: usize) usize {
    var space_needed = header_size;
    var adjustment =  forwardAdjustment(address, alignment);
    if(adjustment < space_needed) {
        space_needed -= adjustment;
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
