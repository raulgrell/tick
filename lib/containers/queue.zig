const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

pub fn Queue(comptime T: type)type{
    struct {
        head: ?&Entry,
        tail: ?&Entry,
        allocator: &Allocator,

        const Self = this;
        
        const Entry = struct {
            data: T,
            prev: ?&Entry,
            next: ?&Entry,
        };

        pub fn init(allocator: &Allocator)Self {
            Self{
                .head = null,
                .tail = null,
                .allocator = allocator
            }
        }

        pub fn deinit(self: &Self) void {
            while (!is_empty(self)) pop_head(self);
        }

        pub fn push_head(self: &Self, data: T) %void {
            var new_entry = %%self.allocator.create(Entry);
            new_entry.data = data;
            new_entry.prev = null;
            new_entry.next = self.head;

            if (self.head) | h | {
                // New entry replaces current head
                h.prev = new_entry;
                self.head = new_entry;
            } else {
                // Previously empty, only one element
                self.head = new_entry;
                self.tail = new_entry;
            }
        }

        pub fn pop_head(self: &Self)?T {
            if (is_empty(self)) return null;

            // Unlink the first entry from the head of the queue
            const entry = self.head ?? return null;
            const result = entry.data;

            self.head = entry.next;
            if (self.head) | h | {
                // New head has no previous entry
                h.prev = null;
            } else {
                // Removed last element
                self.tail = null;
            }

            self.allocator.destroy(entry);
            return result;
        }

        pub fn peek_head(self: &Self)?T {
            if (self.head) | h | {
                return h.data;
            } else {
                return null;
            }
        }

        pub fn push_tail(self: &Self, data: T) %void {
            var new_entry = try self.allocator.create(Entry);
            new_entry.data = data;
            new_entry.prev = self.tail;
            new_entry.next = null;

            if (self.tail) | t | {
                t.next = new_entry;
                self.tail = new_entry;
            } else {
                // Previously empty, contains only new_entry
                self.head = new_entry;
                self.tail = new_entry;
            }
        }

        pub fn pop_tail(self: &Self)?T {
            if (self.tail) | t | {
                const result = t.data;
                defer self.allocator.destroy(t);

                if (t.prev) | p | {
                    p.next = null;
                    self.tail = p;
                } else {
                    self.head = null;
                    self.tail = null;
                }

                return result;
            } else {
                return null;
            }

        }

        pub fn peek_tail(self: &Self)?T {
            if (self.tail) | t | {
                return t.data;
            } else {
                return null;
            }
        }

        pub fn is_empty(self: &Self)bool {
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

