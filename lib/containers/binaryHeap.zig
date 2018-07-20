const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

const HeapType = enum {
    Min,
    Max,
};

pub fn BinaryHeap(comptime T: type, comptime heap_type: HeapType) type {
    struct {
        items: []T,
        comparison_func: ComparisonFunc,
        len: usize,
        allocator: *Allocator,

        const Self = this;
        const ComparisonFunc = fn(a: T, b: T) isize;
        
        pub fn init(heap_type: HeapType, comparison_func: ComparisonFunc, allocator: *Allocator) Self {
            Self {
                .heap_type = heap_type,
                .comparison_func = comparison_func,
                .items = []T{},
                .len = 0,
                .allocator = allocator
            }
        }

        pub fn deinit(self: *Self) void {
            self.allocator.free(self.items);
        }

        pub fn insert(self: *Self, value: T) !void {
            var values: *T = undefined;

            if (self.len + 1 > self.items.len) {
                const new_size = (self.items.len + 2) *  2;
                self.items = try self.allocator.realloc(T, self.items, new_size);
            }

            // Add value to the bottom of the heap and percolate to the top of the heap
            var index = self.len;
            while (index > 0) {
                const parent_index = (index - 1) / 2;
                if (cmp(self, self.items[parent_index], value) < 0) {
                    // Found correct index
                    break;
                } else {
                    // Swap with parent and advance 
                    self.items[index] = self.items[parent_index];
                    index = parent_index;
                }
            }
            // Save the new value in the final location 
            self.items[index] = value;
            self.len += 1;
        }

        pub fn pop(self: *Self) ?T {
            if (self.len == 0) return null;
            self.len -= 1;

            const result = self.items[0];
            const value = self.items[self.len];
            var index = usize(0);
            var next_index = usize(0);
            while (true) {
                // Calculate left and right child indices
                const left = index * 2 + 1;
                const right = index * 2 + 2;

                if (left < self.len and cmp(self, value, self.items[left]) > 0) {
                    // Left child is less than node, choose smallest
                    next_index = if (right < self.len and cmp(self, self.items[left], self.items[right]) > 0) {
                        right
                    } else {
                        left
                    };
                } else if (right < self.len and cmp(self, value, self.items[right]) > 0) {
                    // Right child is less than node, choose right child
                    next_index = right;
                } else {
                    // Node is less than both children, end
                    self.items[index] = value;
                    break;
                }
                // Swap the current node with the smallest child node and advance
                self.items[index] = self.items[next_index];
                index = next_index;
            }

            return result;
        }

        fn cmp(self: *Self, data1: T, data2: T) isize {
            if (self.heap_type == HeapType.Min) {
                return self.comparison_func(data1, data2);
            } else {
                return -self.comparison_func(data1, data2);
            }
        }
    }
}

const c = @import("../c.zig");

fn comp(a: i32, b: i32)isize {
    if (a == b) return isize(0);
    return if(a  > b) isize(1) else isize(-1);
}

test "BinaryHeap" {
    var heap = BinaryHeap(i32).init(HeapType.Max, comp, &c.mem.allocator);
    defer heap.deinit();

    { var i: usize = 0; while (i < 10) : (i += 1) {
        heap.insert(i32(i + 1)) catch unreachable;
    }}

    const top = ??heap.pop();

    assert(top == 10);
    assert(heap.len == 9);
}

