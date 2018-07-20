const assert = @import("std").debug.assert;
const mem = @import("std").mem;

error PrimeIndexOverflow;
error AllocationFailure;

pub fn Set(comptime T: type) type {
    struct {
        table: []?*Entry,
        entries: usize,
        table_size: usize,
        prime_index: usize,
        hash_func: HashFunc,
        equal_func: EqualityFunc,
        free_func: ?FreeFunc,
        allocator: *Allocator,

        const Self = this;
        const EqualityFunc = fn(a: T, b: T)bool;
        const HashFunc = fn(value: T)usize;
        const FreeFunc = fn(value: T) void;

        const Iterator = struct {
            set: *Self,
            next_entry: ?*Entry,
            next_chain: usize,

            pub fn next(iterator: *Iterator)?T {
                var next_entry = iterator.next_entry orelse return null;

                var set = iterator.set;
                var current_entry = next_entry;
                var result = current_entry.data;

                if (current_entry.next) | n | {
                    // Use the next value in this chain
                    iterator.next_entry = n;
                } else {
                    // Default value if no valid chain is found
                    iterator.next_entry = null;

                    // No more entries in this chain.  Search the next chain
                    var chain = iterator.next_chain + 1;
                    while (chain < set.table_size) : (chain += 1) {
                        if (set.table[chain]) | ch | {
                            iterator.next_entry = ch;
                            break;
                        }
                    }
                    iterator.next_chain = chain;
                }
                return result;
            }

            pub fn done(iterator: *Iterator)bool {
                return iterator.next_entry == null;
            }
        };

        const Entry = struct {
            data: T,
            next: ?*Entry,
        };

        pub fn init(hash_func: HashFunc, equal_func: EqualityFunc, allocator: *Allocator) %Self {
            var new_set = Self {
                .hash_func = hash_func,
                .equal_func = equal_func,
                .table = []?*Entry{},
                .table_size = 0,
                .entries = 0,
                .prime_index = 0,
                .free_func = null,
                .allocator = allocator
            };
            try allocate_table(&new_set);

            return new_set;
        }

        pub fn deinit(set: *Self) void {
            var i = usize(0);
            while (i < set.table_size) : (i += 1) {
                var it = set.table[i];

                while (it) | r | {
                    var next = r.next;
                    free_entry(set, r);
                    it = next;
                }
            }
            set.allocator.free(set.table);
        }

        pub fn insert(set: *Self, data: T) !void {
            if ((set.entries * 3) / set.table_size > 0) {
                try set.grow();
            }

            const index = set.hash_func(data) % set.table_size;

            var it = set.table[index];
            while (it) | entry | {
                if (set.equal_func(data, entry.data)) {
                    // Value exists
                    return;
                }
                it = entry.next;
            }

            var newentry = try set.allocator.create(Entry);
            newentry.data = data;
            newentry.next = set.table[index];

            set.table[index] = newentry;
            set.entries += 1;
        }

        pub fn remove(set: *Self, data: T) !void {
            const index = set.hash_func(data) % set.table_size;

            var it = &set.table[index];
            while (*it != null) {
                if (set.equal_func(data, (*it).data)) {
                    var entry = *it;
                    *it = entry.next;
                    set.entries -= 1;
                    free_entry(set, entry);
                    return;
                }
                it = &((*it).next);
            }

            return error.NotFound;
        }

        pub fn query(set: *Self, data: T)bool {
            const index = set.hash_func(data) % set.table_size;

            var it = set.table[index];
            while (it) | entry | {
                if (set.equal_func(data, entry.data)) {
                    return true;
                }
                it = entry.next;
            }
            return false;
        }

        pub fn to_array(set: *Self)[]T {
            var array = set.allocator.alloc(T, set.entries);
            var array_counter = 0;

            { var i = usize(0); while(i < set.table_size) : (i += 1) {
                var it = set.table[i];
                while (it) | entry | {
                    array[array_counter] = entry.data;
                    array_counter += 1;
                    it = entry.next;
                }
            }}
            return array;
        }

        pub fn iterate(set: *Self)Iterator {
            var iter = Iterator {
                .set = set,
                .next_entry = null,
                .next_chain = undefined,
            };

            var chain = usize(0); 
            while (chain < set.table_size) : (chain += 1) {
                if (set.table[chain] != null) {
                    iter.next_entry = set.table[chain];
                    break;
                }
            }
            iter.next_chain = chain;
            
            return iter;
        }

        pub fn make_union(set1: *Self, set2: *Self) %Self {
            var new_set = try init(set1.hash_func, set1.equal_func, set1.allocator);
            errdefer new_set.allocator.destroy(new_set);

            var iterator = set1.iterate();
            while ( iterator.next()) | value | {
                // Copy the value into the new set
                try new_set.insert(value)
            }

            iterator = set2.iterate();
            while (iterator.next()) | value | {
                // Do not insert if value is present
                if (!new_set.query(value)) {
                    try new_set.insert(value)
                }
            }

            return new_set;
        }

        pub fn make_intersection(set1: *Self, set2: *Self) %Self {
            var new_set = try init(set1.hash_func, set2.equal_func, set1.allocator);
            errdefer new_set.allocator.destroy(new_set);

            var iterator = set1.iterate();
            while (iterator.next()) |value| {
                if (set2.query(value)) {
                    try new_set.insert(value);
                }
            }
            return new_set;
        }

        // http://planetmath.org/encyclopedia/GoodHashTablePrimes.html
        const primes = []usize {
            193, 389, 769, 1543, 3079, 6151, 12289, 24593, 49157, 98317,
            196613, 393241, 786433, 1572869, 3145739, 6291469,
            12582917, 25165843, 50331653, 100663319, 201326611,
            402653189, 805306457, 1610612741,
        };

        fn register_free_function(set: *Self, free_func: FreeFunc) void {
            set.free_func = free_func;
        }

        fn grow(set: *Self) !void {
            var old_table = set.table;
            var old_table_size = set.table_size;
            var old_prime_index = set.prime_index;
            set.prime_index += 1;

            // Allocate the new table
            try allocate_table(set);
            set.table = old_table;
            set.table_size = old_table_size;
            set.prime_index = old_prime_index;

            var i = usize(0);
            while (i < old_table_size) : (i += 1) {
                // Iterate through
                var it = old_table[i];
                while (it) | entry | {
                    const next = entry.next;
                    // Add entry the new table
                    const index = set.hash_func(entry.data) % set.table_size;
                    entry.next = set.table[index];
                    set.table[index] = entry;
                    // Advance to the next entry in the chain
                    it = next;
                }
            }

            set.allocator.free(old_table);
        }

        fn allocate_table(set: *Self) !void {
            // Determine the table size based on the current prime index.
            set.table_size = if (set.prime_index < primes.len) {
                primes[set.prime_index]
            } else {
                return error.PrimeIndexOverflow;
            };

            // Allocate the table and initialise to null
            set.table = try set.allocator.alloc(?*Entry, set.table_size);
            for (set.table) | *e | *e = null;
        }

        fn free_entry(set: *Self, entry: *Entry) void {
            if (set.free_func) | f | {
                f(entry.data);
            }
            set.allocator.destroy(entry);
        }
    }
}

const c = @import("../c.zig");

fn eql(a: usize, b: usize)bool {
    return a == b
}

fn hsh(a: usize)usize {
    return a
}

test "Set" {
    var s1 = Set(usize).init(hsh, eql, &c.mem.allocator) catch unreachable;
    defer s1.deinit();

    s1.insert(1) catch unreachable;
    s1.insert(2) catch unreachable;
    s1.insert(3) catch unreachable;
    assert(s1.query(1) == true);
    assert(s1.query(2) == true);
    assert(s1.query(3) == true);

    var s2 = Set(usize).init(hsh, eql, &c.mem.allocator) catch unreachable;
    defer s2.deinit();

    s2.insert(3) catch unreachable;
    s2.insert(4) catch unreachable;
    s2.insert(5) catch unreachable;
    assert(s2.query(3) == true);
    assert(s2.query(4) == true);
    assert(s2.query(5) == true);

    var u = s1.make_union(&s2) catch unreachable;
    assert(u.query(1));
    assert(u.query(2));
    assert(u.query(3));
    assert(u.query(4));
    assert(u.query(5));

    var i = s1.make_intersection(&s2) catch unreachable;
    assert(i.query(3));
}

