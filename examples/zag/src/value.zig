const std = @import("std");

pub const ValueType = enum {
  Bool,
  Number,
  Obj
  Nil,
};

pub const Value = union(ValueType) {
    Bool: bool,
    Number: f64,
    Obj: *Obj

    Nil,

    fn toString(value: Value) void {
      switch (value) {
        Value.Bool => |b| std.debug.warn("{}", b),
        Value.Number => |d| std.debug.warn("{}", d),
        Value.Obj => |d| std.debug.warn("{}", d),
        Value.Nil => std.debug.warn("nil")
      }
    }
    
    fn print(value: Value) void {
      switch (value) {
        Value.Bool => |b| std.debug.warn("{}", b),
        Value.Number => |d| std.debug.warn("{}", d),
        Value.Nil => std.debug.warn("nil")
      }
    }

    fn printLine(value: Value) void {
      print(value);
      std.debug.warn("\n");
    }

    fn equals(a: Value, b: Value) bool {
      if (ValueType(a) != ValueType(b)) return false;
      switch (a) {
        Value.Bool => return a.Bool == b.Bool,
        Value.Number => return a.Number == b.Number,
        Value.Nil => return true
      }
    }

    fn isTruthy(value: Value) bool {
      switch (value) {
        Value.Nil => return false,
        Value.Bool => |b| return b,
        Value.Number => |n| return false
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