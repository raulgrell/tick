const std = @import("std");
const debug = std.debug;

////CRC32, PNG/ZLIB specific?
//Taken from https://www.w3.org/TR/PNG-CRCAppendix.html
const crc32_table = comptime crc:
{
    @setEvalBranchQuota(8000);
    const poly = 0xedb88320;
    var table = []u32{0} ** (@maxValue(u8) + 1);
    for(table) |*e, i|
    {
        var crc = @intCast(u32, i);
        var bit = usize(0);
        while(bit < u8.bit_count):(bit += 1)
        {
            const shifted = (crc >> 1);
            crc = if(crc & 0x01 > 0) poly ^ shifted else shifted;
        }
        e.* = crc;
    }
    break :crc table;
};

pub const CRC32 = struct
{
    crc: u32,
    
    pub fn init() CRC32
    {
        return CRC32
        {
            .crc = @maxValue(u32),
        };
    }
    
    pub fn update(self: *CRC32, data: []const u8) void
    {
        for(data) |byte, i|
        {
            const idx = (@truncate(u8, self.crc) ^ byte) & 0xFF;
            self.crc = crc32_table[idx] ^ (self.crc >> u8.bit_count);
        }
    }
    
    pub fn digest(self: *CRC32) u32
    {
        return self.crc ^ @maxValue(u32);
    }
    
    pub fn calculate(data: []const u8) u32
    {
        var c = CRC32.init();
        c.update(data);
        return c.digest();
    }
};


/////

//const large_txt = @embedFile("shakespeare.txt");
//const large_crc = 0x842E54BF;

test "crc32"
{
    const crc0 = CRC32.calculate("123456789");
    debug.assert(crc0 == 0xCBF43926);
    
    const crc1 = CRC32.calculate("This is a test of CRC32 for PNG");
    debug.assert(crc1 == 0xBAE24562);
    
    //const crc2 = CRC32.calculate(large_txt);
    //debug.assert(crc2 == large_crc);
}

/////////////

////Adler32
//Taken from zlib reference http://www.zlib.org/rfc-zlib.html

pub const Adler32 = struct
{
    s1: u32,
    s2: u32,
        
    const BASE = 65521;
        
    pub fn init() Adler32
    {
        return Adler32
        {
            .s1 = 1,
            .s2 = 0,
        };
    }
    
    pub fn update(self: *Adler32, data: []const u8) void
    {
        for(data) |byte, i|
        {
            self.s1 = (self.s1 + byte) % BASE;
            self.s2 = (self.s2 + self.s1) % BASE;
        }
    }
    
    pub fn digest(self: *Adler32) u32
    {
        return (self.s2 << 16) | self.s1;
    }
    
    pub fn calculate(data: []const u8) u32
    {
        var a = Adler32.init();
        a.update(data);
        return a.digest();
    }
};

/////

//const large_txt = @embedFile("shakespeare.txt");
//const large_adler = 0xAD09764E;

test "adler32"
{
    const adler0 = Adler32.calculate("123456789");
    debug.assert(adler0 == 0x091E01DE);
    
    const adler1 = Adler32.calculate("This is a test of Adler32");
    debug.assert(adler1 == 0x6F0E0858);
    
    //const adler2 = Adler32.calculate(large_txt);
    //debug.assert(adler2 == large_adler);
}

/////////////