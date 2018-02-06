const assert = @import("std").debug.assert;
const mem = @import("std").mem;
const memory = @import("../memory.zig");
const Allocator = memory.Allocator;

error TooManyFunctions;
error DisjointFilter;

pub fn BloomFilter(comptime T: type)type {
    struct {
        allocator: &Allocator,
        hash_func: HashFunc,
        table: []u8,
        table_size: usize,
        num_functions: usize,

        const Self = this;
        const HashFunc = fn(data: T)usize;

        pub fn init(table_size: usize, hash_func: HashFunc, num_functions: usize, allocator: &Allocator) %Self {
            if (num_functions > salts.len) return error.TooManyFunctions;
            Self {
                .allocator = allocator,
                .hash_func = hash_func,
                .num_functions = num_functions,
                .table_size = table_size,
                .table = try allocator.alloc(u8, (table_size + 7) / 8),
            }
        }

        pub fn deinit(self: &Self) void {
            self.allocator.free(self.table);
        }

        pub fn insert(self: &Self, value: T) void {
            const hash = self.hash_func(value);

            { var i = usize(0); while(i < self.num_functions) : ( i += 1 ) {
                // Generate a unique hash
                const subhash = hash ^ salts[i];
                const index = subhash % self.table_size;
                // Insert into table.
                const byte_index = index / 8;
                const bit_index = index % 8;
                const b = (u8) (1 << (bit_index));
                self.table[byte_index] |= b;
            }}
        }

        pub fn query(self: &Self, value: T)bool {
            const hash = self.hash_func(value);
            // Multiple XORs with salts
            { var i = usize(0); while(i<self.num_functions) : ( i += 1 ) {
                // Generate a unique hash
                const subhash = hash ^ salts[i];
                const index = subhash % self.table_size;
                // Insert into table.
                const byte_index = index / 8;
                const bit_index = index % 8;
                const b = self.table[byte_index];
                const bit = 1 << (bit_index);
                // If bit not set, value not present.
                if ((b & bit) == 0) {
                    return false;
                }
            }}
            // All bits were set, value may be present
            return true;
        }

        pub fn read(self: &Self, array: []u8) void {
            const array_size = (self.table_size + 7) / 8;
            mem.copy(array, self.table, array_size);
        }

        pub fn load(self: &Self, array: []u8) void {
            const array_size = (self.table_size + 7) / 8;
            mem.copy(self.table, array, array_size);
        }

        pub fn make_union(filter1: &Self, filter2: &Self) %Self {
            // TODO: Check filter equivalence... Make this comptime?
            // if (filter1.table_size != filter2.table_size
            //         or filter1.num_functions != filter2.num_functions
            //         or filter1.hash_func != filter2.hash_func) {
            //     return error.DisjointFilter;
            // }

            // Create a new bloom filter for the result
            var result = try init(filter1.table_size, filter1.hash_func, filter1.num_functions, filter1.allocator);

            // Round up array size to the nearest byte.
            const array_size = (filter1.table_size + 7) / 8;
            // Populate the table of the new filter
            { var i = usize(0); while(i<array_size) : ( i += 1 ) {
                result.table[i] = filter1.table[i] | filter2.table[i];
            }}

            return result;
        }

        pub fn make_intersection(filter1: &Self, filter2: &Self) %Self {
            // TODO: Check filter equivalence at type level (comptime?)
            // if (filter1.table_size != filter2.table_size
            //         or filter1.num_functions != filter2.num_functions
            //         or filter1.hash_func != filter2.hash_func) {
            //     return error.DisjointFilter;
            // }

            // Create a new bloom filter for the result
            var result = try init(filter1.table_size, filter1.hash_func, filter1.num_functions, filter1.allocator);

            // Round up array size to the nearest byte.
            const array_size = (filter1.table_size + 7) / 8;

            // Populate the table of the new filter
            { var i = usize(0); while(i<array_size) : ( i += 1 ) {
                result.table[i] = filter1.table[i] & filter2.table[i];
            }}
            
            return result;
        }
    }
}

const salts = []usize {
    0x1953c322, 0x588ccf17, 0x64bf600c, 0xa6be3f3d,
    0x341a02ea, 0x15b03217, 0x3b062858, 0x5956fd06,
    0x18b5624f, 0xe3be0b46, 0x20ffcd5c, 0xa35dfd2b,
    0x1fc4a9bf, 0x57c45d5c, 0xa8661c4a, 0x4f1b74d2,
    0x5a6dde13, 0x3b18dac6, 0x05a8afbf, 0xbbda2fe2,
    0xa2520d78, 0xe7934849, 0xd541bc75, 0x09a55b57,
    0x9b345ae2, 0xfc2d26af, 0x38679cef, 0x81bd1e0d,
    0x654681ae, 0x4b3d87ad, 0xd5ff10fb, 0x23b32f67,
    0xafc7e366, 0xdd955ead, 0xe7c34b1c, 0xfeace0a6,
    0xeb16f09d, 0x3c57a72d, 0x2c8294c5, 0xba92662a,
    0xcd5b2d14, 0x743936c8, 0x2489beff, 0xc6c56e00,
    0x74a4f606, 0xb244a94a, 0x5edfc423, 0xf1901934,
    0x24af7691, 0xf6c98b25, 0xea25af46, 0x76d5f2e6,
    0x5e33cdf2, 0x445eb357, 0x88556bd2, 0x70d1da7a,
    0x54449368, 0x381020bc, 0x1c0520bf, 0xf7e44942,
    0xa27e2a58, 0x66866fc5, 0x12519ce7, 0x437a8456,
};

const c = @import("../c.zig");

fn hsh(a: usize)usize {
    return a;
}

test "BloomFilter" {
    var filter = %%BloomFilter(usize).init(32, hsh, 3, &c.mem.allocator);
    defer filter.deinit();

    filter.insert(usize(1));
    filter.insert(usize(2));
    filter.insert(usize(3));

    assert(filter.query(1));
    assert(filter.query(2));
    assert(!filter.query(5));

    var other = %%BloomFilter(usize).init(32, hsh, 3, &c.mem.allocator);
    defer other.deinit();

    other.insert(usize(3));
    other.insert(usize(4));
    other.insert(usize(5));

    var u = %%filter.make_union(&other);

    assert(u.query(1));
    assert(u.query(2));
    assert(u.query(3));
    assert(u.query(4));
    assert(u.query(5));

    var i = %%filter.make_intersection(&other);

    assert(i.query(3));

    u.insert(usize(1));
    i.insert(usize(5));
}
