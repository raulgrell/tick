pub use @cImport({
    // C
    @cInclude("math.h");
    @cInclude("stdlib.h");
    @cInclude("stdio.h");
    @cInclude("stdint.h");

    // Linux
    // @cInclude("unistd.h");
    // @cInclude("sys/types.h");
    // @cInclude("sys/stat.h");
    // @cInclude("dlfcn.h");

    // Libs
    @cInclude("glad/glad.h");
    @cInclude("png.h");
    @cInclude("GLFW/glfw3.h");
    @cInclude("soundio/soundio.h");
});

const lib_mem = @import("lib").mem;

error NoMem;

pub var mem = lib_mem.Allocator {
    .allocFn = libcAlloc,
    .reallocFn = libcRealloc,
    .freeFn = libcFree,
};

fn libcAlloc(self: &lib_mem.Allocator, size: usize, alignment: usize) %[]u8 {
    const allocated_memory = malloc(size) ?? return error.NoMem;
    const aligned_memory = @alignCast(8, allocated_memory);
    return @ptrCast(&u8, aligned_memory)[0..size];
}

fn libcRealloc(self: &lib_mem.Allocator, old_mem: []u8, new_size: usize, alignment: usize) %[]u8 {
    const reallocated_memory = realloc(@ptrCast(&c_void, old_mem.ptr), new_size) ?? return error.NoMem;
    const aligned_memory = @alignCast(8, reallocated_memory);
    return @ptrCast(&u8, aligned_memory)[0..new_size];
}

fn libcFree(self: &lib_mem.Allocator, ptr: &u8) void {
    free(@ptrCast(&c_void, ptr));
}

pub fn getFileSize(path: []const u8)usize {
}

pub fn fileExists(path: []const u8)bool {
}

pub fn readFile(path: []const u8)[]const u8 {
}

pub fn readFileIntoBuffer(path: []const u8, buffer: []u8)bool {
}

pub fn readTextFile(path: []const u8)[][]const u8 {
}

pub fn writeFile(path: []const u8, buffer: []u8)bool {
}

pub fn writeTextFile(path: []const u8, text: []const u8)bool {
}