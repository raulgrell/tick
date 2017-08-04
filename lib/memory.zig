const math = @import("std").math;
const os = @import("std").os;
const assert = @import("std").debug.assert;

const builtin = @import("builtin");
const Os = builtin.Os;

error NoMem;

pub const Memory = struct {
    bytes: []u8,
    used: usize,
    allocations: usize,

    pub fn map(size: usize) -> %[]u8 {
        switch (builtin.os) {
            Os.linux, Os.darwin, Os.macosx, Os.ios => {
                const p = os.posix;
                const addr = p.mmap(null, size, p.PROT_READ|p.PROT_WRITE,
                    p.MAP_PRIVATE|p.MAP_ANONYMOUS|p.MAP_NORESERVE, -1, 0);
                if (addr == p.MAP_FAILED) {
                    return error.NoMem;
                } else {
                    return @intToPtr(&u8, addr)[0..size]
                }
            },
            else => @compileError("Unsupported OS"),
        }
    }

    pub fn unmap(bytes: []u8) {
        switch (builtin.os) {
            Os.linux, Os.darwin, Os.macosx, Os.ios => {
                _ = os.posix.munmap(bytes.ptr, bytes.len);
            },
            else => @compileError("Unsupported OS"),
        }
    }

    pub fn init(size: usize) -> %Memory {
        Memory { .bytes = %return Memory.map(size), .used = 0, .allocations = 0, }
    }

    pub fn deinit(self: Memory) {
        Memory.unmap(self.bytes);
        self.used = 0;
        self.allocations = 0;
    }

    pub fn proxy(bytes: []u8) -> Memory {
        Memory { .bytes = bytes, .used = 0, .allocations = 0, }
    }
};

test "Memory" {
    var dynamic_bytes = %%Memory.map(1024);
    Memory.unmap(dynamic_bytes);
}

pub fn StaticMemory(comptime size: usize) -> type {
    struct {
        bytes: [size]u8,

        const Self = this;
        
        pub fn init() -> Self {
            Self {
                .bytes = []u8{0} ** size,
            }
        }
    }
}

test "Static Memory" {
    var static_bytes = StaticMemory(1024).init();    
}

pub const Allocator = struct {
    allocFn:   fn(self: &Allocator, size: usize, alignment: u8) -> %[]u8,
    reallocFn: fn(self: &Allocator, mem: []u8, size: usize, alignment: u8) -> %[]u8,
    freeFn:    fn(self: &Allocator, mem: []u8) -> void,

    /// Aborts the program if an allocation fails.
    fn checkedAlloc(self: &Allocator, comptime T: type, n: usize) -> []T {
        alloc(self, T, n) %% |err| {
            %%io.stderr.printf("allocation failure: {}\n", @errorName(err));
            os.abort()
        }
    }

    fn create(self: &Allocator, comptime T: type) -> %&T {
        &(%return self.alloc(T, 1))[0]
    }

    fn init(self: &Allocator, comptime T: type, data: &const T) -> %&T {
        var object = &(%return self.alloc(T, 1))[0];
        *object = *data;
        return object;
    }

    fn init_array(self: &Allocator, comptime T: type, n: usize, data: &const T) -> %[]T {
        var array = %return self.alloc(T, n);
        for (array) | *object | {
            *object = *data;
        }
        return array;
    }

    fn destroy(self: &Allocator, ptr: var) {
        self.free(ptr[0..1]);
    }

    fn alloc(self: &Allocator, comptime T: type, n: usize) -> %[]T {
        const byte_count = %return math.mul(usize, @sizeOf(T), n);
        ([]T)(%return self.allocFn(self, byte_count, @alignOf(T)))
    }

    fn realloc(self: &Allocator, comptime T: type, old_mem: []T, n: usize) -> %[]T {
        const byte_count = %return math.mul(usize, @sizeOf(T), n);
        ([]T)(%return self.reallocFn(self, ([]u8)(old_mem), byte_count, @alignOf(T)))
    }

    fn free(self: &Allocator, mem: var) -> void {
        self.freeFn(self, ([]u8)(mem));
    }
};

pub fn Cursor(comptime T: type) -> type {
    struct {
        data: []const T,

        const Self = this;

        pub fn init(data: []const T) -> Self {
            Self {
                .data = data
            }
        }

        pub fn peek(self: &Self) -> T {
            return if (self.data.len > 0) self.data[0] else unreachable; // null instead?
        }

        pub fn advance(self: &Self) {
            if (self.data.len > 0) self.data = self.data[1..];
        }

        pub fn next(self: &Self) -> T {
            if (self.data.len > 0) {
                const t = self.data[0];
                self.data = self.data[1..];
                return t;
            } else {
                // return null ?
                unreachable;
            }
        }

        pub fn seek(self: &Self, item: T) {
            while(self.data.len > 0 and self.data[0] != item) {
                self.data = self.data[1..];
            }
        }

        pub fn match(self: &Self, item: T) -> bool {
            if (self.data.len > 0 and self.data[0] == item) {
                self.data = self.data[1..];
                return true;
            } else {
                return false;
            }
        }
    }
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

pub fn copy(comptime T: type, dest: []T, source: []const T) -> []T {
    @setDebugSafety(this, false);
    assert(dest.len >= source.len);
    for (source) |s, i| dest[i] = s;
    return dest;
}

pub fn move(comptime T: type, dest: []T, src: []const T) -> []T {
    assert(dest.len >= src.len);
    // Same address
    if (dest.ptr == src.ptr) return dest;
    
    // No overlap
    if (usize(src.ptr) + (src.len * @sizeOf(T)) <= usize(dest.ptr)
            or usize(dest.ptr) + (dest.len * @sizeOf(T)) <= usize(src.ptr)) {
        // Safe to memcopy
        return copy(T, dest, src);
    }

    // Overlapping buffers
    if (usize(dest.ptr) < usize(src.ptr)) {
        for (src) |s, i| dest[i] = s;
    } else {
        for (src) |s, i| dest[src.len - i - 1] = src[src.len - i - 1]; 
    }
    
    return dest;
}

pub fn Cache(comptime T: type, comptime size: usize) -> type {
    struct {
        cache: [size]T,

        const Self = this;

        pub fn add() {

        }

        pub fn query() {

        }

        pub fn replace() {
            
        }
    }
}