use @cImport({
    // C
    @cInclude("math.h");
    @cInclude("stdlib.h");
    @cInclude("stdio.h");
    // Linux
    @cInclude("unistd.h");
    @cInclude("sys/types.h");
    @cInclude("sys/stat.h");
    @cInclude("dlfcn.h");
    // Libs
    @cInclude("png.h");
    @cInclude("epoxy/gl.h");
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

fn libcAlloc(self: &lib_mem.Allocator, size: usize, alignment: u8) -> %[]u8 {
    return @ptrCast(&u8, malloc(size_t(size)) ?? return error.NoMem)[0..size];
}

fn libcRealloc(self: &lib_mem.Allocator, old_mem: []u8, new_size: usize, alignment: u8) -> %[]u8 {
    return @ptrCast(&u8, realloc(@ptrCast(&c_void, old_mem.ptr), size_t(new_size)) ?? return error.NoMem)[0..new_size];
}

fn libcFree(self: &lib_mem.Allocator, old_mem: []u8) -> void {
    free(@ptrCast(&c_void, &old_mem[0]));
}

pub fn getFileSize(path: []const u8) -> usize {
}

pub fn fileExists(path: []const u8) -> bool {
}

pub fn readFile(path: []const u8) -> []const u8 {
}

pub fn readFileIntoBuffer(path: []const u8, buffer: []u8) -> bool {
}

pub fn readTextFile(path: []const u8) -> [][]const u8 {
}

pub fn writeFile(path: []const u8, buffer: []u8) -> bool {
}

pub fn writeTextFile(path: []const u8, text: []const u8) -> bool {
}