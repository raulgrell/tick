const StringHashFunction = fn(str: []const u8 ) -> usize;

pub fn RSHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    const b  = usize(378551);
    var a    = usize(63689);
    var hash = usize(0);
    for (str) | c, i | {
        hash = hash * a + (c);
        a    = a * b;
    }
    return hash;
}

pub fn JSHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(1315423911);
    for (str) | c, i | {
        hash ^= ((hash << 5) + (c) + (hash >> 2));
    }
    return hash;
}

pub fn PJWHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    const BitsInUnsignedInt = usize(@sizeOf(usize) * 8);
    const ThreeQuarters     = usize(BitsInUnsignedInt * 3 / 4);
    const OneEighth         = usize(BitsInUnsignedInt / 8);
    const HighBits          = usize(0xFFFFFFFF) << (BitsInUnsignedInt - OneEighth);
    
    var hash = usize(0);
    var t = usize(0);

    for (str) | c, i | {
        hash = (hash << OneEighth) + (c);
        t = hash & HighBits;
        if (t != 0) {
            hash = (( hash ^ (t >> ThreeQuarters)) & (~HighBits));
        }
    }
    return hash;
}

pub fn ELFHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(0);
    var x    = usize(0);
    for (str) | c, i | {
        hash = (hash << 4) + (c);
        x = hash & 0xF0000000;
        if( hash != 0){
            hash ^= (x >> 24);
        }
        hash &= ~x;
    }
    return hash;
}

pub fn BKDRHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    const seed = usize(131); // 31 131 1313 13131 131313 etc..
    var hash = usize(0);
    for (str) | c, i | {
        hash = (hash * seed) + (c);
    }
    return hash;
}

pub fn SDBMHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(0);
    for (str) | c, i | {
        hash = (c) + (hash << 6) + (hash << 16) - hash;
    }
    return hash;
}

pub fn DJBHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(5381);
    for (str) | c, i | {
        hash = ((hash << 5) + hash) + (c);
    }
    return hash;
}

pub fn DEKHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(str.len);
    for (str) | c, i | {
        hash = ((hash << 5) ^ (hash >> 27)) ^ (c);
    }
    return hash;
}

pub fn BPHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(0);
    for (str) | c, i | {
        hash = hash << 7 ^ (c);
    }
    return hash;
}

pub fn FNVHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    const fnv_prime = usize(0x811C9DC5);
    var hash      = usize(0);
    for (str) | c, i | {
        hash *= fnv_prime;
        hash ^= (c);
    }
    return hash;
}

pub fn APHash(str: []const u8) -> usize {
    @setDebugSafety(this, false);
    var hash = usize(0xAAAAAAAA);
    for (str) | c, i | {
        hash ^= if ((i & 1) == 0) {
            (hash <<  7) ^ (c) * (hash >> 3)
        }  else {
            ~((hash << 11) + ((c) ^ (hash >> 5)))
        }
    }
    return hash;
}

const io = @import("std").io;

test "Hash" {
    %%io.stdout.printf("{}\n", RSHash("Test"));
    %%io.stdout.printf("{}\n", JSHash("Test"));
    %%io.stdout.printf("{}\n", PJWHash("Test"));
    %%io.stdout.printf("{}\n", ELFHash("Test"));
    %%io.stdout.printf("{}\n", BKDRHash("Test"));
    %%io.stdout.printf("{}\n", SDBMHash("Test"));
    %%io.stdout.printf("{}\n", DJBHash("Test"));
    %%io.stdout.printf("{}\n", DEKHash("Test"));
    %%io.stdout.printf("{}\n", BPHash("Test"));
    %%io.stdout.printf("{}\n", FNVHash("Test"));
    %%io.stdout.printf("{}\n", APHash("Test"));
}