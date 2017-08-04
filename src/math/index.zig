const c = @import("system/c.zig");
const assert = @import("std").debug.assert;

pub const Mat4x4 = struct {
    data: [4][4]f32,

    pub fn mult(m: &const Mat4x4, o: &const Mat4x4) -> Mat4x4 {
        Mat4x4 {
            .data = [][4]f32{
                []f32{
                    m.data[0][0]*o.data[0][0] + m.data[0][1]*o.data[1][0] + m.data[0][2]*o.data[2][0] + m.data[0][3]*o.data[3][0],
                    m.data[0][0]*o.data[0][1] + m.data[0][1]*o.data[1][1] + m.data[0][2]*o.data[2][1] + m.data[0][3]*o.data[3][1],
                    m.data[0][0]*o.data[0][2] + m.data[0][1]*o.data[1][2] + m.data[0][2]*o.data[2][2] + m.data[0][3]*o.data[3][2],
                    m.data[0][0]*o.data[0][3] + m.data[0][1]*o.data[1][3] + m.data[0][2]*o.data[2][3] + m.data[0][3]*o.data[3][3],
                },
                []f32{
                    m.data[1][0]*o.data[0][0] + m.data[1][1]*o.data[1][0] + m.data[1][2]*o.data[2][0] + m.data[1][3]*o.data[3][0],
                    m.data[1][0]*o.data[0][1] + m.data[1][1]*o.data[1][1] + m.data[1][2]*o.data[2][1] + m.data[1][3]*o.data[3][1],
                    m.data[1][0]*o.data[0][2] + m.data[1][1]*o.data[1][2] + m.data[1][2]*o.data[2][2] + m.data[1][3]*o.data[3][2],
                    m.data[1][0]*o.data[0][3] + m.data[1][1]*o.data[1][3] + m.data[1][2]*o.data[2][3] + m.data[1][3]*o.data[3][3],
                },
                []f32{
                    m.data[2][0]*o.data[0][0] + m.data[2][1]*o.data[1][0] + m.data[2][2]*o.data[2][0] + m.data[2][3]*o.data[3][0],
                    m.data[2][0]*o.data[0][1] + m.data[2][1]*o.data[1][1] + m.data[2][2]*o.data[2][1] + m.data[2][3]*o.data[3][1],
                    m.data[2][0]*o.data[0][2] + m.data[2][1]*o.data[1][2] + m.data[2][2]*o.data[2][2] + m.data[2][3]*o.data[3][2],
                    m.data[2][0]*o.data[0][3] + m.data[2][1]*o.data[1][3] + m.data[2][2]*o.data[2][3] + m.data[2][3]*o.data[3][3],
                },
                []f32{
                    m.data[3][0]*o.data[0][0] + m.data[3][1]*o.data[1][0] + m.data[3][2]*o.data[2][0] + m.data[3][3]*o.data[3][0],
                    m.data[3][0]*o.data[0][1] + m.data[3][1]*o.data[1][1] + m.data[3][2]*o.data[2][1] + m.data[3][3]*o.data[3][1],
                    m.data[3][0]*o.data[0][2] + m.data[3][1]*o.data[1][2] + m.data[3][2]*o.data[2][2] + m.data[3][3]*o.data[3][2],
                    m.data[3][0]*o.data[0][3] + m.data[3][1]*o.data[1][3] + m.data[3][2]*o.data[2][3] + m.data[3][3]*o.data[3][3],
                },
            },
        }
    }

    pub fn rotate(m: &const Mat4x4, angle: f32, axis_unnormalized: Vec3) -> Mat4x4 {
        const cos = c.cosf(angle);
        const s = c.sinf(angle);
        const axis = axis_unnormalized.normalize();
        const temp = axis.scale(1.0 - cos);

        const rot = Mat4x4 {
            .data = [][4]f32 {
                []f32{cos + temp.data[0] * axis.data[0], 0.0 + temp.data[1] * axis.data[0] - s * axis.data[2], 0.0 + temp.data[2] * axis.data[0] + s * axis.data[1], 0.0},
                []f32{0.0 + temp.data[0] * axis.data[1] + s * axis.data[2], cos + temp.data[1] * axis.data[1], 0.0 + temp.data[2] * axis.data[1] - s * axis.data[0], 0.0},
                []f32{0.0 + temp.data[0] * axis.data[2] - s * axis.data[1], 0.0 + temp.data[1] * axis.data[2] + s * axis.data[0], cos + temp.data[2] * axis.data[2], 0.0},
                []f32{0.0, 0.0, 0.0, 0.0},
            },
        };

        Mat4x4 {
            .data = [][4]f32 {
                []f32 {
                    m.data[0][0] * rot.data[0][0] + m.data[0][1] * rot.data[1][0] + m.data[0][2] * rot.data[2][0],
                    m.data[0][0] * rot.data[0][1] + m.data[0][1] * rot.data[1][1] + m.data[0][2] * rot.data[2][1],
                    m.data[0][0] * rot.data[0][2] + m.data[0][1] * rot.data[1][2] + m.data[0][2] * rot.data[2][2],
                    m.data[0][3]
                },
                []f32 {
                    m.data[1][0] * rot.data[0][0] + m.data[1][1] * rot.data[1][0] + m.data[1][2] * rot.data[2][0],
                    m.data[1][0] * rot.data[0][1] + m.data[1][1] * rot.data[1][1] + m.data[1][2] * rot.data[2][1],
                    m.data[1][0] * rot.data[0][2] + m.data[1][1] * rot.data[1][2] + m.data[1][2] * rot.data[2][2],
                    m.data[1][3]
                },
                []f32 {
                    m.data[2][0] * rot.data[0][0] + m.data[2][1] * rot.data[1][0] + m.data[2][2] * rot.data[2][0],
                    m.data[2][0] * rot.data[0][1] + m.data[2][1] * rot.data[1][1] + m.data[2][2] * rot.data[2][1],
                    m.data[2][0] * rot.data[0][2] + m.data[2][1] * rot.data[1][2] + m.data[2][2] * rot.data[2][2],
                    m.data[2][3]
                },
                []f32 {
                    m.data[3][0] * rot.data[0][0] + m.data[3][1] * rot.data[1][0] + m.data[3][2] * rot.data[2][0],
                    m.data[3][0] * rot.data[0][1] + m.data[3][1] * rot.data[1][1] + m.data[3][2] * rot.data[2][1],
                    m.data[3][0] * rot.data[0][2] + m.data[3][1] * rot.data[1][2] + m.data[3][2] * rot.data[2][2],
                    m.data[3][3]
                },
            },
        }
    }

    /// Builds a translation 4 * 4 matrix created from a vector of 3 components.
    /// Input matrix multiplied by this translation matrix.
    pub fn translate(m: &const Mat4x4, x: f32, y: f32, z: f32) -> Mat4x4 {
        Mat4x4 {
            .data = [][4]f32 {
                []f32{m.data[0][0], m.data[0][1], m.data[0][2], m.data[0][3] + m.data[0][0] * x + m.data[0][1] * y + m.data[0][2] * z},
                []f32{m.data[1][0], m.data[1][1], m.data[1][2], m.data[1][3] + m.data[1][0] * x + m.data[1][1] * y + m.data[1][2] * z},
                []f32{m.data[2][0], m.data[2][1], m.data[2][2], m.data[2][3] + m.data[2][0] * x + m.data[2][1] * y + m.data[2][2] * z},
                []f32{m.data[3][0], m.data[3][1], m.data[3][2], m.data[3][3]},
            },
        }
    }

    pub fn translate_by_vec(m: &const Mat4x4, v: Vec3) -> Mat4x4 {
        m.translate(v.data[0], v.data[1], v.data[2])
    }

    /// Builds a scale 4 * 4 matrix created from 3 scalars.
    /// Input matrix multiplied by this scale matrix.
    pub fn scale(m: &const Mat4x4, x: f32, y: f32, z: f32) -> Mat4x4 {
        Mat4x4 {
            .data = [][4]f32{
                []f32{m.data[0][0] * x, m.data[0][1] * y, m.data[0][2] * z, m.data[0][3]},
                []f32{m.data[1][0] * x, m.data[1][1] * y, m.data[1][2] * z, m.data[1][3]},
                []f32{m.data[2][0] * x, m.data[2][1] * y, m.data[2][2] * z, m.data[2][3]},
                []f32{m.data[3][0] * x, m.data[3][1] * y, m.data[3][2] * z, m.data[3][3]},
            },
        }
    }

    pub fn transpose(m: &const Mat4x4) -> Mat4x4 {
        Mat4x4 {
            .data = [][4]f32 {
                []f32{m.data[0][0], m.data[1][0], m.data[2][0], m.data[3][0]},
                []f32{m.data[0][1], m.data[1][1], m.data[2][1], m.data[3][1]},
                []f32{m.data[0][2], m.data[1][2], m.data[2][2], m.data[3][2]},
                []f32{m.data[0][3], m.data[1][3], m.data[2][3], m.data[3][3]},
            },
        }
    }
};

pub const mat4x4_identity = Mat4x4 {
    .data = [][4]f32{
        []f32{1.0, 0.0, 0.0, 0.0},
        []f32{0.0, 1.0, 0.0, 0.0},
        []f32{0.0, 0.0, 1.0, 0.0},
        []f32{0.0, 0.0, 0.0, 1.0},
    },
};

/// Creates a matrix for an orthographic parallel viewing volume.
pub fn mat4x4_ortho(left: f32, right: f32, bottom: f32, top: f32) -> Mat4x4 {
    var m = mat4x4_identity;
    m.data[0][0] = 2.0 / (right - left);
    m.data[1][1] = 2.0 / (top - bottom);
    m.data[2][2] = -1.0;
    m.data[0][3] = -(right + left) / (right - left);
    m.data[1][3] = -(top + bottom) / (top - bottom);
    m
}

pub const Vec2 = struct {
    data: [2]f32,
    
    inline fn x(v: &const Vec2) -> f32 { v.data[0] }
    inline fn y(v: &const Vec2) -> f32 { v.data[1] }

    pub fn set(self: &Vec2, X: f32, Y: f32) {
        self.data[0] = X;
        self.data[1] = Y;
    }
};

pub fn vec2(x: f32, y: f32) -> Vec2 {
    Vec2 { .data = []f32 { x, y }}
}

pub const Vec3 = struct {
    data: [3]f32,

    inline fn x(v: &const Vec3) -> f32 { v.data[0] }
    inline fn y(v: &const Vec3) -> f32 { v.data[1] }
    inline fn z(v: &const Vec3) -> f32 { v.data[2] }
    
    pub fn set(self: &Vec3, X: f32, Y: f32, Z: f32) {
        self.data[0] = X;
        self.data[1] = Y;
        self.data[2] = Z;
    }

    pub fn normalize(v: &const Vec3) -> Vec3 {
        v.scale(1.0 / c.sqrtf(v.dot(v)))
    }

    pub fn scale(v: &const Vec3, scalar: f32) -> Vec3 {
        Vec3 {
            .data = []f32 {
                v.data[0] * scalar,
                v.data[1] * scalar,
                v.data[2] * scalar,
            },
        }
    }

    pub fn dot(v: &const Vec3, o: &const Vec3) -> f32 {
        v.data[0] * o.data[0] + v.data[1] * o.data[1] + v.data[2] * o.data[2]
    }

    pub fn length(v: &const Vec3) -> f32 {
        c.sqrtf(v.dot(v))
    }

    pub fn cross(v: &const Vec3, o: &const Vec3) -> Vec3 {
        Vec3 {
            .data = []f32 {
                v.data[1] * o.data[2] - o.data[1] * v.data[2],
                v.data[2] * o.data[0] - o.data[2] * v.data[0],
                v.data[0] * o.data[1] - o.data[0] * v.data[1],
            },
        }
    }

    pub fn add(v: &const Vec3, o: &const Vec3) -> Vec3 {
        Vec3 {
            .data = []f32 {
                v.data[0] + o.data[0],
                v.data[1] + o.data[1],
                v.data[2] + o.data[2],
            },
        }
    }
};

pub fn vec3(x: f32, y: f32, z: f32) -> Vec3 {
    Vec3 { .data = []f32 { x, y, z, } }
}

pub const Vec4 = struct {
    data: [4]f32,

    inline fn x(v: &const Vec4) -> f32 { v.data[0] }
    inline fn y(v: &const Vec4) -> f32 { v.data[1] }
    inline fn z(v: &const Vec4) -> f32 { v.data[2] }
    inline fn w(v: &const Vec4) -> f32 { v.data[3] }

    pub fn set(self: &Vec4, X: f32, Y: f32, Z: f32, W: f32) {
        self.data[0] = X;
        self.data[1] = Y;
        self.data[2] = Z;
        self.data[3] = W;
    }
};

pub fn vec4(xa: f32, xb: f32, xc: f32, xd: f32) -> Vec4 {
    Vec4 { .data = []f32 { xa, xb, xc, xd, } }
}

