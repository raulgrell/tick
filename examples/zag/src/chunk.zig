const std = @import("std");

const Value = @import("./value.zig").Value;
const OpCode = @import("./vm.zig").OpCode;

pub const Chunk = struct {
    code: std.ArrayList(u8),
    lines: std.ArrayList(usize),
    constants: std.ArrayList(Value),

    pub fn init() Chunk {
        return Chunk {
            .code = std.ArrayList(u8).init(std.debug.global_allocator),
            .lines = std.ArrayList(usize).init(std.debug.global_allocator),
            .constants = std.ArrayList(Value).init(std.debug.global_allocator),
        };
    }

    pub fn deinit(self: *Chunk) void {
        self.code.deinit();
        self.lines.deinit();
        self.constants.deinit();
    }

    pub fn destroy(self: *Chunk) void {
        self.code.len = 0;
        self.constants.len = 0;
        self.lines.len = 0;
    }

    pub fn addConstant(self: *Chunk, value: Value) u8 {
        self.constants.append(value) catch unreachable;
        return @intCast(u8, self.constants.len - 1);
    }

    pub fn write(self: *Chunk, byte: u8, line: usize) !void {
        try self.code.append(byte);
        try self.lines.append(line);
    }

    pub fn disassemble(chunk: *Chunk, name: []const u8) void {
        std.debug.warn("== {} ==\n", name);
        var i = usize(0);
        while (i < chunk.code.len) {
            i = disassembleInstruction(chunk, i);
        }
    }

   fn disassembleInstruction(chunk: *Chunk, offset: usize) usize {
        std.debug.warn("{} | ", offset);

        const instruction = chunk.code.at(offset);
        switch (instruction) {
            @enumToInt(OpCode.Constant) => return constantInstruction("Constant", chunk, offset),
            @enumToInt(OpCode.Nil) => return simpleInstruction("Nil", offset),
            @enumToInt(OpCode.True) => return simpleInstruction("True", offset),
            @enumToInt(OpCode.False) => return simpleInstruction("False", offset),
            @enumToInt(OpCode.Pop) => return simpleInstruction("Pop", offset), 
                case OP_DEFINE_GLOBAL:                                          
      return constantInstruction("OP_DEFINE_GLOBAL", chunk, offset);
                case OP_GET_GLOBAL:                                          
      return constantInstruction("OP_GET_GLOBAL", chunk, offset);
    case OP_SET_GLOBAL:                                             
      return constantInstruction("OP_SET_GLOBAL", chunk, offset); 
            @enumToInt(OpCode.Equal) => return simpleInstruction("Equal", offset),
            @enumToInt(OpCode.Greater) => return simpleInstruction("Greater", offset),
            @enumToInt(OpCode.Less) => return simpleInstruction("Less", offset),
            @enumToInt(OpCode.Add) => return simpleInstruction("Add", offset),
            @enumToInt(OpCode.Subtract) => return simpleInstruction("Subtract", offset),
            @enumToInt(OpCode.Multiply) => return simpleInstruction("Multiply", offset),
            @enumToInt(OpCode.Divide) => return simpleInstruction("Divide", offset),
            @enumToInt(OpCode.Not) => return simpleInstruction("Not", offset),
            @enumToInt(OpCode.Negate) => return simpleInstruction("Negate", offset),
            @enumToInt(OpCode.Print) => return simpleInstruction("Print", offset),
            @enumToInt(OpCode.Return) => return simpleInstruction("Return", offset), 
            else => {
                std.debug.warn("Unknown opcode: {}\n", instruction);
                return offset + 1;
            }
        }
    }

    fn constantInstruction(name: []const u8, chunk: *Chunk, offset: usize) usize {
        const constant = chunk.code.at(offset + 1);
        std.debug.warn("{} {} : ", name, constant);
        chunk.constants.at(constant).print();
        std.debug.warn("\n");
        return offset + 2;
    }

    fn simpleInstruction(name: []const u8, offset: usize) usize {
        std.debug.warn("{}\n", name);
        return offset + 1;
    }
};