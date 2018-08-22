const assert = @import("std").debug.assert;
const mem = @import("std").mem;

pub fn Queue(comptime T: type)type{
    struct {
        head: ?*Entry,
        tail: ?*Entry,
        allocator: *Allocator,

        const Self = this;
        
        const Entry = struct {
            data: T,
            prev: ?*Entry,
            next: ?*Entry,
        };

        pub fn init(allocator: *Allocator)Self {
            Self{
                .head = null,
                .tail = null,
                .allocator = allocator
            }
        }

        pub fn deinit(self: *Self) void {
            while (self.head != null) pop_head(self);
        }

        pub fn push_head(self: *Self, data: T) !void {
            var new_entry = self.allocator.create(Entry) catch unreachable;
            new_entry.data = data;
            new_entry.prev = null;
            new_entry.next = self.head;

            if (self.head) | h | {
                h.prev = new_entry;
                self.head = new_entry;
            } else {
                self.head = new_entry;
                self.tail = new_entry;
            }
        }

        pub fn push_tail(self: *Self, data: T) !void {
            var new_entry = try self.allocator.create(Entry);
            new_entry.data = data;
            new_entry.prev = self.tail;
            new_entry.next = null;

            if (self.tail) | t | {
                t.next = new_entry;
                self.tail = new_entry;
            } else {
                self.head = new_entry;
                self.tail = new_entry;
            }
        }

        pub fn pop_head(self: *Self) ?T {
            const entry = self.head orelse return null;
            const result = entry.data;
            self.head = entry.next;
            if (self.head) | h | {
                h.prev = null;
            } else {
                self.tail = null;
            }

            self.allocator.destroy(entry);
            return result;
        }

        pub fn pop_tail(self: *Self) ?T {
            var t = self.tail orelse return null;
            defer self.allocator.destroy(t);

            const result = t.data;

            if (t.prev) | p | {
                p.next = null;
                self.tail = p;
            } else {
                self.head = null;
                self.tail = null;
            }

            return result;
        }

        pub fn peek_tail(self: *Self) ?T {
            return if (self.tail) | t |  t.data else null;
        }

        pub fn peek_head(self: *Self) ?T {
            return if (self.head) | h | h.data else null;
        }

        pub fn is_empty(self: *Self) bool {
            return self.head == null;
        }
    }
}

const c = @import("../c.zig");

test "Queue" {
    var deque = Queue(i32).init(&c.mem.allocator);
    defer deque.deinit();

    _ = deque.push_head(1);
    _ = deque.push_tail(2);
    _ = deque.push_tail(3);

    assert(??deque.peek_head() == 1);
    assert(??deque.peek_tail() == 3);
    assert(??deque.pop_head() == 1);
    assert(??deque.pop_tail() == 3);
    assert(??deque.pop_head() == 2);
    
}

