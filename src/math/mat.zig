use @import("vec.zig");

const math = @import("std").math;

pub fn Mat2T(comptime T: type) type {
    return struct {
        data: [2][2]T,

        const Self = this;
        const Row = Vec2T(T);

        // Creates a matrix 2x2 from a given radians value
        fn radians(radians: f32) Mat2 {
            const c: f32 = cosf(radians);
            const s: f32 = sinf(radians);

            return Mat2{ c, -s, s, c };
        }

        fn set(matrix: *Self, radians: f32) void {
            const c: f32 = cosf(radians);
            const s: f32 = sinf(radians);

            matrix.m00 = c;
            matrix.m01 = -s;
            matrix.m10 = s;
            matrix.m11 = c;
        }

        // Returns the transpose of a given matrix 2x2
        inline fn transpose(matrix: *const Self) Mat2 {
            return (Mat2){ matrix.m00, matrix.m10, matrix.m01, matrix.m11 };
        }

        // Multiplies a vector by a matrix 2x2
        inline fn mul_vec2(matrix: *const Self, vector: *const Vec2) Vec2 {
            return (Vec2){ matrix.m00*vector.x + matrix.m01*vector.y, matrix.m10*vector.x + matrix.m11*vector.y };
        }  
    };
}

pub fn Mat3T(comptime T: type) type {
    return struct {
        data: [3][3]T,

        const Self = this;
        const Row = Vec3T(T);

        pub fn new() Self {
            return Self {
                .data = []T {
                    []T {0, 0, 0},
                    []T {0, 0, 0},
                    []T {0, 0, 0}
                }
            };
        }
        
        pub fn init(value: T) Self {
            return Self {
                .data = []T {
                    []T {value, value, value},
                    []T {value, value, value},
                    []T {value, value, value}
                }
            };
        }
        
        pub fn diagonal(value: T) Self {
            return Self {
                .data = []T {
                    []T {value, 0, 0},
                    []T {0, value, 0},
                    []T {0, 0, value}
                }
            };
        }

        pub fn rows(first: *const Row, second: *const Row, third: *const Row) Self {
            return Self { .data = []T { first.data, second.data, third.data } };
        }

        pub fn dup(self: *const Self) Self {
            return Self { .data = self.data };
        }

        pub fn orthographic(left: T, right: T, bottom: T, top: T, near: T, far: T) Self {
            var result = diagonal(1);

            result.data[0][0] = 2.0 / ( right - left );
            result.data[1][1] = 2.0 / ( top - bottom );
            result.data[2][2] = 2.0 / ( near - far );
            result.data[0][3] = ( left + right ) / ( left - right );
            result.data[1][3] = ( bottom + top ) / ( bottom - top );
            result.data[2][3] = ( far + near ) / ( far - near );

            return result;
        }

        pub fn perspective(fov: T, aspectRatio: T, near: T, far: T) Self {
            var result = diagonal(1);

            const q = 1.0 / tan(toRadians(0.5 * fov));
            const a = q / aspectRatio;
            const b = ( near + far ) / ( near - far );
            const c = ( 2.0 * near * far ) / ( near - far );

            result.data[0][0] = a;
            result.data[1][1] = q;
            result.data[2][2] = b;
            result.data[3][2] = -1.0;
            result.data[2][3] = c;

            return result;
        }

        pub fn scale(scale: *const Vec3T(T)) Self {
            var result = diagonal(1);
            result.data[0][0] = scale.x;
            result.data[1][1] = scale.y;
            result.data[2][2] = scale.z;
            return result;
        }

        pub fn mul(self: *const Self, other: *const Self) Self {
            return Self {
                .data = [][4]T{
                    []T{
                        self.data[0][0]*other.data[0][0] + self.data[0][1]*other.data[1][0] + self.data[0][2]*other.data[2][0],
                        self.data[0][0]*other.data[0][1] + self.data[0][1]*other.data[1][1] + self.data[0][2]*other.data[2][1],
                        self.data[0][0]*other.data[0][2] + self.data[0][1]*other.data[1][2] + self.data[0][2]*other.data[2][2],
                    },
                    []T{
                        self.data[1][0]*other.data[0][0] + self.data[1][1]*other.data[1][0] + self.data[1][2]*other.data[2][0],
                        self.data[1][0]*other.data[0][1] + self.data[1][1]*other.data[1][1] + self.data[1][2]*other.data[2][1],
                        self.data[1][0]*other.data[0][2] + self.data[1][1]*other.data[1][2] + self.data[1][2]*other.data[2][2],
                    },
                    []T{
                        self.data[2][0]*other.data[0][0] + self.data[2][1]*other.data[1][0] + self.data[2][2]*other.data[2][0],
                        self.data[2][0]*other.data[0][1] + self.data[2][1]*other.data[1][1] + self.data[2][2]*other.data[2][1],
                        self.data[2][0]*other.data[0][2] + self.data[2][1]*other.data[1][2] + self.data[2][2]*other.data[2][2],
                    },
                },
            };
        }

        pub fn mul_vec(self: *const Self, other: *const Vec3T(T)) Vec3 {
            return other.transform(self);
        }

        pub fn transpose(matrix: *const Self) Self {
            return Self(
                vec3(matrix.rows[0].x, matrix.rows[1].x, matrix.rows[2].x),
                vec3(matrix.rows[0].y, matrix.rows[1].y, matrix.rows[2].y),
                vec3(matrix.rows[0].z, matrix.rows[1].z, matrix.rows[2].z)
            );
        }

        pub fn invert(self: *const Self) *Self {
            // var temp = Self.new();

            // var determinant = data[0] * temp[0] + data[1] * temp[4] + data[2] * temp[8] + data[3] * temp[12];
            // determinant = 1.0 / determinant;

            // for ( int32 i = 0; i < 4 * 4; i++ )
            //     self.data[i] = temp[i] * determinant;

            // return self;
        }

        pub fn GetColumn(self: *const Self, index: usize) Vec3 {
            return vec3(self.data[index + 0 * 3], self.data[index + 1 * 3], self.data[index + 2 * 3]);
        }

        pub fn LookAt(camera: *const Vec3T(T), object: *const Vec3T(T), up: *const Vec3T(T)) Self {
            var result = Identity();

            const f = normalize(object - camera);
            const s = f.cross(normalize(up));
            const u = s.cross(f);

            result.data[0][0] = s.x;
            result.data[1][0] = s.y;
            result.data[2][0] = s.z;
            result.data[0][1] = u.x;
            result.data[1][1] = u.y;
            result.data[2][1] = u.z;
            result.data[0][2] = -f.x;
            result.data[1][2] = -f.y;
            result.data[2][2] = -f.z;

            return result * Translate(Vec3(-camera.x, -camera.y, -camera.z));
        }

        pub fn Translate(translation: *const Vec3T(T)) Self {
            var result = diagonal(1);

            result.data[0][3] = translation.x;
            result.data[1][3] = translation.y;
            result.data[2][3] = translation.z;

            return result;
        }

        pub fn rotate_angle(angle: f32, axis: *const Vec3T(T)) Self {
            var result = diagonal(1);

            const r = toRadians(angle);
            const c = cos(r);
            const s = sin(r);
            const omc = 1.0 - c;
            const x = axis.x;
            const y = axis.y;
            const z = axis.z;

            result.data[0][0] = x * omc + c;
            result.data[1][0] = y * x * omc + z * s;
            result.data[2][0] = x * z * omc - y * s;
            result.data[0][1] = x * y * omc - z * s;
            result.data[1][1] = y * omc + c;
            result.data[2][1] = y * z * omc + x * s;
            result.data[0][2] = x * z * omc + y * s;
            result.data[1][2] = y * z * omc - x * s;
            result.data[2][2] = z * omc + c;

            return result;
        }

        pub fn rotate_quat(quat: *const QuatT(T)) Self {
            var result = Identity();

            const qx = quat.x;
            const qy = quat.y;
            const qz = quat.z;
            const qw = quat.w;
            const qx2 = ( qx * 2 );
            const qy2 = ( qy * 2 );
            const qz2 = ( qz * 2 );
            const qxqx2 = ( qx * qx2 );
            const qxqy2 = ( qx * qy2 );
            const qxqz2 = ( qx * qz2 );
            const qxqw2 = ( qw * qx2 );
            const qyqy2 = ( qy * qy2 );
            const qyqz2 = ( qy * qz2 );
            const qyqw2 = ( qw * qy2 );
            const qzqz2 = ( qz * qz2 );
            const qzqw2 = ( qw * qz2 );

            result.rows[0] = vec3(( ( 1.0 - qyqy2 ) - qzqz2 ), ( qxqy2 - qzqw2 ), ( qxqz2 + qyqw2 ));
            result.rows[1] = vec3(( qxqy2 + qzqw2 ), ( ( 1.0 - qxqx2 ) - qzqz2 ), ( qyqz2 - qxqw2 ));
            result.rows[2] = vec3(( qxqz2 - qyqw2 ), ( qyqz2 + qxqw2 ), ( ( 1.0 - qxqx2 ) - qyqy2 ));

            return result;
        }
    };
}

pub fn Mat4T(comptime T: type) type {
    return struct {
        data: [4][4]T,

        const Self = this;
        const Row = Vec4T(T);

        pub fn new() Self {
            return Self {
                .data = [][4]T {
                    []T {0, 0, 0, 0},
                    []T {0, 0, 0, 0},
                    []T {0, 0, 0, 0},
                    []T {0, 0, 0, 0}
                }
            };
        }
        pub fn init(value: T) Self {
            return Self {
                .data = [][4]T {
                    []T {value, value, value, value},
                    []T {value, value, value, value},
                    []T {value, value, value, value},
                    []T {value, value, value, value}
                }
            };
        }
        pub fn diagonal(value: T) Self {
            return Self {
                .data = [][4]T {
                    []T {value, 0, 0, 0},
                    []T {0, value, 0, 0},
                    []T {0, 0, value, 0},
                    []T {0, 0, 0, value}
                }
            };
        }
        pub fn rows(first: *const Row, second: *const Row, third: *const Row, fourth: *const Row) Self {
            return Self {
                .data = []T { first.data, second.data, third.data, fourth.data }
            };
        }
        pub fn dup(other: *const Self) Self {
            return Self { .data = self.data };
        }

        pub fn orthographic(left: T, right: T, bottom: T, top: T, near: T, far: T) Self {
            var result = diagonal(1);

            result.data[0][0] = 2.0 / ( right - left );
            result.data[1][1] = 2.0 / ( top - bottom );
            result.data[2][2] = 2.0 / ( near - far );
            result.data[0][3] = ( left + right ) / ( left - right );
            result.data[1][3] = ( bottom + top ) / ( bottom - top );
            result.data[2][3] = ( far + near ) / ( far - near );

            return result;
        }

        pub fn perspective(fov: T, aspectRatio: T, near: T, far: T) Self {
            var result = diagonal(1);

            const q = 1.0 / tan(toRadians(0.5 * fov));
            const a = q / aspectRatio;
            const b = ( near + far ) / ( near - far );
            const c = ( 2.0 * near * far ) / ( near - far );

            result.data[0][0] = a;
            result.data[1][1] = q;
            result.data[2][2] = b;
            result.data[3][2] = -1.0;
            result.data[2][3] = c;

            return result;
        }

        pub fn translation(translation: *const Vec3T(T)) Self {
            var result = diagonal(1);
            result.data[0][3] = translation.x;
            result.data[1][3] = translation.y;
            result.data[2][3] = translation.z;
            return result;
        }

        pub fn scaling(vec: *const Vec3T(T)) Self {
            var result = diagonal(1);
            result.data[0][0] = vec.x;
            result.data[1][1] = vec.y;
            result.data[2][2] = vec.z;
            return result;
        }


        pub fn rotation(angle: f32, axis: *const Vec3T(T)) Self {
            var result = diagonal(1);

            const r = toRadians(angle);
            const c = cos(r);
            const s = sin(r);
            const omc = 1.0 - c;
            const x = axis.x;
            const y = axis.y;
            const z = axis.z;

            result.data[0][0] = x * x * omc + c;
            result.data[1][0] = y * x * omc + z * s;
            result.data[2][0] = x * z * omc - y * s;
            result.data[0][1] = x * y * omc - z * s;
            result.data[1][1] = y * y * omc + c;
            result.data[2][1] = y * z * omc + x * s;
            result.data[0][2] = x * z * omc + y * s;
            result.data[1][2] = y * z * omc - x * s;
            result.data[2][2] = z * z * omc + c;

            return result;
        }

        pub fn rotation_quat(quat: *const QuatT(T)) Self {
            var result = diagonal(1);

            const qx = quat.x;
            const qy = quat.y;
            const qz = quat.z;
            const qw = quat.w;
            const qx2 = ( qx * 2 );
            const qy2 = ( qy * 2 );
            const qz2 = ( qz * 2 );
            const qxqx2 = ( qx * qx2 );
            const qxqy2 = ( qx * qy2 );
            const qxqz2 = ( qx * qz2 );
            const qxqw2 = ( qw * qx2 );
            const qyqy2 = ( qy * qy2 );
            const qyqz2 = ( qy * qz2 );
            const qyqw2 = ( qw * qy2 );
            const qzqz2 = ( qz * qz2 );
            const qzqw2 = ( qw * qz2 );

            result.rows[0] = vec4(( ( 1.0 - qyqy2 ) - qzqz2 ), ( qxqy2 - qzqw2 ), ( qxqz2 + qyqw2 ), 0.0);
            result.rows[1] = vec4(( qxqy2 + qzqw2 ), ( ( 1.0 - qxqx2 ) - qzqz2 ), ( qyqz2 - qxqw2 ), 0.0);
            result.rows[2] = vec4(( qxqz2 - qyqw2 ), ( qyqz2 + qxqw2 ), ( ( 1.0 - qxqx2 ) - qyqy2 ), 0.0);
            return result;
        }

        pub fn lookAt(camera: *const Vec3T(T), object: *const Vec3T(T), up: *const Vec3T(T)) Self {
            var result = Identity();
            const f = normalize(object - camera);
            const s = f.cross(normalize(up));
            const u = s.cross(f);

            result.data[0][0] = s.x;
            result.data[1][0] = s.y;
            result.data[2][0] = s.z;
            result.data[0][1] = u.x;
            result.data[1][1] = u.y;
            result.data[2][1] = u.z;
            result.data[0][2] = -f.x;
            result.data[1][2] = -f.y;
            result.data[2][2] = -f.z;

            return result * Translate(Vec3(-camera.x, -camera.y, -camera.z));
        }

        pub fn getColumn(index: usize) vec4 {
            return vec4(data[index + 0 * 4], data[index + 1 * 4], data[index + 2 * 4], data[index + 3 * 4]);
        }

        pub fn mul(self: *const Self, other: *const Self) Self {
            const m = self;
            const o = other;
            return Self {
                .data = [][4]T{
                    []T{
                        m.data[0][0]*o.data[0][0] + m.data[0][1]*o.data[1][0] + m.data[0][2]*o.data[2][0] + m.data[0][3]*o.data[3][0],
                        m.data[0][0]*o.data[0][1] + m.data[0][1]*o.data[1][1] + m.data[0][2]*o.data[2][1] + m.data[0][3]*o.data[3][1],
                        m.data[0][0]*o.data[0][2] + m.data[0][1]*o.data[1][2] + m.data[0][2]*o.data[2][2] + m.data[0][3]*o.data[3][2],
                        m.data[0][0]*o.data[0][3] + m.data[0][1]*o.data[1][3] + m.data[0][2]*o.data[2][3] + m.data[0][3]*o.data[3][3],
                    },
                    []T{
                        m.data[1][0]*o.data[0][0] + m.data[1][1]*o.data[1][0] + m.data[1][2]*o.data[2][0] + m.data[1][3]*o.data[3][0],
                        m.data[1][0]*o.data[0][1] + m.data[1][1]*o.data[1][1] + m.data[1][2]*o.data[2][1] + m.data[1][3]*o.data[3][1],
                        m.data[1][0]*o.data[0][2] + m.data[1][1]*o.data[1][2] + m.data[1][2]*o.data[2][2] + m.data[1][3]*o.data[3][2],
                        m.data[1][0]*o.data[0][3] + m.data[1][1]*o.data[1][3] + m.data[1][2]*o.data[2][3] + m.data[1][3]*o.data[3][3],
                    },
                    []T{
                        m.data[2][0]*o.data[0][0] + m.data[2][1]*o.data[1][0] + m.data[2][2]*o.data[2][0] + m.data[2][3]*o.data[3][0],
                        m.data[2][0]*o.data[0][1] + m.data[2][1]*o.data[1][1] + m.data[2][2]*o.data[2][1] + m.data[2][3]*o.data[3][1],
                        m.data[2][0]*o.data[0][2] + m.data[2][1]*o.data[1][2] + m.data[2][2]*o.data[2][2] + m.data[2][3]*o.data[3][2],
                        m.data[2][0]*o.data[0][3] + m.data[2][1]*o.data[1][3] + m.data[2][2]*o.data[2][3] + m.data[2][3]*o.data[3][3],
                    },
                    []T{
                        m.data[3][0]*o.data[0][0] + m.data[3][1]*o.data[1][0] + m.data[3][2]*o.data[2][0] + m.data[3][3]*o.data[3][0],
                        m.data[3][0]*o.data[0][1] + m.data[3][1]*o.data[1][1] + m.data[3][2]*o.data[2][1] + m.data[3][3]*o.data[3][1],
                        m.data[3][0]*o.data[0][2] + m.data[3][1]*o.data[1][2] + m.data[3][2]*o.data[2][2] + m.data[3][3]*o.data[3][2],
                        m.data[3][0]*o.data[0][3] + m.data[3][1]*o.data[1][3] + m.data[3][2]*o.data[2][3] + m.data[3][3]*o.data[3][3],
                    },
                },
            };
        }

        pub fn mul_vec3(self: *const Self, vec: *const Vec3TT(T)(T)) Vec3T(T) {
            return vec.Multiply(self);
        }

        pub fn mul_vec4(self: *const Self, vec: *const Vec4T(T)) Vec4T(T) {
            return vec.Multiply(self);
        }

        pub fn invert(self: *const Self) *Self {
        }

        pub fn transpose(self: *const Self) Self {
            return Self {
                .data = [][4]f32 {
                    []f32{ self.data[0][0], self.data[1][0], self.data[2][0], self.data[3][0] },
                    []f32{ self.data[0][1], self.data[1][1], self.data[2][1], self.data[3][1] },
                    []f32{ self.data[0][2], self.data[1][2], self.data[2][2], self.data[3][2] },
                    []f32{ self.data[0][3], self.data[1][3], self.data[2][3], self.data[3][3] },
                },
            };
        }

        /// Builds a translation 4 * 4 matrix created from a vector of 3 components.
        /// Input matrix multiplied by this translation matrix.
        pub fn translate(m: *const Self, x: f32, y: f32, z: f32) Self {
            return Self {
                .data = [][4]f32 {
                    []f32{ m.data[0][0], m.data[0][1], m.data[0][2], m.data[0][3] + m.data[0][0] * x + m.data[0][1] * y + m.data[0][2] * z },
                    []f32{ m.data[1][0], m.data[1][1], m.data[1][2], m.data[1][3] + m.data[1][0] * x + m.data[1][1] * y + m.data[1][2] * z },
                    []f32{ m.data[2][0], m.data[2][1], m.data[2][2], m.data[2][3] + m.data[2][0] * x + m.data[2][1] * y + m.data[2][2] * z },
                    []f32{ m.data[3][0], m.data[3][1], m.data[3][2], m.data[3][3] },
                },
            };
        }

        pub fn translate_vec(m: *const Self, v: *const Vec3T(T)) Self {
            return m.translate(v.x, v.y, v.z);
        }

        /// Builds a scale 4 * 4 matrix created from 3 scalars.
        /// Input matrix multiplied by this scale matrix.
        pub fn scale(m: *const Self, x: f32, y: f32, z: f32) Self {
            return Self {
                .data = [][4]T{
                    []T{ m.data[0][0] * x, m.data[0][1] * y, m.data[0][2] * z, m.data[0][3] },
                    []T{ m.data[1][0] * x, m.data[1][1] * y, m.data[1][2] * z, m.data[1][3] },
                    []T{ m.data[2][0] * x, m.data[2][1] * y, m.data[2][2] * z, m.data[2][3] },
                    []T{ m.data[3][0] * x, m.data[3][1] * y, m.data[3][2] * z, m.data[3][3] },
                },
            };
        }

        pub fn scale_vec(m: *const Self, v: *const Vec3TT(T)(T)) Self {
            return m.scale(v.data[0], v.data[1], v.data[2]);
        }

        pub fn rotate(m: *const Self, angle: f32, axis_unnormalized: Vec3) Self {
            const cos = c.cosf(angle);
            const s = c.sinf(angle);
            const axis = axis_unnormalized.normalize();
            const temp = axis.scale(1.0 - cos);

            const rot = Self {
                .data = [][4]T {
                    []T{cos + temp.data[0] * axis.data[0], 0.0 + temp.data[1] * axis.data[0] - s * axis.data[2], 0.0 + temp.data[2] * axis.data[0] + s * axis.data[1], 0.0},
                    []T{0.0 + temp.data[0] * axis.data[1] + s * axis.data[2], cos + temp.data[1] * axis.data[1], 0.0 + temp.data[2] * axis.data[1] - s * axis.data[0], 0.0},
                    []T{0.0 + temp.data[0] * axis.data[2] - s * axis.data[1], 0.0 + temp.data[1] * axis.data[2] + s * axis.data[0], cos + temp.data[2] * axis.data[2], 0.0},
                    []T{0.0, 0.0, 0.0, 0.0},
                },
            };

            return Self {
                .data = [][4]T {
                    []T {
                        m.data[0][0] * rot.data[0][0] + m.data[0][1] * rot.data[1][0] + m.data[0][2] * rot.data[2][0],
                        m.data[0][0] * rot.data[0][1] + m.data[0][1] * rot.data[1][1] + m.data[0][2] * rot.data[2][1],
                        m.data[0][0] * rot.data[0][2] + m.data[0][1] * rot.data[1][2] + m.data[0][2] * rot.data[2][2],
                        m.data[0][3]
                    },
                    []T {
                        m.data[1][0] * rot.data[0][0] + m.data[1][1] * rot.data[1][0] + m.data[1][2] * rot.data[2][0],
                        m.data[1][0] * rot.data[0][1] + m.data[1][1] * rot.data[1][1] + m.data[1][2] * rot.data[2][1],
                        m.data[1][0] * rot.data[0][2] + m.data[1][1] * rot.data[1][2] + m.data[1][2] * rot.data[2][2],
                        m.data[1][3]
                    },
                    []T {
                        m.data[2][0] * rot.data[0][0] + m.data[2][1] * rot.data[1][0] + m.data[2][2] * rot.data[2][0],
                        m.data[2][0] * rot.data[0][1] + m.data[2][1] * rot.data[1][1] + m.data[2][2] * rot.data[2][1],
                        m.data[2][0] * rot.data[0][2] + m.data[2][1] * rot.data[1][2] + m.data[2][2] * rot.data[2][2],
                        m.data[2][3]
                    },
                    []T {
                        m.data[3][0] * rot.data[0][0] + m.data[3][1] * rot.data[1][0] + m.data[3][2] * rot.data[2][0],
                        m.data[3][0] * rot.data[0][1] + m.data[3][1] * rot.data[1][1] + m.data[3][2] * rot.data[2][1],
                        m.data[3][0] * rot.data[0][2] + m.data[3][1] * rot.data[1][2] + m.data[3][2] * rot.data[2][2],
                        m.data[3][3]
                    },
                },
            };
        }
    };
}

// column
// row