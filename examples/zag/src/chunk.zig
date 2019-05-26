const std = @import("std");

const Value = @import("./value.zig").Value;
const OpCode = @import("./vm.zig").OpCode;

const allocator = std.debug.global_allocator;

pub const Chunk = struct {
    code: std.ArrayList(u8),
    lines: std.ArrayList(usize),
    constants: std.ArrayList(Value),

    pub fn init() Chunk {
        return Chunk {
            .code = std.ArrayList(u8).init(allocator),
            .lines = std.ArrayList(usize).init(allocator),
            .constants = std.ArrayList(Value).init(allocator),
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

    fn instructionAt(chunk: *Chunk, offset: usize) OpCode {
        return @intToEnum(OpCode, chunk.code.at(offset));
    }

   fn disassembleInstruction(chunk: *Chunk, offset: usize) usize {
        std.debug.warn("{} | ", offset);

        const instruction = chunk.instructionAt(offset);
        switch (instruction) {
            OpCode.Constant => return constantInstruction("Constant", chunk, offset),
            OpCode.Nil => return simpleInstruction("Nil", offset),
            OpCode.True => return simpleInstruction("True", offset),
            OpCode.False => return simpleInstruction("False", offset),
            OpCode.Pop => return simpleInstruction("Pop", offset),
            OpCode.GetLocal => return byteInstruction("GetLocal", chunk, offset),
            OpCode.SetLocal => return byteInstruction("SetLocal", chunk, offset),
            OpCode.DefineGlobal => return constantInstruction("DefineGlobal", chunk, offset),
            OpCode.GetGlobal => return constantInstruction("GetGlobal", chunk, offset),
            OpCode.SetGlobal => return constantInstruction("SetGlobal", chunk, offset),
            OpCode.Equal => return simpleInstruction("Equal", offset),
            OpCode.Greater => return simpleInstruction("Greater", offset),
            OpCode.Less => return simpleInstruction("Less", offset),
            OpCode.Add => return simpleInstruction("Add", offset),
            OpCode.Subtract => return simpleInstruction("Subtract", offset),
            OpCode.Multiply => return simpleInstruction("Multiply", offset),
            OpCode.Divide => return simpleInstruction("Divide", offset),
            OpCode.Not => return simpleInstruction("Not", offset),
            OpCode.Negate => return simpleInstruction("Negate", offset),
            OpCode.Print => return simpleInstruction("Print", offset),
            OpCode.JumpIfFalse => return jumpInstruction("JumpIfFalse", 1, chunk, offset),
            OpCode.Jump => return jumpInstruction("Jump", 1, chunk, offset),
            OpCode.Loop => return jumpInstruction("Loop", -1, chunk, offset),
            OpCode.Return => return simpleInstruction("Return", offset),
            else => {
                std.debug.warn("Unknown opcode: {}\n", instruction);
                return offset + 1;
            }
        }
    }

    fn jumpInstruction(name: []const u8, sign: i32, chunk: *Chunk, offset: usize) usize {
        var jump = @intCast(i16, chunk.code.at(offset + 1)) << 8;
        jump |= @intCast(i16, chunk.code.at(offset + 2));
        std.debug.warn("{}: {} -> {}\n", name, offset, @intCast(i16, offset + 3) + sign * jump);
        return offset + 3;
    }

    fn byteInstruction(name: []const u8, chunk: *Chunk, offset: usize) usize {
        const slot = chunk.code.at(offset + 1);
        std.debug.warn("{}: {}\n", slot, name);
        return offset + 2;
    }

    fn constantInstruction(name: []const u8, chunk: *Chunk, offset: usize) usize {
        const constant = chunk.code.at(offset + 1);
        std.debug.warn("{} {}: ", name, constant);
        chunk.constants.at(constant).print();
        std.debug.warn("\n");
        return offset + 2;
    }

    fn simpleInstruction(name: []const u8, offset: usize) usize {
        std.debug.warn("{}\n", name);
        return offset + 1;
    }
};