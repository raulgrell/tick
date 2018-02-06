const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

pub fn SLinkedList(comptime T: type)type {
    struct {
        root: ?&&Entry,
        length: usize,
        allocator: &Allocator,
        
        const Self = this;
        const EqualityFunc = fn(a: T, b: T)bool;
        const ComparisonFunc = fn(a: T, b: T)isize;

        const Iterator = struct {
            prev_next: &Self,
            current: &Entry,

            pub fn done(iter: &Iterator)bool {
                if (iter.current == null or iter.current != *iter.prev_next) {
                    return *iter.prev_next == null;
                } else {
                    return iter.current.next == null;
                }
            }

            pub fn next(iter: &Iterator)?T {
                if (iter.current == null or iter.current != *iter.prev_next) {
                    iter.current = *iter.prev_next;
                } else {
                    iter.prev_next = &iter.current.next;
                    iter.current = iter.current.next;
                }
                return iter.current.data;
            }

            pub fn remove(iter: &Iteratorator) %void {
                if (iter.current == null or iter.current != *iter.prev_next) {
                    // No element, do nothing.
                } else {
                    // Remove the current entry
                    *iter.prev_next = iter.current.next;
                    free(iter.current);
                    iter.current = null;
                }
            }
        };

        const Entry = struct {
            data: T,
            next: ?&Entry,
        };

        pub fn init(allocator: &Allocator)Self {
            Self {
                .root = null,
                .length = 0,
                .allocator = allocator,
            }
        }

        pub fn deinit(list: &Self) void {
            // var entry = list.root;
            // while (entry) | e | {
            //     const next = e.next;
            //     list.allocator.destroy(e);
            //     entry = next;
            // }
        }

        pub fn grow(list: &Self) void {

        }

        pub fn prepend(list: &Self, data: T) %&Entry {
            var newentry = list.allocator.create(Entry);
            newentry.data = data;
            newentry.next = *list;

            *list = newentry;
            return newentry;
        }

        pub fn append(list: &Self, data: T) %&Entry {
            var newentry = try list.allocator.create(Entry);
            newentry.data = data;
            newentry.next = null;

            if (list.root) | l | {
                // Find the end of list
                var it = *l;
                while (it.next) | n | { it = n; }
                it.next = newentry;
            } else {
                // Create the start of the list
                list.root = &newentry;
            }
            return newentry;
        }

        pub fn nth_entry(list: &Self, n: usize)?&Entry {
            var entry = list;
            var i = usize(0);
            while (i < n) : (i += 1) {
                if (entry) | e | {
                    entry = e.next;
                } else {
                    return null;
                }
            }
            return entry;
        }

        pub fn nth_data(list: &Self, n: usize)?T {
            return if (nth_entry(list, n)) | entry | {
                entry.data
            } else {
                null
            };
        }

        pub fn length(list: &Self)usize {
            var length = 0;
            var entry = list;

            while (entry) | e | : (entry = e.next) {
                length += 1;
            }

            return length;
        }

        pub fn to_array(list: &Self)[]T {
            const length = length(list);
            var array = list.allocator.alloc(T, length);

            var it = list;
            var i = usize(0);
            while (i < length) : (i += 1) {
                array[i] = it.data;
                it = it.next;
            }
            return array;
        }

        pub fn remove_entry(list: &Self, entry: &Entry) %void {
            // Check if entry is head
            if (*list == entry) {
                // Unlink and update head
                *list = entry.next;
            } else {
                // Find entry
                var it = *list;
                while (it != null and it.next != entry) {
                    it = it.next;
                }

                if (it) | cur | {
                    // Remove current entry
                    cur.next = entry.next;
                } else {
                    // Not found
                    return error.NotFound;
                }
            }

            list.allocator.free(entry);
        }

        pub fn remove_data(list: &Self, equal: EqualityFunc , data: T) %usize {
            var entries_removed = 0;
            var it = list;
            while (*it) | entry | {
                if (equal((*it).data, data) != 0) {
                    // Remove entry and free
                    var next = (*it).next;
                    list.allocator.free(*it);
                    *it = next;
                    entries_removed += 1;
                } else {
                    it = &((*it).next);
                }
            }
            return entries_removed;
        }

        pub fn sort(list: &Self, compare_func: ComparisonFunc) void {
            sort_internal(list, compare_func);
        }

        pub fn find_data(list: &Self, equal: EqualityFunc, data: T)&Entry {
            var it = list;
            while (it) | entry | : ( it = it.next) {
                if (equal(it.data, data) != 0) {
                    return it;
                }
            }
            return null;
        }

        pub fn iterate(list: &Self, iter: &Iterator)Iterator {
            Iterator {
                .prev_next = list,
                .current = null,
            }
        }

        fn sort_internal(list: &Self, compare_func: ComparisonFunc)&Entry {
            // Already sorted
            if (*list == null or (*list).next == null) {
                return *list;
            }

            // Sort entries relative to pivot
            var less_list = null;
            var more_list = null;
            var pivot = *list;

            // Start from the second entry.
            var it = (*list).next;
            while (it) | entry | {
                Entry *next = it.next;
                if (compare_func(it.data, pivot.data) < 0) {
                    it.next = less_list;
                    less_list = it;
                } else {
                    it.next = more_list;
                    more_list = it;
                }
                it = next;
            }

            // Sort sublists recursively
            var less_list_end = sort_internal(&less_list, compare_func);
            var more_list_end = sort_internal(&more_list, compare_func);

            // Create the new list starting from the less list
            *list = less_list;
            if (less_list) |_| {
                less_list_end.next = pivot;
            } else {
                // Start from pivot
                *list = pivot;
            }

            // Append the more list after the pivot
            pivot.next = more_list;
            if (more_list) |_| {
                return more_list_end;
            } else {
                // Pivot was the last entry.
                return pivot;
            }
        }
    }
}

const c = @import("../c.zig");

test "SLinkedList" {
    var list = SLinkedList(i32).init(&c.mem.allocator);
    defer list.deinit();

    _ = %%list.append(1);
    _ = %%list.append(2);
    _ = %%list.append(3);
}

