const std = @import("std");
const allocator = std.debug.global_allocator;

const VM = @import("vm.zig").VM;
const Value = @import("value.zig").Value;

extern var vm: *VM;

pub const ObjType = enum {
    String
};

pub const ObjString = struct {
    bytes: []const u8,
    hash: u32,

    pub fn copy(bytes: []const u8) *Obj {
        const hash = hashFn(bytes);
        const heapChars = allocator.alloc(u8, bytes.len) catch unreachable;
        std.mem.copy(u8, heapChars, bytes);

        return allocate(heapChars, hash);
    }

    pub fn take(bytes: []const u8) *Obj {
        const hash = hashFn(bytes);
        return allocate(bytes, hash);
    }

    pub fn allocate(bytes: []const u8, hash: u32) *Obj {
        const string = Obj.allocate();
        string.data = Obj.Data { 
            .String = ObjString {
                .bytes = bytes, 
                .hash = hash
            }
        };
        return string;
    }

    pub fn eqlFn(a: []const u8, b: []const u8) bool {
        return std.mem.eql(u8, a, b);
    }

    pub fn hashFn(key: []const u8) u32 {
        var hash: u32 = 2166136261;
        var i: u32 = 0;
        while(i < key.len) : (i += 1) {
            hash ^= key[i];
            hash *%= 16777619;
        }
        return hash;
    }
};

pub const Obj = struct {
    data: Data,
    next: ?*Obj,

    pub const Data = union(ObjType) {
        String: ObjString,
    };

    pub fn value(self: *Obj) Value {
        return Value { .Obj = self };
    }

    pub fn toString(self: Obj) []const u8 {
        switch(self.data) {
            .String => |s| return s.bytes,
        }
    }

    fn print(self: Obj) void {
        switch(self.data) {
            .String => |s| std.debug.warn("{}", s.bytes),
        }
    }

    fn equal(self: *Obj, other: *Obj) bool {
        switch(self.data) {
            .String => |s| return std.mem.eql(u8, self.data.String.bytes, other.data.String.bytes),
        }
    }
    
    fn allocate() *Obj {
        var object = allocator.create(Obj) catch unreachable;
        object.* = Obj {
            .data = undefined,
            .next = vm.objects,
        };
        vm.objects = object;
        return object;
    }

    pub fn free(self: *Obj) void {
        switch (self.data) {
            .String => |s| {
                allocator.free(s.bytes);
                allocator.destroy(self);
            }
        }
    }
};


