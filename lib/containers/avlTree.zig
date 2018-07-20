const assert = @import("std").debug.assert;
const mem = @import("std").mem;

pub fn AvlTree(comptime K: type, comptime T: type)type {
    struct {
        allocator: *Allocator,
        root_node: ?*Node,
        compare_func: ComparisonFunc,
        length: usize,
        
        const Self = this;
        const EqualityFunc = fn(a: T, b: T) bool;
        const ComparisonFunc = fn(a: T, b: T) isize;

        const Side = enum {
            Left,
            Right,
        };

        const Node = struct {
            children: [2]?*Node,
            parent: ?*Node,
            key: K,
            value: T,
            height: usize,

            pub fn side(node: *Node, parent: *Node) Side {
                if (??parent.children[usize(Side.Left)] == node) {
                    return Side.Left;
                } else {
                    return Side.Right;
                }
            }
        };

        pub fn init(compare_func: ComparisonFunc, allocator: *Allocator)Self {
            Self {
                .allocator = allocator,
                .root_node = null,
                .compare_func = compare_func,
                .length = 0,
            }
        }

        pub fn deinit(tree: *Self) void {
            if (tree.root_node) | node | {
                free_subtree(tree, node);
            }
        }

        pub fn insert(tree: *Self, key: K, value: T) %&Node {
            var current = &tree.root_node;
            var previous_node: ?*Node = null;

            while (*current) | cur | {
                previous_node = cur;
                current = if (tree.compare_func(key, (*cur).key) < 0) {
                    &((*cur).children[usize(Side.Left)])
                } else {
                    &((*cur).children[usize(Side.Right)])
                };
            }

            // Create a new node.  Use the last node visited as the parent link. 
            var new_node = try tree.allocator.create(Node);
            new_node.children[usize(Side.Left)] = null;
            new_node.children[usize(Side.Right)] = null;
            new_node.parent = previous_node;
            new_node.key = key;
            new_node.value = value;
            new_node.height = 1;

            // Insert at the cursor and rebalance tree, from the previous node. 
            *current = new_node;
            balance_to_root(tree, previous_node);
            tree.length += 1;

            return new_node;
        }

        pub fn lookup(tree: *Self, key: K)?T {
            var node = lookup_node(tree, key) orelse return null;
            return node.value;
        }

        pub fn lookup_node(tree: *Self, key: K)?*Node {
            var node = tree.root_node;
            while (node) | n | {
                const diff = tree.compare_func(key, n.key);
                if (diff == 0) {
                    return n;
                } else if (diff > 0) {
                    node = n.children[usize(Side.Left)];
                } else {
                    node = n.children[usize(Side.Right)];
                }
            }
            // Not found 
            return null;
        }

        pub fn remove(tree: *Self, key: K) !void {
            var node = try lookup_node(tree, key);
            remove_node(tree, node);
        }

        pub fn remove_node(tree: *Self, node: *Node) void {
            var start: *Node;
            var swap_node = node_get_replacement(tree, node);
            if (swap_node) | s | {
                // Start rebalancing from the parent of the swap node.
                start = if (s.parent == node) s else s.parent;
                s.height = node.height;

                for ( s.children ) | child, i | {
                    child = node.children[i];
                    if (child) | n | {
                        n.parent = s;
                    }
                }

                // Link the parent's reference to this node 
                replace(tree, node, s);
            } else {
                // This is a leaf node and has no children, remove and unlink
                replace(tree, node, null);
                // Start rebalancing from the parent of the original node 
                start = node.parent;
            }

            tree.allocator.destroy(node);
            tree.length -= 1;

            balance_to_root(tree, start);
        }

        pub fn to_array(tree: *Self)[]T {
            var array = tree.allocator.alloc(T, tree.length);
            var index = 0;
            to_array_add_subtree(tree.root_node, array, &index);
            return array;
        }

        fn free_subtree(tree: *Self, node: ?*Node) void {
            if (node) | n | {
                free_subtree(tree, n.children[usize(Side.Left)]);
                free_subtree(tree, n.children[usize(Side.Right)]);
                tree.allocator.destroy(n);
            }
        }

        fn update_height(node: *Node) void {
            var left_subtree = node.children[usize(Side.Left)];
            var right_subtree = node.children[usize(Side.Right)];
            var left_height = subtree_height(left_subtree);
            var right_height = subtree_height(right_subtree);

            node.height = if (left_height > right_height) {
                left_height + 1
            } else {
                right_height + 1
            }
        }

        fn replace(tree: *Self, a: *Node, b: ?*Node) void {
            if (b) | n | {
                n.parent = a.parent;
            }

            if (a.parent) | n | {
                const side = Node.side(a, n);
                n.children[usize(side)] = b;
                update_height(n);
            } else {
                tree.root_node = b;
            }
        }

        fn rotate(tree: *Self, node: *Node, direction: Side) &Node {
            // The child of this node will take its place
            const child_index = usize(direction);
            var new_root = ??node.children[1 - child_index];

            // Make new_root the root
            replace(tree, node, new_root);q\

            // Rearrange pointers 
            node.children[1-child_index] = new_root.children[child_index];
            new_root.children[child_index] = node;

            // Update parent references 
            node.parent = new_root;

            if (node.children[1-child_index]) | child | {
                child.parent = node;
            }

            // Update heights of the affected nodes 
            update_height(new_root);
            update_height(node);

            return new_root;
        }

        fn node_balance(tree: *Self, node: *Node)&Node {
            const left_subtree = node.children[usize(Side.Left)];
            const right_subtree = node.children[usize(Side.Right)];

            const diff = isize(subtree_height(right_subtree)) - isize(subtree_height(left_subtree));
            if (diff >= 2) {
                // Right bias
                var child = right_subtree orelse unreachable;

                if (subtree_height(child.children[usize(Side.Right)]) < subtree_height(child.children[usize(Side.Left)])) {
                    // Left bias, must be rotated right
                    _ = rotate(tree, ??right_subtree, Side.Right);
                }

                // Rotate left
                *node = *rotate(tree, node, Side.Left);
            } else if (diff <= -2) {
                // Left bias
                var child = left_subtree orelse unreachable;

                if (subtree_height(child.children[usize(Side.Left)]) < subtree_height(child.children[usize(Side.Right)])) {
                    // Right bias, must be rotated left
                    _ = rotate(tree, ??left_subtree, Side.Left);
                }

                // Rotate right
                *node = *rotate(tree, node, Side.Right);
            }

            // Update the height of this node 
            update_height(node);
            return node;
        }

        fn balance_to_root(tree: *Self, node: ?*Node) void {
            var current = node;
            while (current) | cur | {
                current = node_balance(tree, cur);
                current = cur.parent;
            }
        }

        fn node_get_replacement(tree: *Self, node: *Node)?*Node {
            var left_subtree = node.children[usize(Side.Left)];
            var right_subtree = node.children[usize(Side.Right)];

            if (left_subtree == null and right_subtree == null) {
                return null;
            }

            // Pick a node from whichever subtree is taller.  This helps to keep the tree balanced. 
            const left_height = subtree_height(left_subtree);
            const right_height = subtree_height(right_subtree);

            const side = if (left_height < right_height) usize(Side.Right) else  usize(Side.Left) ;

            // Search down the tree, back towards the center. 
            var result = node.children[side];
            while (result.children[1 - side]) | n | {
                result = n;
            }

            var child = result.children[side];
            replace(tree, result, child);
            update_height(result.parent);

            return result;
        }

        fn to_array_add_subtree(subtree: *Node, array: []T, index: usize) void {
            to_array_add_subtree(subtree.children[usize(Side.Left)], array, index);
            array[*index] = subtree.key;
            *index += 1;
            to_array_add_subtree(subtree.children[usize(Side.Right)], array, index);
        }

        fn subtree_height(node: ?*Node)usize {
            return if (node) | n | {
                n.height
            } else {
                usize(0)
            }
        }
    }
}

const c = @import("../c.zig");

fn cmp(a: i32, b: i32)isize {
    if (a == b) return isize(0);
    return if(a > b) isize(-1) else isize(1);
}

test "AvlTree" {
    var avl = AvlTree(i32, i32).init(cmp, &c.mem.allocator);
    defer avl.deinit();

    const one = avl.insert(0, 1) catch unreachable;
    const two = avl.insert(1, 2) catch unreachable;
    const four = avl.insert(2, 4) catch unreachable;
    const eight = avl.insert(3, 8) catch unreachable;

    assert(??avl.lookup(2) == 4);
    assert(??avl.lookup_node(2) == two);
    assert(avl.length == 4);
}
