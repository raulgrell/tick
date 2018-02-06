const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

error NotFound;

pub fn ArrayList(comptime T: type)type {
    return struct {
        data: []T,
        length: usize,
        allocator: &Allocator,
        
        const Self = this;
        const EqualityFunc = fn(a: T, b: T)bool;
        const ComparisonFunc = fn(a: T, b: T)isize;

        const initial_size = 16;
        const growth_factor = 2;

        pub fn init(allocator: &Allocator)Self {
            return Self {
                .data = []T {},
                .length = 0,
                .allocator = allocator,
            };
        }

        pub fn deinit(self: &Self) void {
            self.allocator.free(self.data);
        }

        pub fn toSlice(self: &const Self)[]T {
            return self.data[0..self.length];
        }

        pub fn toSliceConst(self: &const Self)[]const T {
            return self.data[0..self.length];
        }

        pub fn last(self: &const Self) T {
            return self.data[self.length];
        }

        pub fn pop(self: &Self) T {
            const last_item = self.last();
            self.length -= 1;
            return last_item;
        }

        pub fn append(self: &Self, data: &const T) %void {
            try insert(self, self.length, data);
        }

        pub fn prepend(self: &Self, data: &const T) %void {
            try insert(self, 0, data);
        }

        pub fn insert(self: &Self, index: usize, data: &const T) %void {
            if (index > self.length) return error.NoMem;
            try self.reserve(self.length + 1);
            // Move the contents of the array forward from the index onwards
            _ = memory.move(T,
                    self.data[self.length - index .. self.length + 1],
                    self.data[index .. self.length]);

            // Insert the new entry at the index
            self.data[index] = *data;
            self.length += 1;
        }

        pub fn reserve(self: &Self, new_size: usize) %void {
            if (self.data.len > new_size) return;
            self.data = if (self.data.len > 0)
                try self.allocator.realloc(T, self.data, new_size)
            else
                try self.allocator.alloc(T, new_size);
        }

        pub fn remove(self: &Self, index: usize) %void {
            try remove_range(self, index, 1);
        }

        pub fn remove_range(self: &Self, index: usize, length: usize) %void {
            if (index > self.length or index + length > self.length) return;

            // Move back entries following range
            _ = memory.move(T,
                    self.data[index .. index + length],
                    self.data[index + length .. index +  (2 * length) ]);

            self.length -= length;
        }

        pub fn splice(self: &Self, index: usize, length: usize, array: []const T) %void {
            if (index > self.length or index + length > self.length) return;

            try self.reserve(self.length + array.len - length);

            // Adjust entries
            const adj = array.len - length;
            _ = memory.move(T,
                    self.data[index + adj .. index + length + adj],
                    self.data[index + length .. index +  (2 * length) ]);

            // Insert array
            _ = memory.move(T,
                    self.data[index .. index + array.len],
                    array);

            self.length -= length;
        }

        pub fn indexOf(self: &Self, eqlFunc: EqualityFunc, data: T) %usize {
            for (self.data[0..self.length]) | item, i | {
                if(eqlFunc(item, data)) return i;
            }
            return error.NotFound;
        }

        pub fn clear(self: &Self) void {
            self.length = 0;
        }
    };
}

const c = @import("../c.zig");

fn cmp(a: i32, b: i32)isize {
    if (a == b) return isize(0);
    return if(a > b) isize(-1) else isize(1);
}

fn eql(a: i32, b: i32)bool {
    return (a == b); 
}

test "ArrayList" {
    var list = ArrayList(i32).init(&c.mem.allocator);
    defer list.deinit();

    %%list.reserve(8);

    %%list.append(1);
    %%list.prepend(0);
    %%list.insert(2,2);

    assert(list.data[0] == 0);
    assert(list.data[1] == 1);
    assert(list.data[2] == 2);

    const arr = []i32 {6, 6, 6};

    %%list.splice(1, 1, arr[0..]);
    
    assert(list.data[1] == 6);
    assert(list.data[2] == 6);
    assert(list.data[3] == 6);

    assert(%%list.indexOf(eql, 0) == 0);

    list.clear();
}
