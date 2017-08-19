const c = @import("system/c.zig");
const assert = @import("std").debug.assert;

const functions = @import("functions.zig");
const vec = @import("vec.zig");
const mat = @import("mat.zig");
const quat = @import("quat.zig");

// Vectors

pub const Vec2 = vec.Vec2T(f32); 
pub const Vec3 = vec.Vec3T(f32); 
pub const Vec4 = vec.Vec4T(f32);

pub fn vec2(x: f32, y: f32) -> Vec2 {
    Vec2 { .data = []f32 { x, y }}
}

pub fn vec3(x: f32, y: f32, z: f32) -> Vec3 {
    Vec3 { .data = []f32 { x, y, z } }
}

pub fn vec4(x: f32, y: f32, z: f32, w: f32) -> Vec4 {
    Vec4 { .data = []f32 { x, y, z, w } }
}

// Matrices

pub const Mat3 = mat.Mat3T(f32);
pub const Mat4 = mat.Mat4T(f32);

pub fn mat3(diagonal: f32) -> Mat3 {
    Mat3.diagonal(diagonal);
}

pub fn mat4(diagonal: f32) -> Mat4 {
    Mat4.diagonal(diagonal);
}

// Quaternions

pub const Quat = quat.QuatT(f32);