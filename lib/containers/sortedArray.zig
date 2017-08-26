const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

pub fn SortedArray(comptime T: type) -> type {
    struct {
        data: []T,
        length: usize,
        eqlFn: EqualityFunc,
        cmpFn: ComparisonFunc,
        allocator: &Allocator,

        const Self = this;
        const EqualityFunc = fn(a: T, b: T) -> bool;
        const ComparisonFunc = fn(a: T, b: T) -> isize;

        pub fn init(eqlFn: EqualityFunc, cmpFn: ComparisonFunc, allocator: &Allocator) -> Self {
            Self {
                .data = []T{},
                .length = 0,
                .eqlFn = eqlFn,
                .cmpFn = cmpFn,
                .allocator = allocator,
            }
        }

        pub fn deinit(self: &Self) -> void {
            self.allocator.free(self.data);
        }

        pub fn push(self: &Self, data: T) -> %void {
            var left  = usize(0);
            var right = usize(self.length);
            var index = usize(0);

            // Binary search
            right = if (right > 1) right else 0;

            while (left != right) {
                index = (left + right) / 2;

                const order = self.cmpFn(data, self.data[index]);
                if (order < 0) {
                    // value should be left of index
                    right = index;
                } else if (order > 0) {
                    // value should be right of index
                    left = index + 1;
                } else {
                    // value should be at index
                    break;
                }
            }

            // look whether the item should be put before or after the index
            if (self.length > 0 and self.cmpFn(data, self.data[index]) > 0) {
                index += 1;
            }

            // insert element at index
            if (self.length + 1 > self.data.len) {
                const newsize = (self.data.len + 2) * 2;
                self.data = %return self.allocator.realloc(T, self.data, newsize)
            }

            // move all other elements
            _ = memory.move(T,
                    self.data[index + 1 .. self.length + 1],
                    self.data[index .. self.length]);

            // push entry
            self.data[index] = data;
            self.length += 1;
        }

        pub fn index_of(self: &Self, data: T) -> %usize {
            // Binary search
            var left = usize(0);
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

        pub fn clear(self: &Self) -> void {
            self.length = 0;
        }

        pub fn get(self: &Self, index: usize) -> ?&T {
            return if ( index < self.length ) {
                self.data[index]
            } else {
                null
            }
        }

        pub fn remove(self: &Self, index: usize) -> void {
            remove_range(self, index, 1);
        }

        pub fn remove_range(self: &Self, index: usize, length: usize) -> void {
            if (index > self.length or index + length > self.length) {
                return;
            }

            // move entries back
            _ = memory.move(T,
                    self.data[index - length .. self.length - length],
                    self.data[index .. self.length]);

            self.length -= length;
        }

        fn first_index( self: &Self, data: T, left: usize, right: usize) -> usize {
            var index = left;
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

        fn last_index( self: &Self, data: T, left: usize, right: usize) -> usize {
            var index = right;
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

fn comp(a: i32, b: i32) -> isize {
    if (a == b) return isize(0);
    return if(a  > b) isize(1) else isize(-1);
}

fn eql(a: i32, b: i32) -> bool {
    return a == b
}

test "SortedArray" {
    var list = SortedArray(i32).init(eql, comp, &c.mem.allocator);
    defer list.deinit();

    { var i: usize = 0; while (i < 10) : (i += 2) {
        _ = %%list.push(i32(i + 1));
    }}

    { var i: usize = 1; while (i < 10) : (i += 2) {
        _ = %%list.push(i32(i + 1));
    }}

    { var i: usize = 0; while (i < 10) : (i += 1) {
        assert(list.data[i] == i32(i + 1));
    }}
}

