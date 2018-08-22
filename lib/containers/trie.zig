const assert = @import("std").debug.assert;
const mem = @import("std").mem;

pub fn Trie(comptime T: type) type {
    struct {
        length: usize,
        allocator: *Allocator,
        root_node: ?**Node,

        const Self = this;

        const Node = struct {
            data: ?T,
            ref_count: usize,
            next: [256]?*Node,
        };

        pub fn init(allocator: *Allocator) Self {
            Self {
                .allocator = allocator,
                .root_node = null,
                .length = 0,
            }
        }

        pub fn deinit(self: *Self) void {
            var free_list: ?*Node = null;
            if (self.root_node) | r | push(free_list, r);
            while (free_list) | *f | {
                const node = pop(f);
                for (node.next) | n | if (n) | child | push(&free_list, child);
                self.allocator.destroy(node);
            }
        }

        fn push(list: **Node, node: *Node) void {
            node.data = (*list).data;
            *list = node;
        }

        fn pop(list: **Node) &Node {
            const result = *list;
            (*list).data = result.data;
            return result;
        }

        pub fn insert(self: *Self, key: []u8, value: T) !void {
            var node = findOrNull(trie, key);
            
            if (node != null and node.?.data != null) {
                node.?.data = value;
                return;
            }

            var current = &self.root_node;
            var i = 0;
            while (true) {
                node = current.*;
                if (node == null) {
                    node = self.allocator.create(Node) catch | err | {
                        insert_rollback(trie, key);
                        return err;
                    };
                    node.?.data = null;
                    current.* = node;
                }
                node.?.ref_count += 1;

                const c = key[i];
                if (i == key.len) {
                    node.?.data = value;
                    break;
                }
                current = &node.?.next[c];
                i += 1;
            }
        }

        pub fn remove(self: *Self, key: []u8) !void {
            var node = findOrNull(trie, key);
            if (node != null and node.?.data != null) {
                node.?.data = null;
            } else {
                return error.NotFound;
            }

            node = self.root_node;
            var parent_next_ptr = &self.root_node;
            var i = 0;

            while(true) {
                const c = key[i];
                const next = node.?.next[c];
                node.?.ref_count -= 1;
                if (node.?.ref_count <= 0) {
                    self.allocator.destroy(node);
                    if (parent_next_ptr) | *parent_next | {
                        parent_next = null;
                        parent_next_ptr = null;
                    }
                }

                if (i == key.len) {
                    break;
                } else {
                    i += 1;
                }

                if (parent_next_ptr != null) {
                    parent_next_ptr = &node.?.next[c];
                }

                node = next;
            }
        }

        pub fn lookup(self: *Self, key: []u8) T {
            return if ( findOrNull(trie, key) ) | node | node.data else null;
        }

        pub fn count(self: *Self) usize {
            return if ( self.root_node ) | node | node.ref_count else 0 ;
        }

        fn findOrNull(self: *Self, key: []u8) ?*Node {
            var node = self.root_node;
            for (key) | k | {
                if (node) | n | {
                    node = n.next[k];
                } else {
                    return null;
                }
            }
            return node;
        }

        fn insert_rollback(self: *Self, key: []u8) void {
            var node = self.root_node;
            var prev_ptr = &self.root_node;
            var i = 0;
            while (node) | n | {
                var next_prev_ptr = &n.next[key[i]];
                var next_node = next_prev_ptr.*.?;
                i += 1;
                n.ref_count -= 1;
                if (n.ref_count == 0) {
                    self.allocator.free(n);
                    if (prev_ptr) | *p | p = null;
                    next_prev_ptr = null;
                }
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

