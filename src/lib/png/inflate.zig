const std = @import("std");
const mem = std.mem;
const ArrayList = std.ArrayList;
const Adler32 = @import("checksum.zig").Adler32;
const debug = std.debug;

// consists of blocks:
//  block header
//  code table (opt)
//  compressed data

// block header:
//  is_final_block: u1
//  block_type: u2 {0 = uncompressed, 1 = fixed code table, 2 = dynamic code table, 
//      3 = invalid/reserved }

//Cannonical Huffman:
// Given list of symbols sorted by (length,symbol)
// first = 0 ** length
// while not new length: previous + 1
// previous + 1, then append 0s to fill new length

//Uncompressed / stored
// skips the rest of the byte the block header is in
// begins with 2 le u16s specifying len and ~len respectively.
// followed of course by all the uncompressed bytes

//Fixed code table:
// symbol   length
//  0-143   8
//  144-255 9
//  256-279 7
//  280-287 8
// all distance code lengths are 5

//Dynamic code table:
// uses canonical huffman table to encode code lengths
// of the symbols used in the actuall huffman table,
// also canonical.
//Dynamic header:
//  number of literal code lengths - 257: u5 (+257)
//  number of distance code lengths - 1: u5 (+1)
//  number of code length code lengths - 4: u4 (+4)
//
// code length array filled in strange order: //why!? NO IDEA.
//  16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15,
//  code len: u3
// literal lengths array:
//  decode from code length huffman table
//  0-15 => len
//  16 => read u2 (+3) copy last decoded value n times
//  17 => read u3 (+3) fill 0 n times //unused
//  18 => read u7 (+11) fill 0 n times //unused
// distance lengths are same procedure, worth special casing 0 & 1 for num distance codes
//Code table interpretation:
// symbols 0-255 => literal
// 256 => end of block
// 257-285 => back reference:
//                Extra               Extra               Extra
//            Code Bits Length(s) Code Bits Lengths   Code Bits Length(s)
//            ---- ---- ------     ---- ---- -------   ---- ---- -------
//             257   0     3       267   1   15,16     277   4   67-82
//             258   0     4       268   1   17,18     278   4   83-98
//             259   0     5       269   2   19-22     279   4   99-114
//             260   0     6       270   2   23-26     280   4  115-130
//             261   0     7       271   2   27-30     281   5  131-162
//             262   0     8       272   2   31-34     282   5  163-194
//             263   0     9       273   3   35-42     283   5  195-226
//             264   0    10       274   3   43-50     284   5  227-257
//             265   1  11,12      275   3   51-58     285   0    258
//             266   1  13,14      276   3   59-66
//
//         The extra bits should be interpreted as a machine integer
//         stored with the most-significant bit first, e.g., bits 1110
//         represent the value 14.
//
//                  Extra           Extra               Extra
//             Code Bits Dist  Code Bits   Dist     Code Bits Distance
//             ---- ---- ----  ---- ----  ------    ---- ---- --------
//               0   0    1     10   4     33-48    20    9   1025-1536
//               1   0    2     11   4     49-64    21    9   1537-2048
//               2   0    3     12   5     65-96    22   10   2049-3072
//               3   0    4     13   5     97-128   23   10   3073-4096
//               4   1   5,6    14   6    129-192   24   11   4097-6144
//               5   1   7,8    15   6    193-256   25   11   6145-8192
//               6   2   9-12   16   7    257-384   26   12  8193-12288
//               7   2  13-16   17   7    385-512   27   12 12289-16384
//               8   3  17-24   18   8    513-768   28   13 16385-24576
//               9   3  25-32   19   8   769-1024   29   13 24577-32768

const max_code_len = 15;    //Maximum bit length of huffman codes
const max_len_codes = 288;  //Maximum number of entries in 'length' huffman table
const max_dist_codes = 30;  //Maximum number of entries in 'dist' huffman table
//const max_codes = max_len_codes + max_dist_codes;

const length_bases = []const u16
{
    3, 4, 5, 6, 7, 8, 9, 10, 
    11, 13, 15, 17, 19, 23, 27, 31,
    35, 43, 51, 59, 67, 83, 99, 115,
    131, 163, 195, 227, 258,
};

const length_ext = []const u4
{
    0, 0, 0, 0, 0, 0, 0, 0, 
    1, 1, 1, 1, 2, 2, 2, 2,
    3, 3, 3, 3, 4, 4, 4, 4, 
    5, 5, 5, 5, 0,
};

const distance_bases = []const u16
{
    1, 2, 3, 4, 5, 7, 9, 13, 17, 
    25, 33, 49, 65, 97, 129, 193,
    257, 385, 513, 769, 1025, 1537,
    2049, 3073, 4097, 6145, 8193,
    12289, 16385, 24577,
};

const distance_ext = []const u4
{
    0, 0, 0, 0, 1, 1, 2, 2,
    3, 3, 4, 4, 5, 5, 6, 6,
    7, 7, 8, 8, 9, 9, 10, 10,
    11, 11, 12, 12, 13, 13
};

const SymbolLookupEntry = struct
{
    first_code: u16,
    last_code: u16,
    code_len: u8,
    offset: u16,
};

const SymbolLookupResult = struct
{
    symbol: u16,
    code_len: u8,
};

//@OPTIMIZE: Currently reverses code buffer for checks
// can be rewritten to not reqire reversal.
const DecodeTable = struct
{
    len_lookup: [max_code_len]SymbolLookupEntry,
    dist_lookup: [max_code_len]SymbolLookupEntry,
    len_symbols: [max_len_codes]u16,
    dist_symbols: [max_dist_codes]u16,

    fn _init(code_lengths: []const u8, lookup: []SymbolLookupEntry, symbols: []u16) !void
    {
        //Counts by length
        var counts = []u8{0} ** max_code_len;
        for(code_lengths) |len|
        {
            if(len == 0) continue; //symbol does not appear in code book
            counts[len - 1] += 1;
        }
        
        var current_code: u16 = 0;
        var next_code: u32 = 0;
        var current_offset: u16 = 0;

        //Create lookup entries by length
        for(counts) |count, i|
        {
            //TODO: check code_len has room for count
            if(count == 0) continue;
            const code_len = @intCast(u8, i + 1);
            const shifted_count = @intCast(u16, count - 1) 
                << @intCast(u4, u16.bit_count - code_len);
            if(next_code + shifted_count > @maxValue(u16)) return error.Oversubscribed;
            current_code = @intCast(u16, next_code);
            lookup[i] = SymbolLookupEntry
            {
                .first_code = current_code,
                .last_code = current_code + shifted_count,
                .code_len = code_len,
                .offset = current_offset,
            };
            next_code = u32(lookup[i].last_code) + (u16(0x8000) >> @intCast(u4, i));
            current_offset += count;
        }

        //Reset counts so we can reuse it for indexing
        for(counts) |*c| c.* = 0;
        
        //Sort symbols by length
        for(code_lengths) |len, i|
        {
            if(len == 0) continue;
            const len_idx = len - 1;
            const offset = lookup[len_idx].offset;
            const n = counts[len_idx];
           
            symbols[offset + n] = @intCast(u16, i);
            counts[len_idx] += 1;

        }
    }
    
    fn init(len_code_lengths: []const u8, dist_code_lengths: []const u8) !DecodeTable
    {
        var self: DecodeTable = undefined;
        try _init(len_code_lengths, self.len_lookup[0..], self.len_symbols[0..]);
        try _init(dist_code_lengths, self.dist_lookup[0..], self.dist_symbols[0..]);
        return self;
    }
    
    fn _lookup(code: u16, lookup: []const SymbolLookupEntry, symbols: []const u16) 
        !SymbolLookupResult
    {
        //@OPTIMIZE: Can be made faster for majority cases using n-bit lookup
        // table and falling back to this method
        var i = usize(0);
        while(i < lookup.len):(i += 1)
        {
            const entry = &lookup[i];
            if(entry.code_len == 0) continue;
            
            const mask = u16(@maxValue(u16)) << @intCast(u4, u16.bit_count - entry.code_len);
            const masked_code = code & mask;
            if(masked_code < entry.first_code) continue;
            break;
        }
        
        while(i < lookup.len):(i += 1)
        {
            const entry = &lookup[i];
            if(entry.code_len == 0) continue;
            
            const mask = u16(@maxValue(u16)) << @intCast(u4, u16.bit_count - entry.code_len);
            const masked_code = code & mask;
            if(masked_code > entry.last_code) continue;
            
            const n = (masked_code - entry.first_code)
                >> @intCast(u4, u16.bit_count - entry.code_len);
            return SymbolLookupResult
            {
                .symbol = symbols[entry.offset + n],
                .code_len = entry.code_len,
            };
        }
        return error.InvalidCode;
    }
    
    fn lookupLength(self: DecodeTable, code: u16) !SymbolLookupResult
    {
        return _lookup(code, self.len_lookup[0..], self.len_symbols[0..]);
    }
    
    fn lookupDistance(self: DecodeTable, code: u16) !SymbolLookupResult
    {
        return _lookup(code, self.dist_lookup[0..], self.dist_symbols[0..]);
    }
};

const fixed_decode_table = DecodeTable.init
(
    len_tab:
    {
        @setEvalBranchQuota(3000);
        var table: [288]u8 = undefined;
        for(table) |*e, i|
        {
            e.* = switch(i)
            {
                0...143 => 8,
                144...255 => 9,
                256...279 => 7,
                280...287 => 8,
                else => unreachable,
            };
        }
        break :len_tab table;
    },
    []u8{5} ** max_dist_codes,
) catch unreachable;


const BitReader = struct
{
    data: []const u8,
    pos: usize,
    bit_buffer: u32,
    bits: u6,
    
    fn init(src_data: []const u8) BitReader
    {
        return BitReader
        {
            .data = src_data,
            .pos = 0,
            .bit_buffer = 0,
            .bits = 0,
        };
    }
    
    fn bitReverse(bits: u8) u8
    {
        const nybles = []u8
        {
            0x00, 0x08, 0x04, 0x0C, 0x02, 
            0x0A, 0x06, 0x0E, 0x01, 0x09, 
            0x05, 0x0D, 0x03, 0x0B, 0x07,
            0x0F,
        };
        
        const upper = nybles[bits & 0x0F] << 4;
        const lower = nybles[(bits >> 4) & 0x0F];
        return upper | lower;
    }
    
    fn bitReverse16(bits: u16) u16
    {
        const new_bits_upper = BitReader.bitReverse(@truncate(u8, bits & 0x00FF));
        const new_bits_lower = BitReader.bitReverse(@truncate(u8, (bits & 0xFF00) >> 8));
        const new_bits = (u16(new_bits_upper) << 8) | u16(new_bits_lower);
        return new_bits;
    }

    fn fillBuffer(self: *BitReader) void
    {
        while(self.bits < u16.bit_count)
        {
            if(self.pos >= self.data.len) return;
            
            const empty_bits = u32.bit_count - self.bits;
            const byte = self.data[self.pos];
            self.bit_buffer |= u32(byte) << @intCast(u5, self.bits);
            self.bits += u8.bit_count;
            self.pos += 1;
        }
    }
    
    fn readBits(self: *BitReader, bits: u5) !u16
    {
        debug.assert(bits <= u16.bit_count);
        self.fillBuffer();
        if(self.bits < bits) return error.PrematureEOF;
        
        const mask = u32(@maxValue(u16)) >> @intCast(u5, u16.bit_count - u6(bits));
        const value = self.bit_buffer & mask;
        
        self.bit_buffer >>= bits;
        self.bits -= bits;
        
        return @truncate(u16, value);
    }

    fn alignByteBoundary(self: *BitReader) void
    {
        //Because of the way bit_buffer is filled, this
        // should let us quickly find the start of the
        // next byte in the stream
        const to_boundary = @intCast(u6, self.bits % u8.bit_count);
        
        //discard until boundary
        self.bits -= to_boundary;
        
        //instead of using the bit_buffer, rewind pos to the boundary
        debug.assert(self.bits % u8.bit_count == 0);
        const rewind = self.bits / u8.bit_count;
        self.pos -= rewind;
        self.bit_buffer = 0;
        self.bits = 0;
    }
    
    fn readByte(self: *BitReader) !u8
    {
        self.alignByteBoundary();
        if(self.pos > self.data.len) return error.PrematureEOF;
        const byte = self.data[self.pos];
        self.pos += 1;
        return byte;
    }
    
    fn readBytes(self: *BitReader, bytes: usize) ![]const u8
    {
        self.alignByteBoundary();
        if(self.pos + bytes > self.data.len) return error.PrematureEOF;
        const start = self.pos;
        self.pos += bytes;
        return self.data[start..self.pos];
    }
    
    fn lookupLength(self: *BitReader, table: *const DecodeTable) !u16
    {
        self.fillBuffer();
        const code = @truncate(u16, self.bit_buffer);
        const rev_code = bitReverse16(code);
        const sym = try table.lookupLength(rev_code);
        
        self.bit_buffer >>= @intCast(u5, sym.code_len);
        self.bits -= @intCast(u6, sym.code_len);
        return sym.symbol;
    }
    
    fn lookupDistance(self: *BitReader, table: *const DecodeTable) !u16
    {
        self.fillBuffer();
        const code = @truncate(u16, self.bit_buffer);
        const rev_code = bitReverse16(code);
        const sym = try table.lookupDistance(rev_code);
        
        self.bit_buffer >>= @intCast(u5, sym.code_len);
        self.bits -= @intCast(u6, sym.code_len);
        return sym.symbol;
    }
    
};


//@TODO: This won't work as if the passed in buffer is > the size of the
// zlib data
pub const ZlibInflateResult = struct
{
    dictid: ?[4]u8,
    compression_level: u8,
    data: []u8,
};
pub fn zlibInflate(alloc: *mem.Allocator, src_data: []const u8) !ZlibInflateResult
{
    var result: ZlibInflateResult = undefined;
    
    if(src_data.len <= 6) return error.TruncatedData;
    const cmf = src_data[0];
    const flg = src_data[1];
    
    switch(cmf & 0x0F)
    {
        0x08 => {}, //deflate
        0x0F => return error.ReservedCompressionMethod,
        else => return error.UnsupportedCompressionMethod,
    }
    //debug.warn("{X2}\n",cmf);
    if(cmf & 0xF0 > 0x70) return error.InvalidWindowSize;
    
    const fcheck = (u16(cmf) << 8) | u16(flg);
    if(fcheck % 31 != 0) return error.CorreuptedZlibHeader;
    
    result.compression_level = (flg & 0b11000000) >> 6;
    
    var src_pos = usize(2);
    if(flg & 0b00100000 > 0)
    {
        if(src_data.len <= 10) return error.TruncatedData;
        var dictid = []u8{0} ** 4;
        comptime var i = usize(0);
        inline while(i < 4):(i += 1)
        {
            dictid[i] = src_data[src_pos];
            src_pos += 1;
        }
        result.dictid = dictid;
    }
    else 
    {
        result.dictid = null;
    }
    
    result.data = try inflate(alloc, src_data[src_pos.. src_data.len - @sizeOf(u32)]);
    
    const adler = Adler32.calculate(result.data);
    var chk_adler = u32(0);
    src_pos = src_data.len - @sizeOf(u32);
    
    comptime var i = usize(0);
    inline while(i < 4):(i += 1)
    {
        chk_adler |= u32(src_data[src_pos]) << @intCast(u5, (4 - 1) - i) * u8.bit_count;
        src_pos += 1;
    }
    if(chk_adler != adler) return error.InvalidChecksum;
    return result;
}

pub fn inflate(alloc: *mem.Allocator, src_data: []const u8) ![]u8
{
    var reader = BitReader.init(src_data);
    var code_table: DecodeTable = undefined;
    
    var output = ArrayList(u8).init(alloc);
    try output.ensureCapacity(src_data.len * 2); //start w/ assumption: 50% compression ratio.
    errdefer output.deinit();
    
    //blocks
    var last_block = false;
    while(!last_block)
    {
        last_block = (try reader.readBits(1)) == 1;
        const block_type = try reader.readBits(2);
        
        switch(block_type)
        {
            //uncompressed
            0 =>
            {
                const len_data = try reader.readBytes(4);
                const len = (u16(len_data[1]) << u8.bit_count) + len_data[0];

                const comp = (u16(len_data[3]) << u8.bit_count) + len_data[2];
                if(~len != comp) return error.InvalidStoredBlockLength;
                
                const data = try reader.readBytes(len);
                try output.appendSlice(data);
            },
            
            //fixed
            1 =>
            {
                //use fixed table
                try decode(&reader, &fixed_decode_table, &output);
            },
           
            //dynamic
            2 =>
            {
                const num_len_lengths = (try reader.readBits(5)) + 257;
                const num_dist_lengths = (try reader.readBits(5)) + 1;
                
                const num_s1_lengths = (try reader.readBits(4)) + 4;
                //build huffman table stage 1
                const s1_map = []u8
                {
                    16, 17, 18, 0,
                    8, 7, 9, 6, 10,
                    5, 11, 4, 12, 3, 
                    13, 2, 14, 1, 15
                };
                var s1_lengths = []u8{0} ** 19;
                
                for(s1_map[0..num_s1_lengths]) |m|
                {
                    s1_lengths[m] = @intCast(u8, try reader.readBits(3));
                }
                
                var s1_code_table = try DecodeTable.init(s1_lengths[0..], s1_lengths[0..0]);

                //decode stage 2 with stage 1

                var len_lengths_buff = []u8{0} ** max_len_codes;
                var dist_lengths_buff = []u8{0} ** max_dist_codes;
 
                var len_lengths = len_lengths_buff[0..num_len_lengths];
                var dist_lengths = dist_lengths_buff[0..num_dist_lengths];

                try stage1Decode(&reader, &s1_code_table, len_lengths);
                try stage1Decode(&reader, &s1_code_table, dist_lengths);
                
                //decode data with stage 2
                var s2_code_table = try DecodeTable.init(len_lengths, dist_lengths);
                try decode(&reader, &s2_code_table, &output);
            },
            
            //reserved
            3 => return error.ReservedBlockTypeEncountered,
            else => unreachable,
        }
    }
    
    return output.toOwnedSlice();
}

fn stage1Decode(reader: *BitReader, table: *const DecodeTable, lengths: []u8) !void
{
    var last_decoded = u8(0);
    var repeat = u16(0);
    for(lengths) |*len|
    {
        if(repeat > 0)
        {
            len.* = last_decoded;
            repeat -= 1;
            continue;
        }

        const s1_sym = try reader.lookupLength(table);

        last_decoded = switch(s1_sym)
        {
            0...15 => @intCast(u8, s1_sym),
            16 => val:
            {
                const base = try reader.readBits(2);
                repeat = base + 2; //3 - 1, because we're setting one now
                break :val last_decoded;
            },
            17 => val:
            {
                const base = try reader.readBits(3);
                repeat = base + 2; //3 - 1, because we're setting one now
                break :val 0;
            },
            18 => val:
            {
                const base = try reader.readBits(7);
                repeat = base + 10; //11 - 1, because we're setting one now
                break :val 0;
            },
            else => unreachable, //error?
        };
        len.* = last_decoded;
    }
}

fn decode(reader: *BitReader, table: *const DecodeTable, output: *ArrayList(u8)) !void
{
    while(true)
    {
        const len_sym = try reader.lookupLength(table);
        switch(len_sym)
        {
            0...255 => 
            {
                try output.append(@intCast(u8, len_sym));
            },
            256 => break,
            257...285 =>
            {
                const base_len = length_bases[len_sym - 257];
                const extra_len_bits = length_ext[len_sym - 257];
                const calc_len = base_len + (try reader.readBits(extra_len_bits));
                
                //lookup distance
                const dist_sym = try reader.lookupDistance(table);
                const base_dist = distance_bases[dist_sym];
                const extra_dist_bits = distance_ext[dist_sym];
                const calc_dist = base_dist + (try reader.readBits(extra_dist_bits));
                
                if(output.len < calc_dist) return error.InvalidDistance;
                const start = usize(output.len - calc_dist);
                const end = usize(start + calc_len);
               
                //this makes sure any necessary growth happens before
                //we start copying
                try output.ensureCapacity(output.len + calc_len);
                
                //@OPTIMIZE: might be worth special casing this as a memcpy
                // if start + len < end. Or multiple memcpys otherwise.
                var in_pos = start;
                while(in_pos < end):(in_pos += 1) try output.append(output.at(in_pos));
            },
            else => unreachable, //error?
        }
    }
}

test "single uncompressed" {
    var expected: [256]u8 = undefined;
    for(expected) |*b, i| b.* = @truncate(u8, i);

    const data = "\x01\x00\x01\xff\xfe\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d" ++
        "\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\x20" ++
        "\x21\x22\x23\x24\x25\x26\x27\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f\x30\x31\x32\x33" ++
        "\x34\x35\x36\x37\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f\x40\x41\x42\x43\x44\x45\x46" ++
        "\x47\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f\x50\x51\x52\x53\x54\x55\x56\x57\x58\x59" ++
        "\x5a\x5b\x5c\x5d\x5e\x5f\x60\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c" ++
        "\x6d\x6e\x6f\x70\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7a\x7b\x7c\x7d\x7e\x7f" ++
        "\x80\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90\x91\x92" ++
        "\x93\x94\x95\x96\x97\x98\x99\x9a\x9b\x9c\x9d\x9e\x9f\xa0\xa1\xa2\xa3\xa4\xa5" ++
        "\xa6\xa7\xa8\xa9\xaa\xab\xac\xad\xae\xaf\xb0\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8" ++
        "\xb9\xba\xbb\xbc\xbd\xbe\xbf\xc0\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb" ++
        "\xcc\xcd\xce\xcf\xd0\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde" ++
        "\xdf\xe0\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef\xf0\xf1" ++
        "\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff";

    try testInflate(data, expected);
}

test "single fixed"
{
    const data = "\xeb\x3a\xd6\xf5\x44\xc2\xab\xe5\xeb\x8c\xa4\xdf\x26\x00";
    const expected = "\x8a\xc6\x8a\xe4\x18\x4a\x84\xf5\x98\x62\xfb\x34";
    
    try testInflate(data, expected);
}

test "single fixed 2"
{
    const data = "\x0b\xc9\xc8\x2c\x56\x00\xa2\x44\x85\x92\xd4\xe2\x12\x85\xfc\x34\x85" ++
        "\x92\x8c\x54\x85\x94\xd4\xb4\x9c\xc4\x92\x54\xfd\xcc\x3c\x30\xad\x90\x98\x93\x9e\x5f\x94"
        ++ "\x59\x92\x91\x0b\x00";
    const expected = "This is a test of the deflate/inflate algorithm";
    
    try testInflate(data, expected);
}

test "single fixed 3"
{
    const data = "\x0b\xc9\xc8\x2c\x56\x00\xa2\x44\x85\x92\xd4\xe2\x12\x85\xfc\x34\x85\x92" ++
    "\x8c\x54\x85\x94\xd4\xb4\x9c\xc4\x92\x54\xfd\xcc\x3c\x30\xad\x90\x98\x93\x9e\x5f" ++
    "\x94\x59\x92\x91\xab\xa7\x10\x02\xd5\x50\x9c\x9f\x9b\xaa\x90\x99\x57\x92\x5a\x94" ++
    "\x9b\x9a\x92\x09\x52\x54\x92\x5a\x51\x82\x90\x27\xd6\x40\x00";
    const expected = "This is a test of the deflate/inflate algorithm. This is some " ++ 
    "intermediate text. This is a test of the deflate/inflate algorithm.";
    
    try testInflate(data, expected);
}

test "single dynamic 1"
{
    const data = "\x55\x54\x5b\x8e\xdb\x30\x0c\xbc\x0a\x0f\x60\xf8\x0e\x8b\xb6\x1f\x05\xda\xa2\x45\x81\xfe\x33\x32\x93\x65\xa1\x87\x57\x12\x73\xfe\x0e\x25\x3b\x49\x3f\x16\x9b\x38\xe4\x70\x38\x33\xf4\xb7\x52\x25\x91\xee\xcd\x12\x6d\x25\x96\x4a\x4d\x3b\x71\x92\xbe\x50\x28\xb9\x49\xe8\xd2\x4d\x2a\xf1\xa6\xbb\xb6\xa0\xf9\x46\x12\xb5\xaf\xf4\x26\x59\x38\xa3\x28\xa5\xb2\x15\x8a\x7a\xb3\xc8\x24\x37\xe9\x13\xe8\x51\x91\xb8\x35\x5e\xe9\x13\x26\xb4\x12\x54\x1b\x65\xee\xe5\xc3\x84\x76\xc1\x27\xbd\x58\x23\x34\x25\xbe\x65\xfc\xb6\xe1\x6f\xe7\xda\xad\xaa\x64\x3c\x2d\xb9\x4b\x5b\xd0\xd2\x02\x88\x54\xaa\xba\x69\xb0\x88\x9e\x64\x6d\xa5\xcf\x25\x4b\xa0\x0f\xe3\x44\x57\xf0\x42\xa5\xc5\x5e\x35\xa8\x60\x8c\x84\x05\x33\x62\x14\xc7\xf0\x81\x62\x78\x50\xa5\x2b\xb8\x7c\x98\x57\x37\x49\x2b\xfd\xb0\x08\xea\x63\x5d\x20\xf5\xc9\x78\x14\x90\x64\x4d\xe7\x94\x5d\x36\xa1\xbf\xd6\x7a\x59\xe8\x5a\xa1\x84\x7a\xdb\x5d\xe2\x42\x1c\x15\xf8\x7d\x8e\xbc\x5b\xdc\xad\x73\x97\xa1\x06\x7e\xac\xc1\x56\xfa\x9a\x07\xd8\x09\x50\xdf\x4b\x0e\xd8\xc2\x50\xa0\x69\x97\xba\x29\xfa\x19\xdd\x50\xcd\x65\x69\x74\xd7\xce\xb2\xcc\x86\x83\x24\x4c\xd2\xd0\xed\x58\x16\xfb\x4c\x52\xa9\x44\xff\x7a\xac\xe6\xb3\x3a\x46\x57\xea\x9a\x83\x6e\x96\x61\xd7\xa7\xca\x10\x97\x77\x97\x7b\xa5\x3f\x7a\xe7\xe4\xba\x47\x49\x50\xc7\xad\x11\x27\x41\xb0\x40\x1f\xce\xbd\x2c\x12\x45\xaf\x92\x37\xea\x90\xd3\x01\x8e\x8a\x28\xa7\xf3\x10\xb6\xd4\xde\xb5\x23\x42\x2e\xf3\x53\xcd\x63\x8d\x07\x04\x43\xa2\x29\xeb\x9b\xab\x86\x9d\xe2\x08\x21\x83\xf4\x72\x52\x24\xcd\x90\x42\xef\x52\x2b\x1f\x56\x5d\xc5\x6e\xca\x43\xa3\x93\xc5\xcf\x77\x6e\xe3\xe3\xa3\x34\x0f\x2b\x0d\x1e\x22\x2d\x78\xcc\x55\xf1\x2f\x32\x26\x08\x54\xf8\x05\x24\x0f\x42\xb5\x5e\x5d\xa8\x63\x8d\x87\x01\x2b\x7d\xe9\x0a\x46\x2f\x21\x82\x20\xee\x31\xb1\xdd\x4c\x3c\xc6\x95\x2f\xea\x49\x1c\x7e\x84\x52\x5d\xb6\xff\xeb\x61\x16\x30\xe6\x29\x98\x9e\x98\x87\xe3\x2b\x7d\x67\x09\xb0\xb8\x61\x8d\xb4\x5b\x3b\xd7\x99\x0d\xd0\x6d\xd3\xc3\x93\xa3\x63\xa4\x74\x66\xfc\x70\x29\xea\x45\x2a\x42\x74\xde\xea\xeb\x75\x7a\x6d\x16\x5f\xb2\xc9\x36\x2f\x7b\xf2\x19\x00\xd9\x32\xe4\xbf\x44\xc6\x94\x3e\xb3\x1b\x2d\xb8\x54\xbb\xc5\xbb\x66\xae\x0b\xbd\xc3\xa5\x2a\x15\xbf\xeb\xb6\x4c\x73\x5e\x48\xfb\x25\x94\x4d\x8b\xdf\xac\x5b\xf6\x0c\xd9\xb1\xcf\x79\x2e\xc3\x77\x6a\xf0\x53\xb2\x3b\x32\x49\xbf\xe4\xfb\xca\x16\x66\x1c\x8f\x6c\x8f\x8b\x73\xcc\x53\xb2\xc7\x7e\xa5\x06\x9d\xfa\x00\xe2\xd9\xf9\x1a\xf0\xcf\xde\x8c\x3c\xae\xf4\x1b\x7b\x3f\xef\x33\x31\x5e\x25\xed\x09\x95\xf5\xf2\x7e\x52\x6c\x65\xe3\x08\xd3\x1a\xdf\xb4\x3b\x25\x7f\x09\xf1\x44\x78\x04\x78\x19\x29\x1f\xc3\x2f\x58\x21\x6f\xe3\x45\x36\x1a\x97\x99\x0a\xd7\x11\xf0\xc1\x6a\x03\xa7\x21\xf1\x3f";
    
    const expected = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,";
    
    try testInflate(data, expected);
}


fn testInflate(data: []const u8, expected: []const u8) !void
{
    var dalloc = std.heap.DirectAllocator.init();
    var alloc = &dalloc.allocator;
    
    const result = try inflate(alloc, data[0..]);
    defer alloc.free(result);
    //debug.warn("\n{}\n", result);
    debug.assert(mem.eql(u8, result, expected));
}