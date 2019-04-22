const builtin = @import("builtin");
const std = @import("std");
const Allocator = std.mem.Allocator;

pub const StackAllocator = struct {
  allocator: Allocator,
  getMarkFn: fn (self: *StackAllocator) usize,
  freeToMarkFn: fn (self: *StackAllocator, pos: usize) void,
};

pub const SingleStackAllocatorFlat = struct {
  allocator: Allocator,
  used: usize,
  buffer: []u8,

  pub fn init(buffer: []u8) SingleStackAllocatorFlat {
    return SingleStackAllocatorFlat{
      .allocator = Allocator{
        .allocFn = alloc,
        .reallocFn = realloc,
        .freeFn = free,
      },
      .used = 0,
      .buffer = buffer,
    };
  }

  fn alloc(allocator: *Allocator, n: usize, alignment: u29) ![]u8 {
    const self = @fieldParentPtr(SingleStackAllocatorFlat, "allocator", allocator);
  
    const addr = @ptrToInt(self.buffer.ptr) + self.used;
    const rem = @rem(addr, alignment);
    const march_forward_bytes = if (rem == 0) 0 else (alignment - rem);
    const adjusted_index = self.used + march_forward_bytes;
    const new_end_index = adjusted_index + n;
    if (new_end_index > self.buffer.len) {
      return error.OutOfMemory;
    }
    const result = self.buffer[adjusted_index..new_end_index];
    self.used = new_end_index;
    return result;
  }

  fn realloc(allocator: *Allocator, old_mem: []u8, new_size: usize, alignment: u29) ![]u8 {
    if (new_size <= old_mem.len) {
      return old_mem[0..new_size];
    } else {
      const result = try alloc(allocator, new_size, alignment);
      std.mem.copy(u8, result, old_mem);
      return result;
    }
  }

  fn free(allocator: *Allocator, bytes: []u8) void {}

  fn get_mark(self: *SingleStackAllocatorFlat) usize {
    return self.used;
  }

  fn free_to_mark(self: *SingleStackAllocatorFlat, pos: usize) void {
    std.debug.assert(pos <= self.used);
    if (pos < self.used) {
      if (builtin.mode == builtin.Mode.Debug) {
        std.mem.set(u8, self.buffer[pos..pos + self.used], 0xcc);
      }
      self.used = pos;
    }
  }
};

test "SingleStackAllocatorFlat" {
  var buf: [100 * 1024]u8 = undefined;
  var ssaf = SingleStackAllocatorFlat.init(buf[0..]);
  _ = ssaf.allocator.alloc(u8, 7);
}

//Array
pub fn fillArray(array: var, buff: []const u8, endian: builtin.Endian) void
{
    const T = @typeOf(array);
    if(@typeId(T) == builtin.TypeId.Pointer)
    {
        const type_info = @typeInfo(T);
        if(type_info.Pointer.size == builtin.TypeInfo.Pointer.Size.Slice)
        {
            const C = T.Child;
            for(array) |*v, i|
            {
                const pos = i * @sizeOf(C);
                fillType(v, buff[pos..], endian);
            }
            return;
        }
        
        const C = T.Child.Child;
        for(array.*) |*v, i|
        {
            const pos = i * @sizeOf(C);
            fillType(v, buff[pos..], endian);
        }
        return;
    }

    @compileError("fillArray requires pointer.");
}

pub fn readArray(comptime T: type, buff: []const u8, endian: builtin.Endian) T
{
    var result: T = undefined;
    fillArray(result[0..], buff, endian);
    return result;
}

pub fn writeArray(array: var, buff: []u8, endian: builtin.Endian) void
{
    const T = @typeOf(array).Child;
    
    for(array) |v, i|
    {
        const pos = i * @sizeOf(T);
        writeType(v, buff[pos..], endian);
    }
}


//Struct
pub fn fillStruct(ptr: var, buff: []const u8, endian: builtin.Endian) void
{
    const T = @typeOf(ptr);
    const info = @typeInfo(T.Child);
    
    var pos = usize(0);
    
    inline for(info.Struct.fields) |*field_info|
    {
        const name = field_info.name;
        const FieldType = field_info.field_type;

        const end = pos + @sizeOf(FieldType);
   
        const data = buff[pos..end];
        fillType(&@field(ptr, name), data, endian);
        
        pos = end;
    }
}

pub fn readStruct(comptime T: type, buff: []const u8, endian: builtin.Endian) T
{
    var result: T = undefined;
    fillStruct(&result, buff, endian);
    return result;
}

pub fn writeStruct(st: var, buff: []u8, endian: builtin.Endian) void
{
    const T = @typeOf(st);
    if(@typeId(T) != builtin.TypeId.Struct) @compileError("writeStruct requires struct type.");
    const info = @typeInfo(T);
    
    var pos = usize(0);
    
    inline for(info.Struct.fields) |*field_info|
    {
        const name = field_info.name;
        const FieldType = field_info.field_type;
        
        const end = pos + @sizeOf(FieldType);
        const data = buff[pos..end];
        
        writeType(@field(st, name), data, endian);
        
        pos = end;
    }
}

//Generic
pub fn fillType(inp: var, buff: []const u8, endian: builtin.Endian) void
{
    const InpType = @typeOf(inp);
    const inp_type_id = @typeId(InpType);
    if(inp_type_id != builtin.TypeId.Pointer) @compileError("fillType requires pointer type.");
    const ChildType = InpType.Child;
    const child_type_id = @typeId(ChildType);
    
    //@BUG: If we call isSlice here, we get a "slice of single item pointer" error
    if(@typeInfo(InpType).Pointer.size == builtin.TypeInfo.Pointer.Size.Slice)
    {
        fillArray(inp, buff, endian);
        return;
    }
    
    switch(child_type_id)
    {
        builtin.TypeId.Int => inp.* = readInt(ChildType, buff, endian),
        builtin.TypeId.Float => inp.* = readFloat(ChildType, buff, endian),
        builtin.TypeId.Array => fillArray(inp[0..], buff, endian),
        builtin.TypeId.Struct => fillStruct(inp, buff, endian),
        builtin.TypeId.Enum => 
        {
            var value = readInt(@TagType(ChildType), buff, endian);
            {
                //runtime checks will force a panic if enum value
                // doesn't map, but user may want to handle that
                @setRuntimeSafety(false);
                inp.* = @intToEnum(ChildType, value);
            }
            
        },
        else => @compileError(@tagName(child_type_id) ++ " unimplemented."),
    }
}

pub fn readType(comptime T: type, buff: []const u8, endian: builtin.Endian) T
{
    if(@typeId(T) == builtin.TypeId.Pointer)
    {
        @compileError("Cannot read to pointer type " ++ @typeName(T) ++ ".");
    }
    
    var result: T = undefined;
    fillType(&result, buff, endian);
    return result;
}

pub fn writeType(inp: var, buff: []u8, endian: builtin.Endian) void
{
    const T = @typeOf(inp);
    const type_id = @typeId(T);
    
    //@BUG: If we call isSlice here, we get a "slice of single item pointer" error
    if(@typeId(T) == builtin.TypeId.Pointer
        and @typeInfo(T).Pointer.size == builtin.TypeInfo.Pointer.Size.Slice)
    {
        writeArray(inp, buff, endian);
        return;
    }
    
    switch(type_id)
    {
        builtin.TypeId.Int => writeInt(inp, buff, endian),
        builtin.TypeId.Float => writeFloat(inp, buff, endian),
        builtin.TypeId.Array => writeArray(inp[0..], buff, endian),
        builtin.TypeId.Struct => writeStruct(inp, buff, endian),
        builtin.TypeId.Enum => writeInt(@enumToInt(inp), buff, endian),
        else => @compileError(@tagName(type_id) ++ " unimplemented."),
    }
}

//helpers
inline fn sizeRequired(inp: var) usize
{
    const T = @typeOf(inp);
    if(isSlice(T)) return inp.len * @sizeOf(T.Child);
    if(@typeId(T) == builtin.TypeId.Array) return inp.len * @sizeOf(T.Child);
    return @sizeOf(T);
}

//@BUG
//#906
fn isSlice(comptime T: type) bool
{
    const info = @typeInfo(T);
    switch(info)
    {
        builtin.TypeId.Pointer => |size| 
        {
            if(size == builtin.TypeInfo.Pointer.Size.Slice)
            {
                return true;
            }
        },
        else => {},
    }
    return false;
}

//Reader
pub const BufferReader = struct
{
    buff: []const u8,
    endian: builtin.Endian,
    pos: usize,
    
    pub fn init(b: []const u8, e: builtin.Endian) BufferReader
    {
        return BufferReader
        {
            .buff = b,
            .endian = e,
            .pos = 0,
        };
    }
    
    pub fn read(self: *BufferReader, comptime T: type) !T
    {
        var result = try self.peekRead(T);
        self.pos += @sizeOf(T);
        return result;
    }
    
    pub fn fill(self: *BufferReader, ptr: var) !void
    {
        try self.peekFill(ptr);
        self.pos += @sizeOf(@typeOf(ptr).Child);
    }
    
    pub fn getBytes(self: *BufferReader, n: usize) ![]const u8
    {
        if(self.buff.len - self.pos < n) return error.TruncatedData;
        const bytes = self.buff[self.pos..self.pos + n];
        self.pos += n;
        return bytes;
    }
    
    pub fn peekRead(self: *BufferReader, comptime T: type) !T
    {
        if(self.buff.len - self.pos < @sizeOf(T)) return error.TruncatedData;
        return readType(T, self.buff[self.pos..], self.endian);
    }
    
    pub fn peekFill(self: *BufferReader, ptr: var) !void
    {
        if(@typeId(@typeOf(ptr)) != builtin.TypeId.Pointer) @compileError("fill requires pointer.");
        const T = @typeOf(ptr).Child;
        
        if(self.buff.len - self.pos < @sizeOf(T)) return error.TruncatedData;
        fillType(ptr, self.buff[self.pos..], self.endian);
    }
    
    pub fn readRaw(self: *BufferReader, comptime T: type) !T
    {
        var result = try self.peekReadRaw(T);
        self.pos += @sizeOf(T);
        return result;
    }
    
    pub fn fillRaw(self: *BufferReader, ptr: var) !void
    {
        try self.peekFillRaw(ptr);
        self.pos += @sizeOf(T);
    }
    
    pub fn peekReadRaw(self: *BufferReader, comptime T: type) !T
    {
        const Bytes = [@sizeOf(T)]align(@alignOf(T)) u8;
        var result: Bytes = undefined;
        try self.peekFill(&result);
        
        //@BUG
        //LLVM error with packed structs
        // see #991
        //return @bitCast(T, result);
        var ptr = @ptrCast(*T, &result);
        return ptr.*;
    }
    
    pub fn peekFillRaw(self: *BufferReader, ptr: var) !void
    {
        const T = @typeOf(ptr).Child;
        var bytes = bytesOf(ptr);
        try self.peekFill(bytes);
    }
};


//Writer
const BufferWriter = struct
{
    buff: []u8,
    endian: builtin.Endian,
    pos: usize,
    
    pub fn init(b: []u8, e: builtin.Endian) BufferWriter
    {
        return BufferWriter
        {
            .buff = b,
            .endian = e,
            .pos = 0,
        };
    }
    
    pub fn write(inp: var) !void
    {
        const T = @typeOf(inp);
        const size = sizeRequired(inp);
        if(size < buff.len - self.pos) return error.BufferExhausted;
        writeType(inp, self.buff[self.pos..], self.endian);
        self.pos += size;
    }
    
    pub fn writeRaw(inp: var, buff: []u8) !void
    {
        const T = @typeOf(inp);
        const size = sizeRequired(inp);
        if(size < buff.len - self.pos) return error.BufferExhausted;
        
        var bytes = if(@typeId(T) == builtin.TypeId.Pointer) bytesOf(inp) else bytesOf(&inp);
        try self.writeArray(bytes, self.buff[self.pos..], self.endian);
        self.pos += size;
    }
};



///////Tests
fn makeBytes(thing: var, endian: builtin.Endian) []const u8
{
    comptime
    {
        const T = @typeOf(thing);
        var bytes: [@sizeOf(T)]u8 = undefined; 
        writeInt(thing, bytes[0..], endian);
        return bytes;
    }
}

test "writeInt"
{
    var buffer = []u8{0} ** 8;
    
    writeInt(u8(0x69), buffer[0..], builtin.Endian.Little);
    debug.assert(buffer[0] == 0x69);
    buffer[0] = 0;
    writeInt(u8(0x69), buffer[0..], builtin.Endian.Big);
    debug.assert(buffer[0] == 0x69);
    
    writeInt(u32(0x08675309), buffer[0..], builtin.Endian.Little);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(u32)], "\x09\x53\x67\x08"));
    buffer[0] = 0;
    writeInt(u32(0x08675309), buffer[0..], builtin.Endian.Big);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(u32)], "\x08\x67\x53\x09"));
    
    writeInt(i32(-0x10DEFACE), buffer[0..], builtin.Endian.Little);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(u32)], "\x32\x05\x21\xEF"));
    buffer[0] = 0;
    writeInt(i32(-0x10DEFACE), buffer[0..], builtin.Endian.Big);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(u32)], "\xEF\x21\x05\x32"));
}

//This assumes writeInt is correct
test "readInt"
{
    const u8_buffer = "\x69";
    const u16_buffer_le = "\x39\x05";
    const u16_buffer_be = "\x05\x39";
    
    const is_value = isize(@minValue(isize));
    const is_buffer_le = comptime makeBytes(is_value, builtin.Endian.Little);
    const is_buffer_be = comptime makeBytes(is_value, builtin.Endian.Big);
    
    debug.assert(readInt(u8, u8_buffer, builtin.Endian.Little) == 0x69);
    debug.assert(readInt(u8, u8_buffer, builtin.Endian.Big) == 0x69);
    debug.assert(readInt(u16, u16_buffer_le, builtin.Endian.Little) == 1337);
    debug.assert(readInt(u16, u16_buffer_be, builtin.Endian.Big) == 1337);
    debug.assert(readInt(isize, is_buffer_le, builtin.Endian.Little) == is_value);
    debug.assert(readInt(isize, is_buffer_be, builtin.Endian.Big) == is_value);
}

//This also assumes writeInt is correct!
test "read/writeFloat"
{
    const f32_value = f32(123.456);
    const f64_value = f64(-54321.9876);
    
    const f32_buffer_le = comptime makeBytes(f32_value, builtin.Endian.Little);
    const f32_buffer_be = comptime makeBytes(f32_value, builtin.Endian.Big);

    const f64_buffer_le = comptime makeBytes(f64_value, builtin.Endian.Little);
    const f64_buffer_be = comptime makeBytes(f64_value, builtin.Endian.Big);

    debug.assert(readFloat(f32, f32_buffer_le, builtin.Endian.Little) == f32_value);
    debug.assert(readFloat(f32, f32_buffer_be, builtin.Endian.Big) == f32_value);
    debug.assert(readFloat(f64, f64_buffer_le, builtin.Endian.Little) == f64_value);
    debug.assert(readFloat(f64, f64_buffer_be, builtin.Endian.Big) == f64_value);
    
    var buffer = []u8{0} ** 8;
    writeFloat(f32_value, buffer[0..], builtin.Endian.Little);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(f32)], f32_buffer_le));
    writeFloat(f32_value, buffer[0..], builtin.Endian.Big);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(f32)], f32_buffer_be));
    writeFloat(f64_value, buffer[0..], builtin.Endian.Little);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(f64)], f64_buffer_le));
    writeFloat(f64_value, buffer[0..], builtin.Endian.Big);
    debug.assert(std.mem.eql(u8, buffer[0..@sizeOf(f64)], f64_buffer_be));
}

test "read/writeArray"
{
    const values = [4]u32{1337, 867, 5309, 111111};
    var read_values = [4]u32{0,0,0,0}; 

    fillArray(&read_values, @sliceToBytes(values[0..]), builtin.endian);
    debug.assert(std.mem.eql(u32, read_values, values));
    
    read_values = [4]u32{0,0,0,0}; 
    writeArray(values, @sliceToBytes(read_values[0..]), builtin.endian);
    debug.assert(std.mem.eql(u32, read_values, values));
}

test "read/writeType w/ slices"
{
    const values = [4]u32{1337, 867, 5309, 111111};
    var read_values = [4]u32{0,0,0,0}; 
    
    fillType(read_values[0..], @sliceToBytes(values[0..]), builtin.endian);
    debug.assert(std.mem.eql(u32, read_values, values));
    
    read_values = [4]u32{0,0,0,0}; 
    writeType(values[0..], @sliceToBytes(read_values[0..]), builtin.endian);
}

test "read/writeStruct"
{
    const ComplexStruct = struct
    {
        id: u32,
        name: [10]u8,
        pos: struct
        {
            x: f32,
            y: f32,
        },
        color: packed struct
        {
            r: u8,
            g: u8,
            b: u8,
        },
    };
    
    const f32_value = f32(123.456);
    const f32_buffer_le = comptime makeBytes(f32_value, builtin.endian);
    
    const bytes = []u8
    {
        '\xDE','\xC0','\xAD','\xBA',                                                //id
        'P','l','a','y','e','r',0,0,0,0,                                            //name
        f32_buffer_le[0], f32_buffer_le[1], f32_buffer_le[2], f32_buffer_le[3],     //x
        f32_buffer_le[0], f32_buffer_le[1], f32_buffer_le[2], f32_buffer_le[3],     //y
        0xFF,0x55,0x11,                                                             //r,g,b
    };
    
    var complex_struct: ComplexStruct = undefined;
    complex_struct.id = 0xBAADC0DE;
    complex_struct.name = "Player\x00\x00\x00\x00";
    complex_struct.pos.x = f32_value;
    complex_struct.pos.y = f32_value;
    complex_struct.color.r = 0xFF;
    complex_struct.color.g = 0x55;
    complex_struct.color.b = 0x11;
    
    var write_buffer: [@sizeOf(@typeOf(bytes))]u8 = undefined;
    writeStruct(complex_struct, write_buffer[0..], builtin.endian);
    debug.assert(std.mem.eql(u8, write_buffer, bytes));
    
    complex_struct = readStruct(ComplexStruct, bytes, builtin.endian);
    debug.assert(complex_struct.id == 0xBAADC0DE);
    debug.assert(std.mem.eql(u8, complex_struct.name, "Player\x00\x00\x00\x00"));
    debug.assert(complex_struct.pos.x == f32_value);
    debug.assert(complex_struct.pos.y == f32_value);
    debug.assert(complex_struct.color.r == 0xFF);
    debug.assert(complex_struct.color.g == 0x55);
    debug.assert(complex_struct.color.b == 0x11);
}

//@TODO: copyFields(), copyies values of fields with same name from one
// struct to another

//@NOTE: Soon replaced by @bytesToSlice/@sliceToBytes
pub fn bytesOf(ptr: var) []u8
{
    const PtrType = @typeOf(ptr);
    const PtrTypeId = @typeId(PtrType);
    debug.assert(PtrTypeId == builtin.TypeId.Pointer);
    
    var aligned = @alignCast(@alignOf(*u8), ptr);
    return @ptrCast([*]u8, aligned)[0..@sizeOf(PtrType.Child)];
}

pub fn bytesOfConst(ptr: var) []const u8
{
    const PtrType = @typeOf(ptr);
    const PtrTypeId = @typeId(PtrType);
    debug.assert(PtrTypeId == builtin.TypeId.Pointer);
    
    const aligned = @alignCast(@alignOf(*u8), ptr);
    return @ptrCast([*]const u8, aligned)[0..@sizeOf(PtrType.Child)];
}

pub fn fillZero(ptr: var) void
{
    const PtrType = @typeOf(ptr);
    const PtrTypeId = @typeId(PtrType);
    if(PtrTypeId != builtin.TypeId.Pointer) @compileError("Arg is not a *Struct");
    
    for(bytesOf(ptr)) |*b| b.* = 0;
} 

pub fn makeZero(comptime T: type) T
{
    var result: T = undefined;
    fillZero(&result);
    return result;
}

// DEBUG
pub fn warnStruct(ptr: var) void
{
    const PtrType = @typeOf(ptr);
    const PtrTypeId = @typeId(PtrType);
    if(PtrTypeId != builtin.TypeId.Pointer) @compileError("Arg is not a struct");
    const StructTypeId = @typeId(PtrType.Child);
    if(StructTypeId != builtin.TypeId.Struct) @compileError("Arg is not a struct");
    const struct_name = @typeName(PtrType.Child);
    warn("{} = {{\n", struct_name);
    const info = @typeInfo(PtrType.Child);
    
    inline for(info.Struct.fields) |*field_info|
    {
        const name = field_info.name;
        const FieldType = field_info.field_type;
        switch(@typeId(FieldType))
        {
            builtin.TypeId.Int,
            builtin.TypeId.Bool,
            builtin.TypeId.Struct =>
            {
                //@FIX: This only works if there is a format on the type
                // if there isn't we should print something more meaningful.
                // Unfortunately recursion doesn't seem to work!
                warn("  {}: {} = {},\n", name, @typeName(FieldType), @field(ptr, name));
            },
            builtin.TypeId.Array =>
            {
                warn("  {}: {} = {{", name, @typeName(FieldType));
                for(@field(ptr, name)) |v, i|
                {
                    warn("{},", v);
                    if(i >= 10)
                    {
                        warn(" ...");
                        break;
                    }
                }
                warn("}}");
                if(FieldType.Child == u8)
                {
                    warn(" (");
                    for(@field(ptr, name)) |v, i|
                    {
                        warn("{c}", v);
                        if(i >= 10)
                        {
                            warn(" ...");
                            break;
                        }
                    }
                    warn(")");
                }
                warn("\n");
            },
            //@BUG #1080
            builtin.TypeId.Enum =>
            {
                //warn("  {}: {} = {},\n", name, @typeName(FieldType), @enumToInt(@field(ptr, name)));
                warn("  {}: {} = {},\n", name, @typeName(FieldType), @tagName(@field(ptr, name)));
            },
            builtin.TypeId.Union =>
            {
                warn("  {}: {} = {},\n", name, @typeName(FieldType), &@field(ptr, name));
            },
            else => warn("  {}: {} = {},\n", name, @typeName(FieldType), @field(ptr, name)),
        }
        
    }
    warn("}};\n");
}

////////////////////////// Type utils ///////////////////////

pub inline fn isTypeId(comptime T: var, comptime Tid: TypeId) bool {
    comptime return @typeId(asType(T)) == Tid;
}

pub inline fn asType(comptime T: var) type { // T may not be a type, get the type or return T
    comptime return switch (@typeId(@typeOf(T))) {
        TypeId.Type => T,
        else => @typeOf(T),
    };
}

pub inline fn isType(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Type);
}

pub inline fn isVoid(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Void);
}

pub inline fn isNoReturn(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.NoReturn);
}

pub inline fn isUndefined(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Undefined);
}

pub inline fn isNull(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Null);
}

pub inline fn isOptional(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Optional);
}

pub inline fn isErrorUnion(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.ErrorUnion);
}

// TODO: test these

////////////////////////// Funtion Utils ////////////////////

pub inline fn isFunction(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Fn);
}

pub inline fn isFunctionPtr(comptime T: var) bool {
    comptime if (!isPointer(T)) return false;
    comptime return isFunction(pointerOf(T));
}

pub inline fn returnOf(comptime T: var) type {
    comptime if (!isFunction(T) and !isFunctionPtr(T)) @compileError("returnOf must be of Function type");
    comptime const FT = asType(if (isFunctionPtr(T)) pointerOf(T) else T); // unwrap the function pointer
    comptime return @typeInfo(FT).Fn.return_type;
}

test "isFunction" {
    assert(isFunction(@typeOf(isFunction)));
    assert(isFunction(isFunction));
    assert(!isFunction(&isFunction)); // function pointer not allowed

    var x: i32 = 0;
    assert(!isFunction(@typeOf(x))); //have to use typeOf since this is not const or comptime
    assert(!isFunction(@typeOf(@typeOf(x))));
    assert(!isFunction(@typeOf(&x)));

    const y: f32 = 0;
    assert(!isFunction(y));
    assert(!isFunction(&y));

    const A = struct {};
    assert(!isFunction(@typeOf(A)));
    assert(!isFunction(A));

    const B = union {
        x: i32,
    };
    assert(!isFunction(@typeOf(B)));
    assert(!isFunction(B));

    const C = enum {
        OK,
        NOTOK,
    };
    assert(!isFunction(@typeOf(C)));
    assert(!isFunction(C));

    assert(!isFunction(std));
}

test "isFunctionPtr" {
    assert(!isFunctionPtr(@typeOf(isFunction)));
    assert(!isFunctionPtr(isFunction));
    assert(isFunctionPtr(&isFunction));
    assert(isFunctionPtr(@typeOf(&isFunction)));
    assert(isFunctionPtr(@typeOf(&isFunctionPtr)));

    var x: i32 = 0;
    assert(!isFunctionPtr(@typeOf(x))); //have to use typeOf since this is not const or comptime
    assert(!isFunctionPtr(@typeOf(@typeOf(x))));
    assert(!isFunctionPtr(@typeOf(&x)));

    const y: f32 = 0;
    assert(!isFunctionPtr(y));
    assert(!isFunctionPtr(&y));

    const A = struct {};
    assert(!isFunctionPtr(@typeOf(A)));
    assert(!isFunctionPtr(A));

    const B = union {
        x: i32,
    };
    assert(!isFunctionPtr(@typeOf(B)));
    assert(!isFunctionPtr(B));

    const C = enum {
        OK,
        NOTOK,
    };
    assert(!isFunctionPtr(@typeOf(C)));
    assert(!isFunctionPtr(C));

    assert(!isFunctionPtr(std));
}

test "returnOf" {
    // comptime functions are undefined
    assert(returnOf(returnOf) == @typeOf(undefined));
    assert(isUndefined(returnOf(returnOf)));

    const A = fn () i32;
    assert(returnOf(A) == i32);

    assert(returnOf(fn () void) == void);
    assert(isVoid(returnOf(fn () void)));
    assert(isNoReturn(returnOf(fn () noreturn)));
    assert(isOptional(returnOf(fn () ?i32)));
    // assert(isError(returnOf(fn() error)));// is TypeId.Error valid anymore
    assert(returnOf(fn () error!void) == error!void);
    assert(isErrorUnion(returnOf(fn () error!void)));
}

///////////////////// Pointer Utils /////////////////////

pub inline fn isPointer(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Pointer);
}

pub inline fn pointerOf(comptime T: var) type {
    comptime if (!isPointer(T)) @compileError("pointerOf T must be a pointer"); // must be a pointer
    comptime return @typeInfo(asType(T)).Pointer.child;
}

test "isPointer" {
    assert(!isPointer(@typeOf(isFunction)));
    assert(!isPointer(isFunction));
    assert(isPointer(&isFunction));

    var x: i32 = 0;
    assert(!isPointer(@typeOf(x))); //have to use typeOf since this is not const or comptime
    assert(!isPointer(@typeOf(@typeOf(x))));
    assert(isPointer(@typeOf(&x)));

    const y: f32 = 0;
    assert(!isPointer(y));
    assert(isPointer(&y));

    const A = struct {};
    assert(!isPointer(@typeOf(A)));
    assert(!isPointer(A));

    const B = union {
        x: i32,
    };
    assert(!isPointer(@typeOf(B)));
    assert(!isPointer(B));

    const C = enum {
        OK,
        NOTOK,
    };
    assert(!isPointer(@typeOf(C)));
    assert(!isPointer(C));

    assert(!isPointer(std));
}

test "pointerOf" { // TODO: more test cases
    const x: i32 = 0;
    assert(pointerOf(&x) == i32);
    assert(pointerOf(@typeOf(&x)) == i32);
    assert(pointerOf(&pointerOf) == @typeOf(pointerOf));
}

///////////////////// Struct Utils /////////////////////

pub inline fn isStruct(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Struct);
}

pub inline fn isStructPtr(comptime T: var) bool {
    comptime return isPointer(T) and isStruct(pointerOf(T));
}

// Is there a field with this name, TODO: can this also handle unions?
pub inline fn structHasField(comptime T: var, comptime name: []const u8, comptime FT: type) bool {
    comptime if (!isStruct(T) and !isStructPtr(T)) @compileError("structHasField T must be of Struct type"); // must be a struct
    comptime const ST = asType(comptime if (isStructPtr(T)) pointerOf(T) else T); // unwrap the struct pointer

    comptime const fields = @typeInfo(ST).Struct.fields;
    comptime for (fields) |field| {
        comptime if (FT == field.field_type and mem.eql(u8, name, field.name)) return true;
    };
    comptime return false;
}

// Is there a function with this name, TODO: can this also handle unions?
pub inline fn structHasFunction(comptime T: var, comptime name: []const u8, comptime FT: type) bool {
    comptime if (!isStruct(T) and !isStructPtr(T)) @compileError("structHasFunction T must be of Struct type");
    comptime if (!isFunction(FT)) @compileError("structHasFunction FT must be of Function type"); // T must be a struct and FT must be a function
    comptime const ST = asType(comptime if (isStructPtr(T)) pointerOf(T) else T); // unwrap the struct pointer

    comptime const defs = @typeInfo(ST).Struct.defs;
    comptime for (defs) |def| {
        comptime if (def.data == TypeInfo.Definition.Data.Fn and def.data.Fn.fn_type == FT and mem.eql(u8, name, def.name)) return true;
    };
    comptime return false;
}

test "isStruct" {
    assert(!isStruct(@typeOf(isFunction)));
    assert(!isStruct(isFunction));
    assert(!isStruct(&isFunction));
    assert(!isStruct(@typeOf(&isFunction)));
    assert(!isStruct(@typeOf(&isFunctionPtr)));

    var x: i32 = 0;
    assert(!isStruct(@typeOf(x))); //have to use typeOf since this is not const or comptime
    assert(!isStruct(@typeOf(@typeOf(x))));
    assert(!isStruct(@typeOf(&x)));

    const y: f32 = 0;
    assert(!isStruct(y));
    assert(!isStruct(&y));

    const A = struct {};
    assert(isStruct(A));
    var a = A{};
    assert(isStruct(@typeOf(a)));
    const a2 = A{};
    assert(isStruct(a2));
    assert(!isStruct(&a2));

    const B = union {
        x: i32,
    };
    assert(!isStruct(@typeOf(B)));
    assert(!isStruct(B));

    const C = enum {
        OK,
        NOTOK,
    };
    assert(!isStruct(@typeOf(C)));
    assert(!isStruct(C));

    assert(!isStruct(std)); // this maybe true in the future
}

test "isStructPtr" {
    assert(!isStructPtr(@typeOf(isFunction)));
    assert(!isStructPtr(isFunction));
    assert(!isStructPtr(&isFunction));
    assert(!isStructPtr(@typeOf(&isFunction)));
    assert(!isStructPtr(@typeOf(&isFunctionPtr)));

    var x: i32 = 0;
    assert(!isStructPtr(@typeOf(x))); //have to use typeOf since this is not const or comptime
    assert(!isStructPtr(@typeOf(@typeOf(x))));
    assert(!isStructPtr(@typeOf(&x)));

    const y: f32 = 0;
    assert(!isStructPtr(y));
    assert(!isStructPtr(&y));

    const A = struct {};
    assert(!isStructPtr(A));
    var a = A{};
    assert(!isStructPtr(@typeOf(a)));
    assert(isStructPtr(@typeOf(&a)));
    const a2 = A{};
    assert(!isStructPtr(a2));
    assert(isStructPtr(&a2));

    const B = union {
        x: i32,
    };
    assert(!isStructPtr(@typeOf(B)));
    assert(!isStructPtr(B));

    const C = enum {
        OK,
        NOTOK,
    };
    assert(!isStructPtr(@typeOf(C)));
    assert(!isStructPtr(C));

    assert(!isStructPtr(std));
}

test "structHasField" {
    assert(structHasField(struct {
        x: i32,
    }, "x", i32));
    assert(!structHasField(struct {
        x: i32,
    }, "y", i32));
    assert(!structHasField(struct {
        x: i32,
    }, "x", u32));
    assert(structHasField(struct {
        x: i32,
        y: ?f64,
        longer_name: fn () void,
    }, "longer_name", fn () void));
}

test "structHasFunction" {
    assert(structHasFunction(struct {
        fn foo() void {}
    }, "foo", fn () void));
    assert(structHasFunction(struct {
        fn foo(a: f64, b: ?i32) void {}
    }, "foo", fn (f64, ?i32) void));
    assert(!structHasFunction(struct {
        fn foo() void {}
    }, "foo2", fn () void));

    // BUG: uncommenting these last two lines causes the test to not report (not sure if its crashing)
    //std.debug.warn("{}\n", structHasFunction(mem.Allocator, "alloc", fn(*mem.Allocator, var, var) var));
    //assert(structHasFunction(mem.Allocator, "alloc", fn(*mem.Allocator, var, var) var));
}

///////////////////// Array Utils /////////////////////

pub inline fn isStaticArray(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Array);
}

pub inline fn isSlice(comptime T: var) bool {
    comptime return isPointer(T) and @typeInfo(asType(T)).Pointer.size == TypeInfo.Pointer.Size.Slice;
}

pub inline fn isArray(comptime T: var) bool {
    comptime return isStaticArray(T) or isSlice(T);
}

pub inline fn arrayOf(comptime T: var) type {
    comptime if (isStaticArray(T)) {
        return @typeInfo(asType(T)).Array.child;
    } else if (isSlice(T)) {
        return @typeInfo(asType(T)).Pointer.child;
    } else {
        @compileError("arrayOf T must be an array");
    };
}

test "isArray" { // testing still feels flaky
    assert(isArray(""));
    assert(isArray(asType("Hello")));
    assert(!isArray(5));
    assert(isArray("hello"[0..1]));
    assert(isSlice("hello"[0..1]));
    assert(!isSlice(asType([]u8{ 1, 2, 3, 4 })));
    //assert(isStaticArray(asType([]u8{ 1, 2, 3, 4 })));
    assert(isArray([]const i32));
}

test "arrayOf" {
    assert(arrayOf([]const u8) == u8);
    assert(arrayOf("hello"[0..]) == u8);
    assert(arrayOf([]const i32) == i32);
}

pub inline fn isUnion(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Union);
}

pub inline fn isEnum(comptime T: var) bool {
    comptime return isTypeId(T, TypeId.Enum);
}
