const std = @import("std");
const builtin = @import("builtin");
const mem = std.mem;
const debug = std.debug;

const utils = @import("utils");
const inflate = @import("inflate.zig");
const CRC32 = @import("checksum.zig").CRC32;

const png_signature = "\x89PNG\r\n\x1A\n";

//This table summarizes some properties of the standard chunk types.
//
//   Critical chunks (must appear in this order, except PLTE is optional):
//           Name  Multiple  Ordering constraints
//                   OK?
//   
//           IHDR    No      Must be first
//           PLTE    No      Before IDAT
//           IDAT    Yes     Multiple IDATs must be consecutive
//           IEND    No      Must be last
//   
//   Ancillary chunks (need not appear in this order):
//   
//           Name  Multiple  Ordering constraints
//                   OK?
//   
//           cHRM    No      Before PLTE and IDAT
//           gAMA    No      Before PLTE and IDAT
//           iCCP    No      Before PLTE and IDAT
//           sBIT    No      Before PLTE and IDAT
//           sRGB    No      Before PLTE and IDAT
//           bKGD    No      After PLTE; before IDAT
//           hIST    No      After PLTE; before IDAT
//           tRNS    No      After PLTE; before IDAT
//           pHYs    No      Before IDAT
//           sPLT    Yes     Before IDAT
//           tIME    No      None
//           iTXt    Yes     None
//           tEXt    Yes     None
//           zTXt    Yes     None

const Chunk = struct {
    chunk_type: [4]u8,
    data: []const u8,
    crc: u32,
    
    fn read(reader: *utils.mem.BufferReader) !Chunk {
        var chunk: Chunk = undefined;
        const length = try reader.read(u32);
        chunk.chunk_type = try reader.read([4]u8);
        
        chunk.data = reader.getBytes(length) catch return error.InvalidChunkLength;
        
        chunk.crc = try reader.read(u32);
        
        var crc32 = CRC32.init();
        crc32.update(chunk.chunk_type);
        crc32.update(chunk.data);
        if(crc32.digest() != chunk.crc) return error.CorruptedChunk;
        
        return chunk;
    }
    
    fn checkType(self: *Chunk, chunk_type: [4]u8) bool {
        return mem.eql(u8, chunk_type, self.chunk_type);
    }
    
    fn typeAsInt(self: *Chunk) u32 {
        return typeToInt(self.chunk_type);
    }
    
    fn typeToInt(chunk_type: [4]u8) u32 {
        var value: u32 = 0;
        comptime var byte = u5(0);
        inline while(byte < @sizeOf(u32)):(byte += 1) {
            const shift = ((@sizeOf(u32) - 1 - byte) * u8.bit_count);
            value |= u32(chunk_type[byte]) << shift;
        }
        return value;
    }
};

//   Color    Allowed    Interpretation
//   Type    Bit Depths
//   
//   0       1,2,4,8,16  Each pixel is a grayscale sample.
//   2       8,16        Each pixel is an R,G,B triple.
//   3       1,2,4,8     Each pixel is a palette index; a PLTE chunk must appear.
//   4       8,16        Each pixel is a grayscale sample, followed by an alpha sample.
//   6       8,16        Each pixel is an R,G,B triple, followed by an alpha sample.

const ColorType = enum(u8) {
    Luma        = 0,
    RGB         = 2,
    Palette     = 3,
    LumaAlpha   = 4,
    RGBA        = 6,
    
    fn numChannels(self: ColorType) u3 {
        return switch(self) {
            ColorType.Luma => u3(1),
            ColorType.RGB => u3(3),
            ColorType.Palette => u3(1),
            ColorType.LumaAlpha => u3(2),
            ColorType.RGBA => u3(4),
        };
    }
    
    fn isValidBitDepth(self: ColorType, bit_depth: u8) !void {
        switch(self) {
            ColorType.Luma => {
                switch(bit_depth) {
                    1, 2, 4, 8, 16 => return,
                    else => return error.InvalidBitDepth,
                }
            },
            ColorType.RGB,
            ColorType.LumaAlpha,
            ColorType.RGBA => {
                switch(bit_depth) {
                    8, 16 => return,
                    else => return error.InvalidBitDepth,
                }
            },
            ColorType.Palette => {
                switch(bit_depth) {
                    1, 2, 4, 8 => return,
                    else => return error.InvalidBitDepth,
                }
            },
            else => return error.InvalidColorType,
        }
    }
    
    fn hasAlpha(self: ColorType) bool {
        return switch(self) {
            ColorType.LumaAlpha, ColorType.RGBA => true,
            else => false,
        };
    }
};

//INTERLACING
// https://en.wikipedia.org/wiki/Adam7_algorithm

const InterlaceDescriptor = struct {
    start_line: u32,
    start_pixel: u32,
    stride_line: u4,
    stride_pixel: u4,
    
    const Adam7 = []const InterlaceDescriptor {
        InterlaceDescriptor{.start_line = 0, .start_pixel = 0, .stride_line = 8, .stride_pixel = 8,},
        InterlaceDescriptor{.start_line = 0, .start_pixel = 4, .stride_line = 8, .stride_pixel = 8,},
        InterlaceDescriptor{.start_line = 4, .start_pixel = 0, .stride_line = 8, .stride_pixel = 4,},
        InterlaceDescriptor{.start_line = 0, .start_pixel = 2, .stride_line = 4, .stride_pixel = 4,},
        InterlaceDescriptor{.start_line = 2, .start_pixel = 0, .stride_line = 4, .stride_pixel = 2,},
        InterlaceDescriptor{.start_line = 0, .start_pixel = 1, .stride_line = 2, .stride_pixel = 2,},
        InterlaceDescriptor{.start_line = 1, .start_pixel = 0, .stride_line = 2, .stride_pixel = 1,},
    };

    const None = []const InterlaceDescriptor {
        InterlaceDescriptor{.start_line = 0, .start_pixel = 0, .stride_line = 1, .stride_pixel = 1,},
    };
    
    fn getInterlace(format_info: *FormatInfo) ![]const InterlaceDescriptor {
        return switch(format_info.ihdr.interlace_method) {
            0 => None[0..],
            1 => Adam7[0..],
            else => error.UnsupportedInterlaceMethod,
        };
    }
};

// When the image is interlaced, each pass of the interlace pattern is treated as an independent image for filtering purposes.
// The filters work on the byte sequences formed by the pixels actually transmitted during a pass, and the "previous scanline"
// is the one previously transmitted in the same pass, not the one adjacent in the complete image. Note that the subimage
// transmitted in any one pass is always rectangular, but is of smaller width and/or height than the complete image.
// Filtering is not applied when this subimage is empty.

// applied scanline by scanline, applied to bytes of previous pixel
// "previous" scanline defined as previous transmitted in interlace cases
const FilterType = enum(u8) {
    None    = 0,
    Sub     = 1,
    Up      = 2,
    Average = 3,
    Paeth   = 4,
    
    fn from(filter: u8) !FilterType {
        const info = @typeInfo(FilterType);
        for(info.Enum.fields) |field| {
            if(filter == field.value) return @intToEnum(FilterType, filter);
        }
        return error.InvalidFilterType;
    }
    
    //Needs to be passed the result of the unfilter on the previous scanline, or nothing
    //scanline 1 is output, 0 is unfiltered previous
    fn unfilter(self: FilterType, reader: *utils.mem.BufferReader, format_info: *FormatInfo,  
        scanlines: [2][]u8) !void {
        const bytes_pc = if(format_info.ihdr.bit_depth <= u8.bit_count) u8(1) else u8(2);
        const left_offset = bytes_pc * format_info.ihdr.color_type.numChannels();

        switch(self) {
            FilterType.None => {
                for(scanlines[1]) |*b| b.* = try reader.read(u8);
            },
            FilterType.Sub => {
                //filtering was sub, so we add
                for(scanlines[1]) |*b, i| {
                    const value = try reader.read(u8);
                    const left = if(i < left_offset) u8(0) else scanlines[1][i - left_offset];
                    b.* = value +% left;
                }
            },
            FilterType.Up => {
                //up uses minus, so we add
                for(scanlines[1]) |*b, i| {
                    const value = try reader.read(u8);
                    b.* = value +% scanlines[0][i];
                }
            },
            FilterType.Average => {
                for(scanlines[1]) |*b, i| {
                    const value = try reader.read(u8);
                    const up = scanlines[0][i];
                    const left = if(i < left_offset) u8(0) else scanlines[1][i - left_offset];
                    const average = (u16(left) + u16(up)) / 2;
                    b.* = value +% @intCast(u8, average);
                }
            },
            FilterType.Paeth => {
                //@OPTIMIZE: There is probably a more optimal implementation
                for(scanlines[1]) |*b, i| {
                    const value = try reader.read(u8);

                    const up = isize(scanlines[0][i]);
                    const left = isize(if(i < left_offset) u8(0) else scanlines[1][i - left_offset]);
                    const up_left = isize(if(i < left_offset) u8(0) else scanlines[0][i - left_offset]);

                    const p = left + up - up_left;
                    const p_left = if(p - left < 0) -(p - left) else p - left;
                    const p_up = if(p - up < 0) -(p - up) else p - up;
                    const p_up_left = if(p - up_left < 0) -(p - up_left) else p - up_left;
                    
                    const predictor = pp: {
                        if(p_left <= p_up and p_left <= p_up_left) break :pp left;
                        if(p_up <= p_up_left) break :pp up;
                        break :pp up_left;
                    };
                    
                    b.* = @intCast(u8, @mod(@intCast(isize, value) + predictor, 256));
                }
            },
        }
    }
};

//sRGB
const SRGB = enum(u8) {
    Perceptual = 0,
    Relative = 1,
    Saturation = 2,
    Absolute = 3,
};

const IHDR = packed struct {
    width:              u32,
    height:             u32, //only unsigned values allowed (top bit == 0)
    bit_depth:          u8,  //1, 2, 4, 8, and 16 per sample/palette entry
    color_type:         ColorType,  //1 (palette used), 2 (color used), and 4 (alpha channel used). Valid values are 0, 2, 3, 4, and 6.
    compression_method: u8,  //must be 0 = deflate/inflate 
    filter_method:      u8,  // 0 (adaptive filtering with five basic filter types) 
    interlace_method:   u8,  //0 (no interlace) or 1 (Adam7 interlace)

    const max_width = @maxValue(i32);
    const max_height = @maxValue(i32);
    
    fn verify(self: *IHDR) !void {
        if(self.width > max_width or self.width == 0) return error.InvalidWidth;
        if(self.height > max_height or self.height == 0) return error.InvalidHeight;
        switch(self.bit_depth) {
            1, 2, 4, 8, 16 => {},
            else => return error.InvalidBitDepth,
        }
        try self.color_type.isValidBitDepth(self.bit_depth);
        if(self.compression_method != 0) return error.UnsupportedCompressionMethod;
        if(self.filter_method != 0) return error.UnsupportedFilterMethod;
        if(self.interlace_method > 1) return error.UnsupportedInterlaceMethod;
    }
};

//cHRM, CIEXY chromacities * 100000
// must preceed IDAT and PLTE (if present)
const CHRM = packed struct {
    white:  Point,
    red:    Point,
    green:  Point,
    blue:   Point,
    
    const Point = packed struct {
        x: u32,
        y: u32,
    };
};

//@NOTE: not directly readable!!
const ICCProfile = struct {
    name: []const u8, //0-79 bytes + null terminated
    compression: u8,  //only 0 is valid == zlib w/ deflate
    data: []const u8, //from chunk size
};

//tRNS
const TRNS = union(ColorType) {
    Luma:       u16,        //0 - 2^bit_depth - 1
    RGB:        RGB48,      //each is 0 - 2^bit_depth - 1
    Palette:    void,       //data placed directly into palette
    LumaAlpha:  void,
    RGBA:       void,
}; 

const RGB24 = packed struct {
    r: u8,
    g: u8,
    b: u8,
};

pub const RGBA32 = packed struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};

//Big Endian
const RGB48 = packed struct {
    r: u16,
    g: u16,
    b: u16,
};

//Big Endian
const RGBA48 = packed struct {
    r: u16,
    g: u16,
    b: u16,
    a: u16,
};

//IDAT //compressed image data stream
//There can be multiple IDAT chunks; if so, they must appear consecutively with no other intervening chunks. The compressed datastream is then the concatenation of the contents of all the IDAT chunks. The encoder can divide the compressed datastream into IDAT chunks however it wishes. (Multiple IDAT chunks are allowed so that encoders can work in a fixed amount of memory; typically the chunk size will correspond to the encoder's buffer size.) It is important to emphasize that IDAT chunk boundaries have no semantic significance and can occur at any point in the compressed datastream. A PNG file in which each IDAT chunk contains only one data byte is valid, though remarkably wasteful of space. (For that matter, zero-length IDAT chunks are valid, though even more wasteful.)
//I don't believe this is entirely accurate, as there is no way to represent any bit padding at the end of the chunk
// therefore it can only end in the middle of compressed data if the data ends on a byte boundary, so likely it can
// only end on a block boundary

pub const Image = struct {
    width: usize,
    height: usize,
    has_alpha: bool,
    pixels: []RGBA32,
};

const FormatInfo = struct {
    ihdr: IHDR,
    plte: []RGBA32,
    idat: []const u8,
    
    //tRNS
    trns: ?TRNS,
    
    //before PLTE and IDAT
    // gAMA, cHRM, sRGB, iCCP, sBIT
    //after PLTE, before IDAT
    // bKGD, hIST, tRNS
    //before IDAT
    // pHYs, sPLT
    //any
    // tEXt, zTXt, iTXt, tIME
    
    
    image: *Image,
    
    //fn paletteToRGBA32(self: *FormatInfo, index: u8) !RGBA32
    //{
    //    if(self.plte.len < index) return error.InvalidPaletteIndex;
    //    const entry = self.plte[index];
    //    
    //    //Not sure I actually want this for performance reasons...
    //    const alpha = a:
    / {
    //        if(self.trns) |trns|
    / {
    //            if(trns.Palette.len <= index) break :a @maxValue(u8);
    //            break :a trns.Palette[index];
    //        }
    //        break :a 0;
    //    };
    //    
    //    return RGBA32
    / {
    //        .r = entry.r,
    //        .g = entry.g,
    //        .b = entry.b,
    //        .a = alpha,
    //    };
    //}
};


pub fn fromFile(allocator: *mem.Allocator, path: []const u8) !Image {
    const png_file_data = try std.io.readFileAlloc(allocator, path);
    defer allocator.free(png_file_data);
    return fromBuffer(allocator, png_file_data);
}

//@NOTE PNG uses Network Byte Order (Big Endian)
pub fn fromBuffer(alloc: *mem.Allocator, buff: []const u8) !Image {
    //check signature
    var reader = utils.mem.BufferReader.init(buff, builtin.Endian.Big);
    
    var sig = try reader.read([png_signature.len]u8);
    if(!mem.eql(u8, sig, png_signature)) return error.InvalidPNG;

    var format_info = utils.structs.makeZero(FormatInfo);
    
    //IHDR must come first!
    var chunk = try Chunk.read(&reader);
    if(!chunk.checkType("IHDR")) return error.InvalidChunkOrder;
    if(chunk.data.len != @sizeOf(IHDR)) return error.InvalidIHDRSizeLength;
    utils.mem.fillStruct(&format_info.ihdr, chunk.data, builtin.Endian.Big); //this doesn't error!
    try format_info.ihdr.verify();

    var deflated_data = std.ArrayList(u8).init(alloc);
    defer deflated_data.deinit();
    
    
    var palette_data: [@maxValue(u8) + 1]RGBA32 = undefined;
    //Several ancilary headers may appear before PLTE/IDAT
    //@TODO: IDAT chunks must be consecutive according to spec, but unchecked
    while(true) {
        chunk = try Chunk.read(&reader);
        const chunk_type_as_int = chunk.typeAsInt();
        //debug.warn("read chunk: {},{}\n", chunk.chunk_type, chunk_type_as_int);
        
        switch(chunk_type_as_int) {
            Chunk.typeToInt("PLTE") => {
                //3,2,6
                switch(format_info.ihdr.color_type) {
                    ColorType.Palette,
                    ColorType.RGB,
                    ColorType.RGBA => {},
                    else => return error.UnexpectedPLTEChunk,
                }
                if(format_info.plte.len > 0) return error.TooManyPLTEChunks;
                
                if(chunk.data.len % 3 != 0) return error.InvalidPLTELength;
                const count = chunk.data.len / 3;
                if(count > u32(0x1) << @intCast(u5, format_info.ihdr.bit_depth)) {
                    return error.InvalidPLTESize;
                }
                
                format_info.plte = palette_data[0..];
                
                const plte = @bytesToSlice(RGB24, chunk.data);
                for(format_info.plte) |*c, i| {
                    const src = col: {
                        if(i < plte.len) break :col plte[i];
                        break :col RGB24 {
                            .r = 0,
                            .g = 0,
                            .b = 0,
                        };
                    };
                    c.* = RGBA32 {
                        .r = src.r,
                        .g = src.g,
                        .b = src.b,
                        .a = @maxValue(u8),
                    };
                }
            },
            //Is single 16b*3 entry for RGB, 16b*1 for Luma
            // for palette is 1B val for every palette index (always 0-255 and scaled to bit depth)
            //  can contain fewer, but not more entries than PLTE
            Chunk.typeToInt("tRNS") => {
                switch(format_info.ihdr.color_type) {
                    ColorType.Luma => {
                        if(chunk.data.len != @sizeOf(u16)) return error.InvalidTRNSChunk;
                        
                        format_info.trns = TRNS {
                            .Luma = (u16(chunk.data[0]) << u8.bit_count) | chunk.data[1],
                        };
                    },
                    ColorType.Palette => {
                        if(chunk.data.len > format_info.plte.len) return error.InvalidTRNSChunk;
                        
                        for(chunk.data) |b, i| {
                            format_info.plte[i].a = b;
                        }
                        
                        format_info.trns = TRNS {
                            .Palette = void{},
                        };
                    },
                    ColorType.RGB => {
                        if(chunk.data.len != @sizeOf(u16) * 3) return error.InvalidTRNSChunk;
                        
                        format_info.trns = TRNS {
                            .RGB = RGB48 {
                                .r = (u16(chunk.data[0]) << u8.bit_count) | chunk.data[1],
                                .g = (u16(chunk.data[2]) << u8.bit_count) | chunk.data[3],
                                .b = (u16(chunk.data[4]) << u8.bit_count) | chunk.data[5],
                            },
                        };
                    },
                    else => return error.UnexpectedTRNSChunk,
                }
                
                //how to check, nullable??
                //if(format_info.trns.len > 0) return error.TooManyTRNSChunks;
                
                
            },
            Chunk.typeToInt("IDAT") =>  {
                //PLTE must come before IDAT if PLTE is required
                if(format_info.ihdr.color_type == ColorType.Palette
                    and format_info.plte.len == 0) return error.MissingRequiredPLTEChunk;
                
                //try deflated_data.ensureCapacity(buff.len - reader.pos); //should be close
                try deflated_data.appendSlice(chunk.data);
            },
            Chunk.typeToInt("IEND") => {
                break;
            },
            else => continue,
        }
    }
    
    if(deflated_data.len == 0) return error.MissingIDATChunks;
   
    //@TODO: For now we skip 0x789C and the end of stream cehcksum
    // add these to inflate.zig & tests!
    //const inflated_data = try inflate.inflate(alloc, inflated_data_raw[2..inflated_data_raw.len - 4]);
    const zlib_inflate_result = try inflate.zlibInflate(alloc, deflated_data.toSliceConst());
    if(zlib_inflate_result.dictid != null) return error.ZlibPresetDictionaryNotSupported;
    const inflated_data = zlib_inflate_result.data;
    defer alloc.free(inflated_data);
    
    //repurpose reader
    reader = utils.mem.BufferReader.init(inflated_data, builtin.Endian.Big);

    //Pass inflated data through filter
    // and interlace into final image buffer
    var image = Image {
        .width = format_info.ihdr.width,
        .height = format_info.ihdr.height,
        .has_alpha = true, //format_info.ihdr.color_type.hasAlpha() or format_info.trns != null,
        .pixels = try alloc.alloc(RGBA32, format_info.ihdr.width * format_info.ihdr.height),
    };
    //for(image.pixels) |*p| p.* = RGBA32{.r = 0, .g = 128, .b = 128, .a = 0,}; //for debugging
    errdefer alloc.free(image.pixels);
    
    //filters operate on just bytes.
    const scanline_bytes = bytes: {
        const bits = format_info.ihdr.width * format_info.ihdr.bit_depth 
            * format_info.ihdr.color_type.numChannels();
        const add = if(bits % 8 > 0) u8(1) else u8(0);
        break :bytes (bits / 8) + add;
    };
    var scanlines: [2][]u8 = undefined;
    scanlines[0] = try alloc.alloc(u8, scanline_bytes); //previous (filtered)
    defer alloc.free(scanlines[0]);
    scanlines[1] = try alloc.alloc(u8, scanline_bytes); //current (filtered)
    defer alloc.free(scanlines[1]);
    
    
    //for(scanlines[0]) |*b| b.* = 0; //already done every interlace
    //for(scanlines[1]) |*b| b.* = 0; //gets overwritten
    
    format_info.image = &image;
    
    const interlace = try InterlaceDescriptor.getInterlace(&format_info);
    for(interlace) |interlace_descriptor, int_pass| {
        var int_desc = interlace_descriptor;
        if(int_desc.start_pixel >= image.width) continue;

        for(scanlines[0]) |*b| b.* = 0;
        
        const sub_width = px: {
            const div = (image.width - int_desc.start_pixel) / int_desc.stride_pixel;
            const mod = (image.width - int_desc.start_pixel) % int_desc.stride_pixel;
            const add = if(mod > 0) u8(1) else u8(0);
            break :px div + add;
        };
        const sub_bytes = bytes: {
            const bits = sub_width * format_info.ihdr.bit_depth 
                * format_info.ihdr.color_type.numChannels();
            const add = if(bits % 8 > 0) u8(1) else u8(0);
            break :bytes (bits / 8) + add;
        };
       
        var sublines: [2][]u8 = undefined;
        sublines[0] = scanlines[0][0..sub_bytes];
        sublines[1] = scanlines[1][0..sub_bytes];
        
        while(int_desc.start_line < image.height) {
            const filter_type_byte = try reader.read(u8);
            const filter_type = try FilterType.from(filter_type_byte);
            try filter_type.unfilter(&reader, &format_info, sublines);

            var scanline = sublines[1];
            switch(format_info.ihdr.color_type) {
                ColorType.Luma => {
                    if(format_info.trns) |_| {
                        switch(format_info.ihdr.bit_depth) {
                            1 => try renderLuma1BppTrnsScanline(&format_info, scanline, &int_desc),
                            2 => try renderLuma2BppTrnsScanline(&format_info, scanline, &int_desc),
                            4 => try renderLuma4BppTrnsScanline(&format_info, scanline, &int_desc),
                            8 => try renderLuma8BppTrnsScanline(&format_info, scanline, &int_desc),
                            16 => try renderLuma16BppTrnsScanline(&format_info, scanline, &int_desc),
                            else => unreachable,
                        }
                    }
                    else {
                        switch(format_info.ihdr.bit_depth) {
                            1 => try renderLuma1BppScanline(&format_info, scanline, &int_desc),
                            2 => try renderLuma2BppScanline(&format_info, scanline, &int_desc),
                            4 => try renderLuma4BppScanline(&format_info, scanline, &int_desc),
                            8 => try renderLuma8BppScanline(&format_info, scanline, &int_desc),
                            16 => try renderLuma16BppScanline(&format_info, scanline, &int_desc),
                            else => unreachable,
                        }
                    }
                },
                
                ColorType.RGB =>  {
                    if(format_info.trns) |_| {
                        switch(format_info.ihdr.bit_depth) {
                            8 => try renderRGB8BppTrnsScanline(&format_info, scanline, &int_desc),
                            16 => try renderRGB16BppTrnsScanline(&format_info, scanline, &int_desc),
                            else => unreachable,
                        }
                    }
                    else {
                        switch(format_info.ihdr.bit_depth) {
                            8 => try renderRGB8BppScanline(&format_info, scanline, &int_desc),
                            16 => try renderRGB16BppScanline(&format_info, scanline, &int_desc),
                            else => unreachable,
                        }
                    }
                    
                },
                ColorType.Palette => switch(format_info.ihdr.bit_depth) {
                    1 => try renderPaletted1BppScanline(&format_info, scanline, &int_desc),
                    2 => try renderPaletted2BppScanline(&format_info, scanline, &int_desc),
                    4 => try renderPaletted4BppScanline(&format_info, scanline, &int_desc),
                    8 => try renderPaletted8BppScanline(&format_info, scanline, &int_desc),
                    else => unreachable,
                },
                ColorType.LumaAlpha => switch(format_info.ihdr.bit_depth) {
                    8 => try renderLumaAlpha8BppScanline(&format_info, scanline, &int_desc),
                    16 => try renderLumaAlpha16BppScanline(&format_info, scanline, &int_desc),
                    else => unreachable,
                },
                ColorType.RGBA => switch(format_info.ihdr.bit_depth) {
                    8 => try renderRGBA8BppScanline(&format_info, scanline, &int_desc),
                    16 => try renderRGBA16BppScanline(&format_info, scanline, &int_desc),
                    else => unreachable,
                },
            }

            int_desc.start_line += int_desc.stride_line;
            const temp_subline = sublines[1];
            sublines[1] = sublines[0];
            sublines[0] = temp_subline;
        }
    }
    //@TODO: other ancillary chunks??
    
    return image;
}


//TODO: More error checking
// These can probably be further combined
const RendererFn = fn(*FormatInfo, []const u8, *const InterlaceDescriptor) error!void;

//8,16 bits per channel, 1,2,3,4 channels per pixel
// 1 => luma, 2 => luma alpha, 3 => rgb, 4 => rgba
fn genChannelScanlineRenderer(comptime bpc: u8, comptime cpp: u8, comptime trns: bool) RendererFn
{
    if(bpc != u8.bit_count and bpc != u16.bit_count)  {
        @compileError("bpp must be a power of two between 1 and " 
            ++ u16.bit_count ++ ", inclusive.");
    }
    
    const Closure = struct {
        fn renderChannelScanline(inf: *FormatInfo, scanline: []const u8, 
            int_desc: *const InterlaceDescriptor) error!void {
            var image = inf.image;
            
            debug.assert(inf.ihdr.bit_depth == bpc);
            if(trns) {
                debug.assert(inf.trns != null);
                debug.assert(cpp % 2 != 0);
                if(cpp == 1) debug.assert(ColorType(inf.trns.?) == ColorType.Luma);
                if(cpp == 3) debug.assert(ColorType(inf.trns.?) == ColorType.RGB);
            }
            else debug.assert(inf.trns == null);
            
            const byte_pc = bpc / u8.bit_count;
            
            //if(int_desc.start_line > image.height) return error.TruncatedData;
            const y = int_desc.start_line;
            const px_start = y * image.width;
            const px_end = px_start + image.width;
            var pixels = image.pixels[px_start..px_end];
            
            //@NOTE: We actually only take the most significant 8 bits
            // (Big Endian) in the case of 16bpc
            
            var scanline_x = u32(0);
            var x = int_desc.start_pixel;
            while(x < image.width):(x += int_desc.stride_pixel) {
                pixels[x] = switch(cpp) {
                    1 => RGBA32 {
                        .r = scanline[scanline_x],
                        .g = scanline[scanline_x],
                        .b = scanline[scanline_x],
                        .a = alpha: {
                            if(trns) {
                                const byte = scanline[scanline_x];
                                const value = switch(byte_pc) {
                                    1 => byte, 
                                    2 => (u16(byte) << u8.bit_count) | scanline[scanline_x + 1],
                                    else => unreachable,
                                };
                                const trns_color = inf.trns.?.Luma;
                                if(trns_color == value) break :alpha u8(0);
                            }
                            break :alpha @maxValue(u8);
                        },
                    },
                    2 => RGBA32 {
                        .r = scanline[scanline_x],
                        .g = scanline[scanline_x],
                        .b = scanline[scanline_x],
                        .a = scanline[scanline_x + byte_pc],
                    },
                    3 => RGBA32 {
                        .r = scanline[scanline_x],
                        .g = scanline[scanline_x + byte_pc],
                        .b = scanline[scanline_x + (2 * byte_pc)],
                        .a = alpha: {
                            if(trns) {
                                const rbyte = scanline[scanline_x];
                                const gbyte = scanline[scanline_x + byte_pc];
                                const bbyte = scanline[scanline_x + (2 * byte_pc)];
                                
                                const value: RGB48 = switch(byte_pc) {
                                    1 => RGB48 {
                                        .r = rbyte,
                                        .g = gbyte,
                                        .b = bbyte,
                                    },
                                    2 => RGB48 {
                                        .r = (u16(rbyte) << u8.bit_count)
                                            | scanline[scanline_x + 1],
                                        .g = (u16(gbyte) << u8.bit_count)
                                            | scanline[scanline_x + byte_pc + 1],
                                        .b = (u16(bbyte) << u8.bit_count) 
                                            | scanline[scanline_x + (2 * byte_pc) + 1],
                                    },
                                    else => unreachable,
                                };
                                
                                const trns_color = inf.trns.?.RGB;
                                if(trns_color.r == value.r 
                                    and trns_color.g == value.g
                                    and trns_color.b == value.b) break :alpha u8(0);
                            }
                            break :alpha @maxValue(u8);
                        },
                    },
                    4 => RGBA32 {
                        .r = scanline[scanline_x],
                        .g = scanline[scanline_x + byte_pc],
                        .b = scanline[scanline_x + (2 * byte_pc)],
                        .a = scanline[scanline_x + (3 * byte_pc)],
                    },
                    else => unreachable,
                };
                scanline_x += byte_pc * cpp;
            }
        }
    };
    
    return Closure.renderChannelScanline;
}

const renderLuma8BppScanline = genChannelScanlineRenderer(8, 1, false);
const renderLuma16BppScanline = genChannelScanlineRenderer(16, 1, false);

const renderLuma8BppTrnsScanline = genChannelScanlineRenderer(8, 1, true);
const renderLuma16BppTrnsScanline = genChannelScanlineRenderer(16, 1, true);

const renderLumaAlpha8BppScanline = genChannelScanlineRenderer(8, 2, false);
const renderLumaAlpha16BppScanline = genChannelScanlineRenderer(16, 2, false);

const renderRGB8BppScanline = genChannelScanlineRenderer(8, 3, false);
const renderRGB16BppScanline = genChannelScanlineRenderer(16, 3, false);

const renderRGB8BppTrnsScanline = genChannelScanlineRenderer(8, 3, true);
const renderRGB16BppTrnsScanline = genChannelScanlineRenderer(16, 3, true);

const renderRGBA8BppScanline = genChannelScanlineRenderer(8, 4, false);
const renderRGBA16BppScanline = genChannelScanlineRenderer(16, 4, false);

//1,2,4 bpp luma
fn genLumaScanlineRenderer(comptime bpp: u8, comptime trns: bool) RendererFn
{
    if(bpp != u1.bit_count and bpp != u2.bit_count and bpp != u4.bit_count)  {
        @compileError("bpp must be a power of two between " 
            ++ u1.bit_count ++ " and " ++ u4.bit_count
            ++ ", inclusive.");
    }
    
    const max_bpp_value = @maxValue(@IntType(false, bpp));
    
    const Closure = struct {
        fn renderLumaScanline(inf: *FormatInfo, scanline: []const u8, 
            int_desc: *const InterlaceDescriptor) error!void {
            var image = inf.image;
            
            debug.assert(inf.ihdr.bit_depth == bpp);
            if(trns) {
                debug.assert(inf.trns != null);
                debug.assert(ColorType(inf.trns.?) == ColorType.Luma);
            }
            else debug.assert(inf.trns == null);
            
            const pp_byte = (u8.bit_count / bpp);
            const base_mask = u8(0xFF) >> @intCast(u3, u8.bit_count - bpp);
            
            //if(int_desc.start_line > image.height) return error.TruncatedData;
            const y = int_desc.start_line;
            const px_start = y * image.width;
            const px_end = px_start + image.width;
            var pixels = image.pixels[px_start..px_end];
            
            var x = int_desc.start_pixel;
            var scanline_x = u32(0);
            while(x < image.width):(x += int_desc.stride_pixel) {
                const byte = (scanline_x / pp_byte);
                const shift = @intCast(u3, (pp_byte - ((scanline_x % pp_byte) + 1)) * bpp);
                const mask = base_mask << shift;
                const portion = (scanline[byte] & mask) >> shift;
                const scaled = (@intToFloat(f32, portion) / @intToFloat(f32, max_bpp_value)) * @maxValue(u8);
                const value = @floatToInt(u8, scaled);

                pixels[x] = RGBA32 {
                    .r = value,
                    .g = value,
                    .b = value,
                    .a = alpha: {
                        if(trns) {
                            if(portion == inf.trns.?.Luma) break :alpha u8(0);
                        }
                        break :alpha @maxValue(u8);
                    },
                };
                scanline_x += 1;
            }            
        }
    };
    
    return Closure.renderLumaScanline;
}
const renderLuma1BppScanline = genLumaScanlineRenderer(1, false);
const renderLuma2BppScanline = genLumaScanlineRenderer(2, false);
const renderLuma4BppScanline = genLumaScanlineRenderer(4, false);
const renderLuma1BppTrnsScanline = genLumaScanlineRenderer(1, true);
const renderLuma2BppTrnsScanline = genLumaScanlineRenderer(2, true);
const renderLuma4BppTrnsScanline = genLumaScanlineRenderer(4, true);

//1,2,4,8 bpp index
fn genPalettedScanlineRenderer(comptime bpp: u8) RendererFn
{
    if(bpp > u8.bit_count or bpp < 1)  {
        @compileError("bpp must be a power of two between 1 and " 
            ++ u8.bit_count ++ ", inclusive.");
    }
    
    const Closure = struct {
        fn renderPalettedScanline(inf: *FormatInfo, scanline: []const u8, 
            int_desc: *const InterlaceDescriptor) error!void {
            var image = inf.image;
            
            debug.assert(inf.ihdr.bit_depth == bpp);
            
            const pp_byte = (u8.bit_count / bpp);
            const base_mask = u8(0xFF) >> @intCast(u3, u8.bit_count - bpp);
            
            //if(int_desc.start_line > image.height) return error.TruncatedData;
            const y = int_desc.start_line;
            const px_start = y * image.width;
            const px_end = px_start + image.width;
            var pixels = image.pixels[px_start..px_end];
            
            var scanline_x = u32(0);
            var x = int_desc.start_pixel;
            while(x < image.width):(x += int_desc.stride_pixel) {
                const byte = (scanline_x / pp_byte);
                
                const shift = @intCast(u3, (pp_byte - ((scanline_x % pp_byte) + 1)) * bpp);
                const mask = base_mask << shift;
                const pal_index = (scanline[byte] & mask) >> shift;
                pixels[x] = inf.plte[pal_index];
                scanline_x += 1;
            }
        }
    };
    
    return Closure.renderPalettedScanline;
}

const renderPaletted1BppScanline = genPalettedScanlineRenderer(1);
const renderPaletted2BppScanline = genPalettedScanlineRenderer(2);
const renderPaletted4BppScanline = genPalettedScanlineRenderer(4);
const renderPaletted8BppScanline = genPalettedScanlineRenderer(8);

// Test

const test_png_data = @embedFile("test.png");

test "png"
{
    var dalloc = std.heap.DirectAllocator.init();
    //defer dalloc.deinit();
    var alloc = &dalloc.allocator;
    
    const image = try fromBuffer(alloc, test_png_data);
    //debug.warn("{}x{}\n", image.width, image.height);
}