const std = @import("std");
const allocator = std.debug.global_allocator;

const Obj = @import("object.zig").Obj;

pub const ValueType = enum {
  Bool,
  Number,
  Obj,
  Nil,
};

pub const Value = union(ValueType) {
    Bool: bool,
    Number: f64,
    Obj: *Obj,
    Nil,

    fn toString(value: Value) void {
      switch (value) {
        .Bool => |b| std.debug.warn("{}", b),
        .Number => |d| std.debug.warn("{}", d),
        .Obj => |d| std.debug.warn("{}", d),
        .Nil => std.debug.warn("nil")
      }
    }

    fn print(value: Value) void {
      switch (value) {
        .Bool => |b| std.debug.warn("{}", b),
        .Number => |d| std.debug.warn("{}", d),
        .Obj => |o| o.print(),
        .Nil => std.debug.warn("nil")
      }
    }

    fn printLine(value: Value) void {
      print(value);
      std.debug.warn("\n");
    }

    fn equals(a: Value, b: Value) bool {
      if (ValueType(a) != ValueType(b)) return false;
      switch (a) {
        .Bool => return a.Bool == b.Bool,
        .Number => return a.Number == b.Number,
        .Nil => return true,
        .Obj => |o| switch (o.data) {
          .String => return std.mem.eql(u8, a.Obj.data.String.bytes, b.Obj.data.String.bytes),
          else => unreachable,
        },
      }
    }

    fn isTruthy(value: Value) bool {
      switch (value) {
        .Nil => return false,
        .Bool => |b| return b,
        .Number => |n| return true,
        .Obj => |o| return true, 
      }
    }

    fn isNumber(value: Value) bool {
      return ValueType(value) == ValueType.Number;
    }

    fn isBool(value: Value) bool {
      return ValueType(value) == ValueType.Bool;
    }

    fn isNil(value: Value) bool {
      return ValueType(value) == ValueType.Nil;
    }

    fn isObject(value: Value) bool {
      return ValueType(value) == ValueType.Nil;
    }
};