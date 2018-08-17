const std = @import("std");

const Chunk = @import("./chunk.zig").Chunk;
const Value = @import("./value.zig").Value;
const ValueType = @import("./value.zig").ValueType;
const Compiler = @import("./compiler.zig").Compiler;

pub const OpCode = packed enum(u8) {
    // Literals
    Constant, Nil, True, False,
    // Comparisons
    Equal, NotEqual, Greater, Less, GreaterEqual, LessEqual,
    // Arithmetic
    Add, Subtract, Multiply, Divide, Negate,
    // Logic
    Not,
    // Control Flow
    Return
};

pub const VM = struct {
    compiler: Compiler,
    chunk: *Chunk,
    ip: [*]u8,

    stack: std.ArrayList(Value),
    sp: [*]Value,

    pub fn create() VM {
        return VM {
            .compiler = Compiler.create(),
            .chunk = undefined,
            .ip = undefined,
            .stack = std.ArrayList(Value).init(std.debug.global_allocator),
            .sp = undefined,
        };
    }

    fn interpret(self: *VM, source: []const u8) !void {
        var chunk = Chunk.init();
        defer chunk.deinit();

        if (!self.compiler.compile(source, &chunk)) {
            return error.CompileError;
        }

        self.chunk = &chunk;
        self.ip = self.chunk.code.toSlice().ptr;

        try self.run();
    }

    fn interpretChunk(self: *VM, chunk: *Chunk) !void {
        self.chunk = chunk;
        self.ip = self.chunk.code.items.ptr;

        const result = self.run();
        return result;
    }

    fn readByte(self: *VM) u8 {
        const byte = self.ip[0];
        self.ip += 1;
        return byte;
    }

    fn readConstant(self: *VM) Value {
        return self.chunk.constants.at(self.readByte());
    }

    fn push(self: *VM, value: Value) void {
        self.sp[0] = value;
        self.sp += 1;
    }

    fn pop(self: *VM) Value {
        self.sp += 1;
        return self.sp[0];
    }

    fn peek(self: *VM, distance: u32) Value {
        return (self.sp - (distance + 1))[0];
    }

    fn resetStack(self: *VM) void {
        self.sp = self.stack.items.ptr;
    }

    fn runtimeError(self: *VM, format: []const u8, args: ...) void {
        const instruction = @ptrToInt(self.ip) - @ptrToInt(self.chunk.code.items.ptr);
        std.debug.warn("[line {}] in script\n", self.chunk.lines.at(instruction));
        self.resetStack();
    }

    fn printDebug(self: *VM) void {
        std.debug.warn("\t");
        for (self.stack.toSlice()) | s, i | {
            std.debug.warn("[ ");
            s.print();
            std.debug.warn(" ]");
        }
        _ = self.chunk.disassembleInstruction(@ptrToInt(self.ip) - @ptrToInt(self.chunk.code.items.ptr));
    }

    fn binary(self: *VM, value_type: ValueType, operator: []const u8) !void {
        var val: Value = undefined;
        switch (value_type) {
            ValueType.Number => {
                if (self.peek(0) != Value.Number or self.peek(1) != Value.Number) {
                    self.runtimeError("Operands must be numbers");
                    return error.RuntimeError;
                }
                const rhs = self.pop().Number;
                const lhs = self.pop().Number;
                const number = if (std.mem.eql(u8, operator, "+")) (lhs + rhs)
                else if (std.mem.eql(u8, operator, "-")) (lhs - rhs)
                else if (std.mem.eql(u8, operator, "/")) (lhs / rhs)
                else if (std.mem.eql(u8, operator, "*")) (lhs * rhs)
                else unreachable;
                val = Value { .Number = number };
            },
            ValueType.Bool => {
                if (self.peek(0) != Value.Bool or self.peek(1) != Value.Bool) {
                    self.runtimeError("Operands must be boolean");
                    return error.RuntimeError;
                }
                const rhs = self.pop().Bool;
                const lhs = self.pop().Bool;
                const result = if (std.mem.eql(u8, operator, "and")) (lhs and rhs)
                else if (std.mem.eql(u8, operator, "or")) (lhs or rhs)
                else unreachable;
                val = Value { .Bool = result };
            },
            else => unreachable
        }

        val.print();
        std.debug.warn("\n");
        self.push(val);
    }

    fn run(self: *VM) !void {
        while (true) {
            if (true) self.printDebug();
            const instruction = self.readByte();
            switch (instruction) {
                @enumToInt(OpCode.Constant) => {
                    const constant = self.readConstant();
                    constant.print();
                    std.debug.warn("\n");
                },
                @enumToInt(OpCode.Nil) => self.push(Value.Nil),
                @enumToInt(OpCode.True) => self.push(Value {.Bool = true}),
                @enumToInt(OpCode.False) => self.push(Value {.Bool = false}),
                @enumToInt(OpCode.Equal) => {
                    const b = self.pop();
                    const a = self.pop();
                    self.push(Value { .Bool = a.equals(b) });
                },
                @enumToInt(OpCode.Greater) => try self.binary(Value.Number, ">"),
                @enumToInt(OpCode.Less) => try self.binary(Value.Number, "<"),
                @enumToInt(OpCode.Add) => try self.binary(Value.Number, "+"),
                @enumToInt(OpCode.Subtract) => try self.binary(Value.Number, "-"),
                @enumToInt(OpCode.Multiply) => try self.binary(Value.Number, "*"),
                @enumToInt(OpCode.Divide) => try self.binary(Value.Number, "/"),
                @enumToInt(OpCode.Not) => self.push(Value { .Bool = !self.pop().isTruthy() }),
                @enumToInt(OpCode.Negate) => {
                    switch(self.peek(0)) {
                        // TODO: Peek vs pop. push if error?
                        ValueType.Number => |x| {
                            const number = self.pop().Number;
                            self.push(Value { .Number = -number });
                        },
                        else => {
                            self.runtimeError("Operand must be a number.");
                            return error.RuntimeError;
                        }
                    }
                },
                @enumToInt(OpCode.Return) => {
                    const value = self.pop();
                    value.print();
                    std.debug.warn("\n");
                    return;
                },
                else => {
                    std.debug.warn("Unknown instruction");
                    return error.CompileError;
                }
            }
        }
    }

    pub fn destroy(self: *VM) void {
        self.stack.deinit();
    }
};
