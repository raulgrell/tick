const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

pub fn RBTree(comptime K: type, comptime T: type) -> type {
    struct {
        root_node: ?&Node,
        length: usize,
        compare_func: ComparisonFunc,
        allocator: &Allocator,

        const Self = this;
        const EqualityFunc = fn(a: T, b: T) -> bool;
        const ComparisonFunc = fn(a: T, b: T) -> isize;

        const NodeColor = enum {
            Red,
            Black,
        };

        const NodeSide = enum {
            Left, // 0
            Right, // 1

            pub inline fn opposite(side: &const NodeSide) -> NodeSide {
                switch (*side) {
                    NodeSide.Left => NodeSide.Right,
                    NodeSide.Right => NodeSide.Left,
                }
            }

            pub inline fn index(side: &const NodeSide) -> usize {
                return usize(side)
            }
        };

        const Node = struct {
            color: NodeColor,
            key: K,
            value: T,
            parent: ?&Node,
            children: [2]?&Node,

            pub fn child(node: &Node, side: NodeSide) -> ?&Node {
                return node.children[usize(side)];
            }

            pub fn side(node: &Node, parent: &Node) -> NodeSide {
                if (parent.children[usize(NodeSide.Left)] != null and ??parent.children[usize(NodeSide.Left)] == node) {
                    return NodeSide.Left;
                } else {
                    return NodeSide.Right;
                }
            }

            pub fn sibling(node: &Node, parent: &Node) -> ?&Node {
                const node_side = usize(side(node, parent));
                return parent.children[1 - node_side];
            }

            pub fn uncle(node: &Node, parent: &Node, grandparent: &Node) -> ?&Node {
                return sibling(parent, grandparent);
            }
        };

        pub fn init (compare_func: ComparisonFunc, allocator: &Allocator) -> Self {
            Self {
                .root_node = null,
                .length = 0,
                .compare_func = compare_func,
                .allocator = allocator,
            }
        }

        pub fn deinit(self: &Self) {
            if (self.root_node) | n | {
                self.free_subtree(n);
            }
        }

        pub fn insert(self: &Self, key: K, value: T) -> %&Node {
            var node = %return self.allocator.create(Node);
            node.key = key;
            node.value = value;
            node.color = NodeColor.Red;
            node.children[usize(NodeSide.Left)] = null;
            node.children[usize(NodeSide.Right)] = null;

            // Binary tree insert
            var parent: ?&Node = null;
            var current = &self.root_node;
            while (*current) | *n | {
                parent = *n;
                const side = if (self.compare_func(value, (*n).value) < 0) {
                    NodeSide.Left
                } else {
                    NodeSide.Right
                };
                current = &(*n).children[usize(side)];
            }

            // Insert at current node
            *current = node;
            node.parent = parent;

            // Possibly reorder the self.
            insert_case1(self, node);
            self.length += 1;

            return node;
        }

        pub fn lookup(self: &Self, key: K) -> ?T {
            return if ( lookup_node(self, key) ) | node | {
                node.value
            } else {
                null
            };
        }

        pub fn lookup_node(self: &Self, key: K) -> ?&Node{
            var node = self.root_node;

            while (node) | n | {
                const diff = self.compare_func(key, n.key);
                if (diff == 0) {
                    return n;
                }
                const side = if (diff < 0) NodeSide.Left else NodeSide.Right;
                node = n.children[usize(side)];
            }

            // Not found.
            return null;
        }

        pub fn remove(self: &Self, key: K) -> %void {
            var node = lookup_node(self, key) ?? return error.NotFound;
            remove_node(self, node);
        }

        pub fn remove_node(self: &Self, node: &Node) -> %void {

        }

        // Insert case 1: New node at root, must always be black.
        fn insert_case1(self: &Self, node: &Node) {
            if (node.parent) | p | {
                // Not root
                insert_case2(self, node, p);
            } else {
                // The root node must be black
                node.color = NodeColor.Black;
            }
        }

        // Insert case 2: If the parent of the new node is red, this
        // conflicts with the red-black tree conditions, as both children
        // of every red node are black.
        fn insert_case2(self: &Self, node: &Node, parent: &Node) {
            if (parent.color != NodeColor.Black) {
                // New node must have a grandparent (parent is red, and root node is always black).
                const grandparent = (??parent.parent);
                insert_case3(self, node, parent, grandparent);
            }
        }

        // Insert case 3: If the parent and uncle are both red, repaint them
        // both black and repaint the grandparent red. 
        fn insert_case3(self: &Self, node: &Node, parent: &Node, grandparent: &Node) {
            var uncle = Node.uncle(node, parent, grandparent);
            if (uncle != null and (??uncle).color == NodeColor.Red) {
                parent.color = NodeColor.Black;
                (??uncle).color = NodeColor.Black;
                grandparent.color = NodeColor.Red;
                // Recurse to grandparent
                insert_case1(self, grandparent);
            } else {
                insert_case4(self, node);
            }
        }

        // Case 4: If the parent is red, but the uncle is black, we need to do
        // some rotations to keep the tree balanced and complying with the tree
        // conditions.  If the node is on the opposite side relative to its parent
        // as the parent is relative to its grandparent, rotate around the
        // parent.  Either way, we will continue to case 5.
        // eg.
        //         B                              B
        //        / \                            / \
        //       R   B          ->     node ->  R   B
        //        \                            /
        //         R  <- node                 R

        fn insert_case4(self: &Self, node: &Node) {
            var next_node: &Node = undefined;
            // Note that at this point, by implication from case 3, we know
            // that the parent is red, but the uncle is black.  We therefore
            // only need to examine what side the node is on relative
            // to its parent, and the side the parent is on relative to
            // the grandparent.
            const parent = (??node.parent);
            const grandparent = (??parent.parent);
            const side = Node.side(node, parent);
            if (side != Node.side(parent, grandparent)) {
                // After the rotation, we will continue to case 5, but the parent node will be at the bottom.
                next_node = parent;
                // Rotate around the parent in the opposite direction to side.
                _ = rotate(self, parent, side.opposite());
            } else {
                next_node = node;
            }
            insert_case5(self, next_node);
        }

        // Case 5: The node is on the same side relative to its parent as the
        // parent is relative to its grandparent.  The node and its parent are
        // red, but the uncle is black.
        // Now, rotate at the grandparent and recolor the parent and grandparent
        // to black and red respectively.
        //               G/B                 P/B
        //              /   \               /   \
        //           P/R     U/B    ->   N/R     G/R
        //          /   \                       /   \
        //       N/R      ?                   ?      U/B

        fn insert_case5(self: &Self, node: &Node) {
            var parent = (??node.parent);
            var grandparent = (??parent.parent);

            // Side relative to the parent?
            const side = Node.side(node, parent);

            // Rotate at the grandparent, in the opposite direction to side.
            _  = rotate(self, grandparent, side.opposite());

            // Recolor the (old) parent and grandparent.
            parent.color = NodeColor.Black;
            grandparent.color = NodeColor.Red;
        }

        fn replace(self: &Self, a: &Node, b: ?&Node) {
            if (b) | node | {
                node.parent = a.parent;
            }

            if (a.parent) | p | {
                const side = Node.side(a, p);
                p.children[usize(side)] = b;
            } else {
                self.root_node = b;
            }
        }

        fn rotate(self: &Self, node: &Node, dir: NodeSide) -> &Node {
            // Replace with child. For a left rotation, it is the right child, and vice versa.
            const direction = usize(dir);
            var new_root = node.children[1 - direction];

            // Make new_root the root, update pointers.
            replace(self, node, new_root);
            node.children[1 - direction] = (??new_root).children[direction];
            (??new_root).children[direction] = node;
            node.parent = new_root;

            if (node.children[1 - direction]) | child | {
                child.parent = node;
            }

            return (??new_root);
        }

        fn free_subtree(self: &Self, node: ?&Node) {
            if (node) | n | {
                self.free_subtree(n.children[usize(NodeSide.Left)]);
                self.free_subtree(n.children[usize(NodeSide.Right)]);
                self.allocator.destroy(n);
            }
        }
    }
}

const c = @import("../c.zig");
const io = @import("std").io;

fn comp(a: i32, b: i32) -> isize {
    if (a == b) return isize(0);
    return if(a  > b) isize(1) else isize(-1);
}

test "RBTree" {
    var self = RBTree(i32, i32).init(comp, &c.mem.allocator);
    defer self.deinit();

    _ = self.insert(0,1);
    _ = self.insert(1,2);
    _ = self.insert(2,4);
    _ = self.insert(3,8);

    assert(??self.lookup(0) == 1);
    assert(??self.lookup(1) == 2);
    assert(??self.lookup(2) == 4);
    assert(??self.lookup(3) == 8);

}

