const std = @import("std");
const allocator = std.debug.global_allocator;

const Chunk = @import("./chunk.zig").Chunk;
const Value = @import("./value.zig").Value;
const ValueType = @import("./value.zig").ValueType;
const Compiler = @import("./compiler.zig").Compiler;
const Obj = @import("./object.zig").Obj;
const ObjString = @import("./object.zig").ObjString;

pub const OpCode = packed enum(u8) {
    // Literals
    Constant, Nil, True, False,
    // Comparisons
    Equal, NotEqual, Greater, Less, GreaterEqual, LessEqual,
    // Arithmetic
    Add, Subtract, Multiply, Divide, Negate,
    // Logic
    Not, And, Or,
    // Builtin
    Print, Pop, DefineGlobal, GetGlobal, SetGlobal,
    // Control Flow
    Return
};

pub const VM = struct {
    compiler: Compiler,
    chunk: *Chunk,
    ip: [*]u8,

    stack: std.ArrayList(Value),
    sp: [*]Value,

    strings: std.HashMap([]const u8, *ObjString),
    globals: std.HashMap([]const u8, *Obj),
    objects: ?*Obj,

    pub fn create() VM {
        return VM {
            .compiler = Compiler.create(),
            .chunk = undefined,
            .ip = undefined,
            .stack = std.ArrayList(Value).init(allocator),
            .sp = undefined,
            .strings = std.HashMap([]const u8, ObjString).init(allocator),
            .objects = null,
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

    fn readInstruction(self: *VM) OpCode {
        return @intToEnum(OpCode, self.readByte());
    }

    fn readConstant(self: *VM) Value {
        return self.chunk.constants.at(self.readByte());
    }

    fn readString(self: *VM) Value {
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

    fn binary(self: *VM, value_type: ValueType, operator: OpCode) !void {
        var val: Value = undefined;
        switch (value_type) {
            ValueType.Number => {
                if (self.peek(0) != Value.Number or self.peek(1) != Value.Number) {
                    self.runtimeError("Operands must be numbers");
                    return error.RuntimeError;
                }
                const rhs = self.pop().Number;
                const lhs = self.pop().Number;
                const number = switch (operator) {
                    .Add => lhs + rhs,
                    .Subtract => lhs - rhs,
                    .Multiply => lhs * rhs,
                    .Divide => lhs / rhs,
                    else => unreachable,
                };
                val = Value { .Number = number };
            },
            ValueType.Bool => {
                if (self.peek(0) != Value.Bool or self.peek(1) != Value.Bool) {
                    self.runtimeError("Operands must be boolean");
                    return error.RuntimeError;
                }
                const rhs = self.pop().Bool;
                const lhs = self.pop().Bool;
                const result = switch (operator) {
                    .And => lhs and rhs,
                    .Or => lhs or rhs,
                };
                val = Value { .Bool = result };
            },
            else => unreachable
        }

        val.print();
        std.debug.warn("\n");
        self.push(val);
    }

    fn concatenate(self: *VM) !void {
        const b = self.pop().String;
        const a = self.pop().String;

        const length = a.bytes.len + b.bytes.len;
        var bytes = try allocator.allocate(u8, length);
        std.mem.copy(u8, bytes[0..a.len], a);
        std.mem.copy(u8, bytes[a.len..], b);

        const result = try ObjString.take(bytes);
        self.push(result.Value);
    }

    fn run(self: *VM) !void {
        while (true) {
            if (true) self.printDebug();
            // const instruction = self.readByte();
            const instruction = self.readInstruction();
            switch (instruction) {
                OpCode.Constant => {
                    const constant = self.readConstant();
                    constant.print();
                    std.debug.warn("\n");
                },
                OpCode.Nil => self.push(Value.Nil),
                OpCode.True => self.push(Value {.Bool = true}),
                OpCode.False => self.push(Value {.Bool = false}),
                OpCode.Pop => self.pop();
                OpCode.DefineGlobal: {
                    const name = self.readString();
                    tableSet(&vm.globals, name, peek(0));
                    pop();
                    break;
                }

                OpCode.GetGlobal: {
                    const name = self.readString();
                    Value value;
                    if (!tableGet(&vm.globals, name, &value)) {
                    runtimeError("Undefined variable '%s'.", name->chars);
                    return INTERPRET_RUNTIME_ERROR;
                    }
                    push(value);
                    break;
                }
                OpCode.SetGlobal: {
                    const name = self.readString();
                    if (tableSet(&vm.globals, name, peek(0))) {
                    runtimeError("Undefined variable '%s'.", name->chars);
                    return INTERPRET_RUNTIME_ERROR;
                    }
                    break;
                }
                OpCode.Equal => {
                    const b = self.pop();
                    const a = self.pop();
                    self.push(Value { .Bool = a.equals(b) });
                },
                OpCode.Add => {
                    const a = self.peek(0);
                    const b = self.peek(1);
                    switch(a) {
                        .Obj => |o| {
                            switch(o.obj_type) {
                                .String => try self.concatenate(),
                                else => unreachable,
                            }
                        },
                        .Number => {
                            try self.binary(Value.Number, instruction);
                        },
                        else => unreachable,
                    }
                },
                OpCode.Subtract,
                OpCode.Multiply,
                OpCode.Divide,
                OpCode.Greater,
                OpCode.Less => try self.binary(Value.Number, instruction),
                OpCode.Not => self.push(Value { .Bool = !self.pop().isTruthy() }),
                OpCode.Negate => {
                    switch(self.peek(0)) {
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
                OpCode.Print => {
                    printValue(self.pop());
                    std.debug.warn("\n");
                },
                OpCode.Return => {
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
        self.freeObjects();
    }
};
