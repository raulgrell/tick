const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

error NotFound;

pub fn DLinkedList(comptime T: type) -> type {
    struct {
        root: ?&&ListEntry,
        length: usize,
        allocator: &Allocator,

        const Self = this;
        const EqualityFunc = fn(a: T, b: T) -> bool;
        const ComparisonFunc = fn(a: T, b: T) -> isize;

        const Iterator = struct {
            prev_next: ?&&ListEntry,
            current: ?&ListEntry,

            pub fn next(iter: &Iterator) -> ?T {
                const p_n = if(iter.prev_next) | x | *x else null;
                if (iter.current) | entry | {
                    // p_n might actually be null, check this
                    if (entry != ??p_n) {
                        iter.current = p_n;
                    } else {
                        iter.prev_next = if(entry.next) | *n | n else null;
                        iter.current = entry.next;
                    }
                } else {
                    iter.current = p_n;
                }
                return if (iter.current) | entry | entry.data else null;
            }
        };

        const ListEntry = struct {
            data: T,
            prev: ?&ListEntry,
            next: ?&ListEntry,
        };

        pub fn init(allocator: &Allocator) -> Self {
            Self {
                .root = null,
                .length = 0,
                .allocator = allocator,
            }
        }

        pub fn deinit(self: &Self) {
            var entry = self.root;
            while (entry) | e | {
                var next = (*e).next;
                self.allocator.destroy(e);
                entry = if (next) | *n | n else null;
            }
        }

        pub fn prepend(list: &Self, data: T) -> %&ListEntry {
            var newentry = %return list.allocator.create(ListEntry);
            newentry.data = data;

            if (list.root) | entry | {
                (*entry).prev = newentry;
            }

            newentry.prev = null;
            newentry.next = if (list.root) | r | *r else null;
            list.root = &newentry;

            return newentry;
        }

        pub fn append(list: &Self, data: T) -> %&ListEntry {
            var newentry = %return list.allocator.create(ListEntry);
            newentry.data = data;
            newentry.next = null;

            if (list.root) | r | {
                // Find last element and insert
                var current = *r;
                while(current.next) | n | current = n;
                newentry.prev = current;
                current.next = newentry;
            } else {
                // New head
                list.root = &newentry;
                newentry.prev = null;
            }
            return newentry;
        }

        pub fn nth_entry(list: &const Self, n: usize) -> ?&ListEntry {
            var i = usize(0);
            var entry = if(list.root) | r | *r else null;
            while(i < n) : ( i += 1) {
                if (entry) | e | {
                    entry = e.next;
                } else {
                    return null;
                }
            }
            return entry;
        }

        pub fn nth_data(list: &const Self, n: usize) -> ?T {
            return if (nth_entry(list, n)) | entry | entry.data else null;
        }

        pub fn find_data(list: &const Self, equal: EqualityFunc, data: T) -> ?&ListEntry {
            var current = list;
            while(current) | c | : (current = c.next) {
                if (equal(c.data, data) != 0) return c;
            }
            // Not found
            return null;
        }

        pub fn length(list: &const Self) -> usize {
            var length = 0;
            var entry = list;
            while (entry) | e | : ( entry = e.next ) {
                length += 1;
            }
            return length;
        }

        pub fn to_array(list: &const Self) -> []T {
            const length = length(list);
            var array = %return list.allocator.alloc(T, length);

            var current = list;
            { var i = usize(0); while (i < length) : (i += 1) {
                // Add data to array
                array[i] = current.data;
                current = current.next;
            }}

            return array;
        }

        pub fn remove_entry(list: &Self, entry: &ListEntry) -> %void {
            if (list.root == null) {
                return error.NotFound;
            }

            if (entry.prev) | p | {
                p.next = entry.next;
                if (entry.next) | n | {
                    // Update next prev pointer to new value
                    n.prev = entry.prev;
                }
            } else {
                // Update head
                list.root = if(entry.next) | *n | n else null;

                if (entry.next) | n | {
                    // Update next prev pointer
                    n.prev = null;
                }
            }
            list.allocator.destroy(entry);
        }

        pub fn remove_data(list: &Self, equal: EqualityFunc, data: T) -> usize {
            var entries_removed = usize(0);

            var current = list.root;
            while (current) | entry | {
                const e = *entry;
                var next = e.next;
                if (equal(e.data, data)) {
                    if (e.prev) | p | {
                        // Point the previous entry at its new location
                        p.next = e.next;
                    } else {
                        // Update head
                        list.root =  if(e.next) | *n | n else null;
                    }
                    if (e.next) | n | {
                        n.prev = e.prev;
                    }
                    list.allocator.destroy(entry);
                    entries_removed += 1;
                }
                current =  if(next) | *n | n else null;;
            }

            return entries_removed;
        }

        pub fn iterate(list: &Self) -> Iterator {
            Iterator {
                .prev_next = list.root,
                .current = null,
            }
        }
    }
}

const c = @import("../c.zig");

fn eql(a: i32, b: i32) -> bool {
    return a == b
}

test "DLinkedList" {
    var list = DLinkedList(i32).init(&c.mem.allocator);
    defer list.deinit();

    const two = %%list.append(2);
    const one = %%list.prepend(1);
    const three = %%list.append(3);
    const zero = %%list.prepend(0);

    const first = ??list.nth_entry(0);
    const second = ??list.nth_entry(1);
    const third = ??list.nth_entry(2);
    const fourth = ??list.nth_entry(3);

    %%list.remove_entry(second);

    var it = list.iterate();
    while ( it.next() ) | data | {
        assert(list.remove_data(eql, data) == 1);
    };
}

