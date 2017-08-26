const c = @import("system/c.zig");
const assert = @import("std").debug.assert;

const easing = @import("easing.zig");
const functions = @import("functions.zig");
const geometry = @import("geometry.zig");
const vec = @import("vec.zig");
const mat = @import("mat.zig");
const quat = @import("quat.zig");

// Vectors

pub const Vec2 = vec.Vec2T(f32); 
pub const Vec3 = vec.Vec3T(f32); 
pub const Vec4 = vec.Vec4T(f32);

pub const UVec2 = vec.Vec2T(usize); 
pub const UVec3 = vec.Vec3T(usize); 
pub const UVec4 = vec.Vec4T(usize);

pub fn vec2(x: f32, y: f32) -> Vec2 {
    Vec2 { .x = x, .y = y }
}

pub fn vec3(x: f32, y: f32, z: f32) -> Vec3 {
    Vec3 {.x = x, .y = y, .z = z } 
}

pub fn vec4(x: f32, y: f32, z: f32, w: f32) -> Vec4 {
    Vec4 {.x = x, .y = y, .z = z, .w = w } 
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