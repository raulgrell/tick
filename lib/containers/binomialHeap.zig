const assert = @import("std").debug.assert;
const mem = @import("std").mem;

const HeapType = enum {
    Min,
    Max,
};

pub fn BinomialHeap(comptime T: type, comptime heap_type: HeapType) type {
    struct {
        allocator: *Allocator,
        compare_func: ComparisonFunc,
        length: usize,
        roots: []BinomialTree,
        
        const Self = this;

        const BinomialTree = struct {
            value: T,
            refcount: u16,
            subtrees: []*BinomialTree,

            pub fn merge(heap: *Self, tree1: *BinomialTree, tree2: *BinomialTree) %&BinomialTree {
                if (cmp(heap, tree1.value, tree2.value) > 0) {
                    // Swap tree1 and tree2
                    var tmp = tree1;
                    tree1 = tree2;
                    tree2 = tmp;
                }

                var new_tree = heap.allocator.create(BinomialTree);
                errdefer heap.allocator.destroy(new_tree);

                new_tree.refcount = 0;
                new_tree.value = tree1.value;

                const total_subtrees = tree1.subtrees.len + 1;
                new_tree.subtrees = try heap.allocator.alloc(&BinomialTree, total_subtrees);
                // Copy subtrees of the smallest tree. The last entry in the array is the larger tree
                mem.copy(T, new_tree.subtrees, tree1.subtrees);
                new_tree.subtrees[total_subtrees - 1] = tree2;

                // Add a reference to each of the subtrees we have referenced
                for (new_tree.subtrees) | s, i | ref(s);

                return new_tree;
            }
        };

        fn merge_undo(new_roots: []*BinomialTree, count: usize) void {
            { var i = usize(0); while( i <= count ) : (i += 1) {
                heap.unref(new_roots[i]);
            }}
            heap.allocator.free(new_roots);
        }

        pub fn init(heap_type: HeapType, compare_func: ComparisonFunc, allocator: *Allocator)Self {
            Self {
                .allocator = allocator,
                .heap_type = heap_type,
                .compare_func = compare_func,
                .length = 0,
                .roots = []BinomialTree{},
            }
        }

        pub fn deinit(heap: *Self) void {
            // Unreference all trees and subtrees.
            for (heap.roots) | *r, i | heap.unref(r);
            heap.allocator.free(heap.roots);
        }

        pub fn push(heap: *Self, value: T) !void {
            var new_tree = heap.allocator.alloc(BinomialTree, 1) catch unreachable;
            new_tree[0].value = value;
            new_tree[0].refcount = 1;
            new_tree[0].subtrees = []*BinomialTree{};

            var tmp = Self {
                .allocator = heap.allocator,
                .heap_type = heap.heap_type,
                .compare_func = heap.compare_func,
                .length = 1,
                .roots = new_tree,
            };

            // Perform the merge
            const result = try merge(heap, &tmp);
            heap.length += 1;
            // Remove reference to the new tree.
            heap.unref(new_tree.ptr);
        }

        pub fn pop(heap: *Self)?T {
            if (heap.length == 0) {
                return null;
            }

            // Find the tree with the lowest root value
            var least_index: usize = @maxValue(usize);

            for (heap.roots) | r, i | {
                if (least_index == @maxValue(usize)
                        or cmp(heap, heap.roots[i].value, heap.roots[least_index].value) < 0) {
                    least_index = i;
                }
            }

            // Remove the least_tree from the heap.
            var least_tree = heap.roots[least_index];
            heap.roots[least_index] = null;

            // Construct a fake heap containing the data in the least tree
            var fake_heap = Self {
                .heap_type = heap.heap_type,
                .compare_func = heap.compare_func,
                .roots = least_tree.subtrees,
                .length = 0,
                .allocator = heap.allocator,
            };

            // Merge subtrees of least tree back into the heap
            if (merge(heap, &fake_heap)) {
                // Merge successful, remove reference to least tree
                const result = least_tree.value;
                heap.unref(least_tree);
                heap.length -= 1;
                return result;
            } else | err | {
                // Add the least tree back
                heap.roots[least_index] = least_tree;
                return null;
            }
        }

        pub fn ref(heap: *Self, tree: *BinomialTree) void {
            tree.refcount += 1;
        }

        pub fn unref(heap: *Self, tree: *BinomialTree) void {
            // If last reference, unreference all subtrees and free.
            tree.refcount -= 1;
            if (tree.refcount == 0) {
                for (tree.subtrees) | s, i | heap.unref(s);
                heap.allocator.free(tree.subtrees);
                heap.allocator.destroy(tree);
            }
        }

        pub fn cmp(heap: *Self, a: T, b: T)isize {
            if (heap.heap_type == HeapType.Min) {
                return heap.compare_func(a, b);
            } else {
                return -(heap.compare_func(a, b));
            }
        }

        pub fn merge(heap: *Self, other: *Self) !void {
            var vals: [3]*Self = undefined;
            var new_carry: *Self = undefined;

            // Find the maximum length of the two heaps.  Add one because after merging we may have one more value to carry over.
            const max = if (heap.roots.len > other.roots.len) {
                heap.roots.len + 1
            } else {
                other.roots.len + 1
            };

            // Allocate an array for the new roots
            var new_roots = try heap.allocator.alloc(BinomialTree, max);

            // Go through one entry at a time.  This works kind of like a ripple-carry adder.
            var new_roots_length = usize(0);
            var carry: ?*Self = null;
            { var i = usize(0); while (i < max) : (i += 1) {
                // Build up 'vals' as a list of all the values we must merge at this step.
                var num_vals = usize(0);
                // If there is a value in 'heap', add it
                if (i < heap.roots.len) {
                    vals[num_vals] = heap.roots[i];
                    num_vals += 1;
                }
                // If there is a value in 'other', add it
                if (i < other.roots.len) {
                    vals[num_vals] = other.roots[i];
                    num_vals += 1;
                }
                // If there is a carried value from the previous iteration, add it
                if (carry != null) {
                    vals[num_vals] = carry;
                    num_vals += 1;
                }

                // When num_vals == 1 or 3, we store a value.
                if ((num_vals & 1) != 0) {
                    // Save the lasvalue: T into new_roots.
                    new_roots[i] = vals[num_vals - 1];
                    heap.ref(new_roots[i]);
                    new_roots_length = i + 1;
                } else {
                    // No value to store at this iteration
                    new_roots[i] = null;
                }

                // When num_vals == 2 or 3, we must carry over to the next iteration
                if ((num_vals & 2) != 0) {
                    // Merge the first two values and carry to the next iteration
                    new_carry = merge(heap, vals[0], vals[1]);
                    if (new_carry == null) {
                        // Remove references that we have added, freeing trees
                        merge_undo(new_roots, i);
                        // Unreference the carry variable
                        heap.unref(carry);
                        return;
                    }
                } else {
                    // Nothing to carry
                    new_carry = null;
                }

                // Unreference previous carried value
                heap.unref(carry);

                // Assign the new value of carry, and add a reference
                carry = new_carry;
                heap.ref(carry);
            }}

            // Unreference all values in the old 'roots' array, freeing unused trees
            for (heap.roots) | r, i | {
                if (heap.roots[i]) | s | {
                    heap.unref(s);
                }
            }

            // Free the old roots array and use the new one
            heap.allocator.free(heap.roots);
            heap.roots = new_roots;
        }
    }
}

const c = @import("../c.zig");

fn comp(a: i32, b: i32)isize {
    if (a == b) return isize(0);
    return if(a  > b) isize(1) else isize(-1);
}

test "BinomialHeap" {
    var list = BinomialHeap(i32).init(HeapType.Min, comp,  &c.mem.allocator);
    defer list.deinit();

    {var i: usize = 0; while (i < 10) : (i += 1) {
        list.push(i32(i + 1)) catch unreachable;
    }}

    assert(??list.pop() == 10);
    assert(list.length == 9);
}
