const assert = @import("std").debug.assert;
const mem = @import("std").mem;

pub fn Trie(comptime T: type)type {
    struct {
        length: usize,
        allocator: &Allocator,
        root_node: ?&&Node,

        const Self = this;
        const EqualityFunc = fn(a: T, b: T)bool;
        const ComparisonFunc = fn(a: T, b: T)isize;

        const Node = struct {
            data: T,
            ref_count: usize,
            next: [256]?&Node,
        };

        pub fn init(allocator: &Allocator) Self {
            Self {
                .allocator = allocator,
                .root_node = null,
                .length = 0,
            }
        }

        pub fn deinit(self: &Self) void {
            if (self.root_node) | r | {
                push(r, *r);
            }

            var free_list: ?&Node = null;
            while (free_list) | *f | {
                const node = pop(f);
                // Add all node's children
                for (node.next) | n | if (n) | child | push(f, child);
                // Free the node
                self.allocator.destroy(node);
            }
        }

        fn push(list: &&Node, node: &Node) void {
            node.data = (*list).data;
            *list = node;
        }

        fn pop(list: &&Node) &Node {
            const result = *list;
            (*list).data = result.data;
            return result;
        }

        pub fn insert(self: &Self, key: []u8, value: T) !void {
            var node = find_end(trie, key);
            
            // Replace existing value
            if (node != null and node.data != null) {
                node.data = value;
                return;
            }

            // Iterate until end of string
            var current = &self.root_node;
            var p = key;
            while (true) {
                node = *current;
                if (node == null) {
                    node = self.allocator.create(Node) catch {
                        insert_rollback(trie, key);
                        return error.NoMem;
                    };
                    node.data = null;
                    // Link in to the trie
                    *current = node;
                }
                node.ref_count += 1;
                // Current character
                const c = *p;
                
                if (c == null) {
                    node.data = value;
                    break;
                }
                // Advance to the next node
                current = &node.next[c];
                p += 1;
            }
        }

        pub fn remove(self: &Self, key: []u8) %void {
            var node = find_end(trie, key);
            if (node != null and node.data != null) {
                node.data = null;
            } else {
                return 0;
            }

            node = self.root_node;
            var last_next_ptr = &self.root_node;
            var p = key;

            while(true) {
                // Find the next node
                const c = *p;
                const next = node.next[c];

                // Free this node if necessary
                node.ref_count -= 1;

                if (node.ref_count <= 0) {
                    free(node);
                    // Set the "next" pointer on the previous node to null,
                    // to unlink the freed node from the tree.
                    if (last_next_ptr != null) {
                        *last_next_ptr = null;
                        last_next_ptr = null;
                    }
                }

                // Go to the next character or finish
                if (c == null) {
                    break;
                } else {
                    p += 1;
                }

                // If necessary, save the location of the "next" pointer
                // so that it may be set to null on the next iteration if
                // the next node visited is freed.
                if (last_next_ptr != null) {
                    last_next_ptr = &node.next[c];
                }
                // Jump to the next node
                node = next;
            }
        }

        pub fn lookup(self: &Self, key: []u8) T {
            return if ( find_end(trie, key) ) | node | {
                node.data
            } else {
                null
            }
        }

        pub fn num_entries(self: &Self)usize {
            return if ( self.root_node ) | node | {
                node.ref_count
            } else {
                0
            };
        }

        fn find_end(self: &Self, key: []u8) ?&Node {
            // Search down the trie until the end of string is reached
            var node = self.root_node;
            for (key) | k | {
                if (node) | n | {
                    node = n.next[k];
                } else {
                    // Not found
                    return null;
                }
            }
            // This key is present if the value at the last node is not null
            return node;
        }

        fn insert_rollback(self: &Self, key: []u8) void {
            var node = self.root_node;
            var prev_ptr = &self.root_node;
            var p = key;

            while (node) | n | {
                // Find the next node now. We might free this node.
                var next_prev_ptr = &n.next[*p];
                var next_node = *next_prev_ptr;
                p += 1;

                // Decrease the use count and free the node if it reaches zero.
                n.ref_count -= 1;
                if (n.ref_count == 0) {
                    self.allocator.free(n);
                    if (prev_ptr) | p | {
                        *p = null;
                    }
                    next_prev_ptr = null;
                }
                // Update pointers
                node = next_node;
                prev_ptr = next_prev_ptr;
            }
        }
    }
}

const c = @import("../c.zig");

test "Trie" {
    var list = Trie(i32).init(&c.mem.allocator);
    defer list.deinit();
}

