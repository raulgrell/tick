const std = @import("std");
const allocator = std.debug.global_allocator;

const Chunk = @import("./chunk.zig").Chunk;
const Value = @import("./value.zig").Value;
const ValueType = @import("./value.zig").ValueType;
const Instance = @import("./compiler.zig").Instance;
const Compiler = @import("./compiler.zig").Compiler;
const Obj = @import("./object.zig").Obj;
const ObjString = @import("./object.zig").ObjString;

const verbose = false;

pub const OpCode = enum(u8) {
    // Literals
    Constant, Nil, True, False,
    // Comparisons
    Equal, NotEqual, Greater, Less, GreaterEqual, LessEqual,
    // Arithmetic
    Add, Subtract, Multiply, Divide, Negate,
    // Logic
    Not, And, Or,
    // Builtin
    Print, Pop, GetLocal, SetLocal, DefineGlobal, GetGlobal, SetGlobal,
    // Control Flow
    JumpIfFalse, Jump, Loop, Return
};

pub const VM = struct {
    instance: Instance,
    chunk: *Chunk,
    ip: [*]u8,
    stack: std.ArrayList(Value),
    strings: std.HashMap([]const u8, *Obj, ObjString.hashFn, ObjString.eqlFn),
    globals: std.HashMap([]const u8, Value, ObjString.hashFn, ObjString.eqlFn),
    objects: ?*Obj,

    pub fn create(compiler: *Compiler) VM {
        return VM {
            .instance = Instance.create(compiler),
            .chunk = undefined,
            .ip = undefined,
            .stack = std.ArrayList(Value).init(allocator),
            .strings = std.HashMap([]const u8, *Obj, ObjString.hashFn, ObjString.eqlFn).init(allocator),
            .globals = std.HashMap([]const u8, Value, ObjString.hashFn, ObjString.eqlFn).init(allocator),
            .objects = null,
        };
    }

    fn interpret(self: *VM, source: []const u8) !void {
        var chunk = Chunk.init();
        defer chunk.deinit();

        try self.instance.compile(source, &chunk);

        self.chunk = &chunk;
        self.ip = self.chunk.code.items.ptr;
        self.resetStack();

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

    fn readShort(self: *VM) u16 {
        const short = @intCast(u16, self.ip[0]) << 8 | self.ip[1];
        self.ip += 2;
        return short;
    }

    fn readConstant(self: *VM) Value {
        return self.chunk.constants.at(self.readByte());
    }

    fn readString(self: *VM) ObjString {
        return self.readConstant().Obj.data.String;
    }

    fn push(self: *VM, value: Value) void {
        self.stack.append(value) catch unreachable;
    }

    fn pop(self: *VM) Value {
        return self.stack.pop();
    }

    fn peek(self: *VM, distance: u32) Value {
        return self.stack.at(self.stack.len - 1 - distance);
    }

    fn resetStack(self: *VM) void {
        self.stack.resize(0) catch unreachable;
    }

    fn runtimeError(self: *VM, format: []const u8, args: ...) void {
        const instruction = @ptrToInt(self.ip) - @ptrToInt(self.chunk.code.items.ptr);
        std.debug.warn("[line {}] in script\n", self.chunk.lines.at(instruction));
        self.resetStack();
    }

    fn printDebug(self: *VM) void {
        std.debug.warn("\n");
        for (self.stack.toSlice()) | s, i | {
            std.debug.warn("[{}]\n", s.toString());
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
                
                switch (operator) {
                    .Add, .Subtract, .Multiply, .Divide => {
                        const number = switch (operator) {
                            .Add => lhs + rhs,
                            .Subtract => lhs - rhs,
                            .Multiply => lhs * rhs,
                            .Divide => lhs / rhs,
                            else => unreachable,
                        };
                        val = Value { .Number = number };
                    },
                    .Less, .LessEqual, .Greater, .GreaterEqual => {
                        const result = switch ( operator) {
                            .Less => lhs < rhs,
                            .LessEqual => lhs <= rhs,
                            .Greater => lhs > rhs,
                            .GreaterEqual => lhs >= rhs,
                            else => unreachable,
                        };
                        val = Value { .Bool = result };
                    },
                    else => unreachable,
                }
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
                    else => unreachable,
                };
                val = Value { .Bool = result };
            },
            else => unreachable
        }

        self.push(val);
    }

    fn concatenate(self: *VM) !void {
        const b = self.pop().Obj.data.String;
        const a = self.pop().Obj.data.String;

        const length = a.bytes.len + b.bytes.len;
        var bytes = try allocator.alloc(u8, length);
        std.mem.copy(u8, bytes[0..a.bytes.len], a.bytes);
        std.mem.copy(u8, bytes[a.bytes.len..], b.bytes);

        const result = ObjString.take(bytes);
        self.push(result.value());
    }

    fn run(self: *VM) !void {
        while (true) {
            if (verbose) self.printDebug();
                const instruction = @intToEnum(OpCode, self.readByte());
            switch (instruction) {
                OpCode.Constant => {
                    const constant = self.readConstant();
                    self.push(constant);
                },
                OpCode.Nil => self.push(Value.Nil),
                OpCode.True => self.push(Value {.Bool = true}),
                OpCode.False => self.push(Value {.Bool = false}),
                OpCode.Pop => _ = self.pop(),
                OpCode.GetLocal => {
                    const slot = self.readByte();
                    self.push(self.stack.at(slot));
                },
                OpCode.SetLocal => {
                    const slot = self.readByte();
                    self.stack.items[slot] = self.peek(0);
                },
                OpCode.DefineGlobal => {
                    const name = self.readString();
                    const value = self.peek(0);
                    _ = try self.globals.put(name.bytes, value);
                    const popped = self.pop();
                },
                OpCode.GetGlobal => {
                    const name = self.readString();
                    var value = self.globals.get(name.bytes) orelse {
                        self.runtimeError("Undefined variable '{}'.", name.bytes);
                        return error.RuntimeError;
                    };
                    self.push(value.value);
                },
                OpCode.SetGlobal => {
                    const name = self.readString();
                    const value = self.peek(0);
                    _ = self.globals.put(name.bytes, value) catch {
                        self.runtimeError("Undefined variable '{}'.", name.bytes);
                        return error.RuntimeError;
                    };
                },
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
                            switch (o.data) {
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
                        .Number => |x| {
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
                    const val = self.pop();
                    val.print();
                    std.debug.warn("\n");
                },
                OpCode.JumpIfFalse => {
                    const offset = self.readShort();
                    if (!self.peek(0).isTruthy()) self.ip += offset;
                },
                OpCode.Jump => {
                    const offset = self.readShort();
                    self.ip += offset;
                },
                OpCode.Loop => {
                    const offset = self.readShort();
                    self.ip -= offset;
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

    pub fn freeObjects(self: *VM) void {
        var object =  self.objects;
        while (object) |o| {
            const next = o.next;
            Obj.free(o);
            object = next;
        }
    }

    pub fn destroy(self: *VM) void {
        self.stack.deinit();
        self.freeObjects();
    }
};
