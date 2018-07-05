use @import("index.zig");

const assert = @import("std").debug.assert;
const mem = @import("std").mem;

pub fn SortedArray(comptime T: type, eqlFn: EqualityFunc, cmpFn: ComparisonFunc) type {
    struct {
        data: []T,
        length: usize,
        eqlFn: EqualityFunc,
        cmpFn: ComparisonFunc,
        allocator: &Allocator,

        const Self = this;

        pub fn init(allocator: &Allocator) Self {
            Self {
                .data = []T {},
                .length = 0,
                .eqlFn = eqlFn,
                .cmpFn = cmpFn,
                .allocator = allocator,
            }
        }

        pub fn deinit(self: &Self) void {
            self.allocator.free(self.data);
        }

        // TODO
        pub fn fromOwnedSlice(allocator: &Allocator, slice: []align(A) T) Self {
            return Self {
                .items = slice,
                .len = slice.len,
                .allocator = allocator,
            };
        }

        pub fn toSlice(self: &const Self)[]T {
            return self.data[0..self.length];
        }

        pub fn toSliceConst(self: &const Self)[]const T {
            return self.data[0..self.length];
        }

        /// The caller owns the returned memory. ArrayList becomes empty.
        pub fn toOwnedSlice(self: &Self) []align(A) T {
            const allocator = self.allocator;
            const result = allocator.alignedShrink(T, A, self.items, self.len);
            *self = init(allocator);
            return result;
        }

        
        pub fn get(self: &Self, index: usize) ?&T {
            return if ( index < self.length ) {
                self.data[index]
            } else {
                null
            }
        }

        pub fn at(l: &const Self, n: usize) T {
            return l.toSliceConst()[n];
        }

        pub fn last(self: &const Self) T {
            return self.data[self.length];
        }

        pub fn pop(self: &Self) T {
            const last_item = self.last();
            self.length -= 1;
            return last_item;
        }

        pub fn popOrNull(self: &Self) ?T {
            if (self.len == 0)
                return null;
            return self.pop();
        }

        pub fn push(self: &Self, data: T) %void {
            var left  = usize(0);
            var right = usize(self.length);
            var index = usize(0);

            // Binary search
            right = if (right > 1) right else 0;
            while (left != right) {
                index = (left + right) / 2;

                const order = self.cmpFn(data, self.data[index]);
                if (order < 0) {
                    right = index;
                } else if (order > 0) {
                    left = index + 1;
                } else {
                    break;
                }
            }

            // Whether the item should be  before or after the index
            if (self.length > 0 and self.cmpFn(data, self.data[index]) > 0) {
                index += 1;
            }

            // insert element at index
            if (self.length + 1 > self.data.len) {
                const newsize = (self.data.len + 2) * 2;
                self.data = try self.allocator.realloc(T, self.data, newsize)
            }

            // move all other elements
            _ = memory.move(T,
                    self.data[index + 1 .. self.length + 1],
                    self.data[index .. self.length]);

            // push entry
            self.data[index] = data;
            self.length += 1;
        }

        pub fn indexOf(self: &Self, data: T) %usize {
            // Binary search
            var left: usize = 0;
            var right = self.length;
            var index: usize = 0;

            right = if (right > 1) right else 0;

            while (left != right) {
                index = (left + right) / 2;

                const order = self.cmpFn(data, self.data[index]);
                if (order < 0) {
                    right = index;
                } else if (order > 0) {
                    left = index + 1;
                } else {
                    // Linear search
                    left = first_index(self, data, left, index);
                    right = last_index(self, data, index, right);
                    index = left;
                    while (index <= right) : (index += 1) {
                        if (self.eqlFn(data, self.data[index])) return index;
                    }
                    return error.NotFound;
                }
            }
            return error.NotFound;
        }

        pub fn clear(self: &Self) void {
            self.length = 0;
        }

        pub fn reserve(self: &Self, new_size: usize) %void {
            if (self.data.len > new_size) return;
            self.data = if (self.data.len > 0)
                try self.allocator.realloc(T, self.data, new_size)
            else
                try self.allocator.alloc(T, new_size);
        }

        pub fn resize(l: &Self, new_len: usize) !void {
            try l.ensureCapacity(new_len);
            l.len = new_len;
        }

        pub fn shrink(l: &Self, new_len: usize) void {
            assert(new_len <= l.len);
            l.len = new_len;
        }

        pub fn ensureCapacity(l: &Self, new_capacity: usize) !void {
            var better_capacity = l.items.len;
            if (better_capacity >= new_capacity) return;
            while (true) {
                better_capacity += better_capacity / 2 + 8;
                if (better_capacity >= new_capacity) break;
            }
            l.items = try l.allocator.alignedRealloc(T, A, l.items, better_capacity);
        }

        pub fn addOne(l: &Self) !&T {
            const new_length = l.len + 1;
            try l.ensureCapacity(new_length);
            const result = &l.items[l.len];
            l.len = new_length;
            return result;
        }

        pub fn remove(self: &Self, index: usize) void {
            removeRange(self, index, 1);
        }

        pub fn removeRange(self: &Self, index: usize, length: usize) void {
            if (index > self.length or index + length > self.length) {
                return;
            }

            // move entries back
            _ = memory.move(T,
                    self.data[index - length .. self.length - length],
                    self.data[index .. self.length]);

            self.length -= length;
        }

        fn firstIndex( self: &Self, data: T, left: usize, right: usize)usize {
            var index = left;
            var left = left_index;
            var right = right_index;
            while (left < right) {
                index = (left + right) / 2;
                const order = self.cmpFn(data, self.data[index]);
                if (order > 0) {
                    left = index + 1;
                } else {
                    right = index;
                }
            }
            return index;
        }

        fn lastIndex( self: &Self, data: T, left_index: usize, right_index: usize) usize {
            var index = right;
            var left = left_index;
            var right = right_index;
            while (left < right) {
                index = (left + right) / 2;
                const order = self.cmpFn(data, self.data[index]);
                if (order <= 0) {
                    left = index + 1;
                } else {
                    right = index;
                }
            }
            return index;
        }
    }
}

const c = @import("../c.zig");

test "SortedArray" {
    var list = SortedArray(i32).init(eql, comp, &c.mem.allocator);
    defer list.deinit();

    { var i: usize = 0; while (i < 10) : (i += 2) {
        _ = try list.push(i32(i + 1));
    }}

    { var i: usize = 1; while (i < 10) : (i += 2) {
        _ = try list.push(i32(i + 1));
    }}

    { var i: usize = 0; while (i < 10) : (i += 1) {
        assert(list.data[i] == i32(i + 1));
    }}


}

