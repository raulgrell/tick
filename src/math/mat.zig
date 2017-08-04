pub fn Mat3T(comptime T: type) -> type {
    struct {
        data: [3][3]T,

        const Self = this;
        const Row = Vec3T(T);

        pub fn new() -> Self {
            Self {
                .data = []T {
                    []T {0, 0, 0},
                    []T {0, 0, 0},
                    []T {0, 0, 0}
                }
            }
        }
        pub fn init(value: T) -> Self {
            Self {
                .data = []T {
                    []T {value, value, value},
                    []T {value, value, value},
                    []T {value, value, value}
                }
            }
        }
        pub fn diagonal(value: T) -> Self {
            Self {
                .data = []T {
                    []T {value, 0, 0},
                    []T {0, value, 0},
                    []T {0, 0, value}
                }
            }
        }
        pub fn rows(first: &const Row, second: &const Row, third: &const Row) -> Self {
            Self { .data = []T { first.data, second.data, third.data } }
        }
        pub fn dup(self: &const Self) -> Self {
            Self { .data = self.data }
        }

        pub fn Orthographic(left: T, right: T, bottom: T, top: T, near: T, far: T) -> Self {
            var result = diagonal(1);

            result.data[0 + 0 * 4] = 2.0 / ( right - left );
            result.data[1 + 1 * 4] = 2.0 / ( top - bottom );
            result.data[2 + 2 * 4] = 2.0 / ( near - far );
            result.data[3 + 0 * 4] = ( left + right ) / ( left - right );
            result.data[3 + 1 * 4] = ( bottom + top ) / ( bottom - top );
            result.data[3 + 2 * 4] = ( far + near ) / ( far - near );

            return result;
        }

        pub fn Perspective(fov: T, aspectRatio: T, near: T, far: T) -> Self {
            var result = diagonal(1);

            const q = 1.0 / tan(toRadians(0.5 * fov));
            const a = q / aspectRatio;
            const b = ( near + far ) / ( near - far );
            const c = ( 2.0 * near * far ) / ( near - far );

            result.data[0 + 0 * 4] = a;
            result.data[1 + 1 * 4] = q;
            result.data[2 + 2 * 4] = b;
            result.data[2 + 3 * 4] = -1.0;
            result.data[3 + 2 * 4] = c;

            return result;
        }

        pub fn Scale(scale: &const Vec3) -> Self {
            var result = diagonal(1);

            result.data[0 + 0 * 4] = scale.x;
            result.data[1 + 1 * 4] = scale.y;
            result.data[2 + 2 * 4] = scale.z;

            return result;
        }

        pub fn mul(self: &const Self, other: &const Self) -> Self {
            var result = new();
            // for ( int32 row = 0; row < 3; row++ ) {
            //     for ( int32 col = 0; col < 3; col++ ) {
            //         var sum = 0.0;
            //         for ( int32 e = 0; e < 3; e++ ) {
            //             sum += data[e + row * 3] * other.data[col + e * 3];
            //         }
            //         result.data[col + row * 3] = sum;
            //     }
            // }
            return result;
        }

        pub fn mul_vec(self: &const Self, other: &const Vec3) -> Vec3 {
            // return mul(other);
        }

        pub fn Transpose(matrix: &const Self) -> Self {
            return Self(
                vec3(matrix.rows[0].x, matrix.rows[1].x, matrix.rows[2].x),
                vec3(matrix.rows[0].y, matrix.rows[1].y, matrix.rows[2].y),
                vec3(matrix.rows[0].z, matrix.rows[1].z, matrix.rows[2].z)
            );
        }

        pub fn Invert(matrix: &const Self) -> Self {
            var result = matrix;
            return result.Invert();
        }

        pub fn Invert(self: &const Self) -> &Self {
            // var temp = Self.new();

            // var determinant = data[0] * temp[0] + data[1] * temp[4] + data[2] * temp[8] + data[3] * temp[12];
            // determinant = 1.0 / determinant;

            // for ( int32 i = 0; i < 4 * 4; i++ )
            //     self.data[i] = temp[i] * determinant;

            // return self;
        }

        pub fn GetColumn(self: &const Self, index: usize) -> Vec3 {
            return vec3(data[index + 0 * 3], data[index + 1 * 3], data[index + 2 * 3]);
        }

        pub fn LookAt(camera: &const Vec3, object: &const Vec3, up: &const Vec3) -> Self {
            var result = Identity();

            const f = normalize(object - camera);
            const s = f.cross(normalize(up));
            const u = s.cross(f);

            result.data[0 + 0 * 4] = s.x;
            result.data[0 + 1 * 4] = s.y;
            result.data[0 + 2 * 4] = s.z;

            result.data[1 + 0 * 4] = u.x;
            result.data[1 + 1 * 4] = u.y;
            result.data[1 + 2 * 4] = u.z;

            result.data[2 + 0 * 4] = -f.x;
            result.data[2 + 1 * 4] = -f.y;
            result.data[2 + 2 * 4] = -f.z;

            return result * Translate(Vec3(-camera.x, -camera.y, -camera.z));
        }

        pub fn Translate(translation: &const Vec3) -> Self {
            var result = diagonal(1);

            result.data[3 + 0 * 4] = translation.x;
            result.data[3 + 1 * 4] = translation.y;
            result.data[3 + 2 * 4] = translation.z;

            return result;
        }

        pub fn rotate_angle(angle: f32, axis: &const Vec3) -> Self {
            var result = diagonal(1);

            const r = toRadians(angle);
            const c = cos(r);
            const s = sin(r);
            const omc = 1.0 - c;
            const x = axis.x;
            const y = axis.y;
            const z = axis.z;

            result.data[0 + 0 * 4] = x * omc + c;
            result.data[0 + 1 * 4] = y * x * omc + z * s;
            result.data[0 + 2 * 4] = x * z * omc - y * s;

            result.data[1 + 0 * 4] = x * y * omc - z * s;
            result.data[1 + 1 * 4] = y * omc + c;
            result.data[1 + 2 * 4] = y * z * omc + x * s;

            result.data[2 + 0 * 4] = x * z * omc + y * s;
            result.data[2 + 1 * 4] = y * z * omc - x * s;
            result.data[2 + 2 * 4] = z * omc + c;

            return result;
        }

        pub fn rotate_quat(quat: &const QuatT(T)) -> Self {
            var result = Identity();

            const qx = quat.x;
            const qy = quat.y;
            const qz = quat.z;
            const qw = quat.w;
            const qx2 = ( qx + qx );
            const qy2 = ( qy + qy );
            const qz2 = ( qz + qz );
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
    }
}

pub fn Mat4T(comptime T: type) -> type {
    struct {
        data: [4][4]T,

        const Self = this;
        const Row = Vec4T(T);

        pub fn new() -> Self {
            Self {
                .data = []T {
                    []T {0, 0, 0, 0},
                    []T {0, 0, 0, 0},
                    []T {0, 0, 0, 0},
                    []T {0, 0, 0, 0}
                }
            }
        }
        pub fn init(value: T) -> Self {
            Self {
                .data = []T {
                    []T {value, value, value, value},
                    []T {value, value, value, value},
                    []T {value, value, value, value},
                    []T {value, value, value, value}
                }
            }
        }
        pub fn diagonal(value: T) -> Self {
            Self {
                .data = []T {
                    []T {value, 0, 0, 0},
                    []T {0, value, 0, 0},
                    []T {0, 0, value, 0},
                    []T {0, 0, 0, value}
                }
            }
        }
        pub fn rows(first: &const Row, second: &const Row, third: &const Row, fourth: &const Row) -> Self {
            Self { .data = []T { first.data, second.data, third.data, fourth.data } }
        }
        pub fn dup(other: &const Self) -> Self {
            Self { .data = self.data }
        }

        pub fn Multiply(other: &const Self) -> Self {
            const result = Self.new();
            // for ( int32 row = 0; row < 4; row++ ) {
            //     for ( int32 col = 0; col < 4; col++ ) {
            //         var sum = T(0);
            //         for ( int32 e = 0; e < 4; e++ ) {
            //             sum += data[e + row * 4] * other.data[col + e * 4];
            //         }
            //         result.data[col + row * 4] = sum;
            //     }
            // }
            return result;
        }

        pub fn Multiply(other: &const Vec3) -> Vec3 {
            return other.Multiply(*this);
        }

        pub fn Multiply(other: &const Vec4) -> vec4 {
            return other.Multiply(*this);
        }

        pub fn GetColumn(index: usize) -> vec4 {
            return vec4(data[index + 0 * 4], data[index + 1 * 4], data[index + 2 * 4], data[index + 3 * 4]);
        }

        pub fn Orthographic(left: T, right: T, bottom: T, top: T, near: T, far: T) -> Self {
            var result = diagonal(1);

            result.data[0 + 0 * 4] = 2.0 / ( right - left );

            result.data[1 + 1 * 4] = 2.0 / ( top - bottom );

            result.data[2 + 2 * 4] = 2.0 / ( near - far );

            result.data[3 + 0 * 4] = ( left + right ) / ( left - right );
            result.data[3 + 1 * 4] = ( bottom + top ) / ( bottom - top );
            result.data[3 + 2 * 4] = ( far + near ) / ( far - near );

            return result;
        }

        pub fn Perspective(fov: T, aspectRatio: T, near: T, far: T) -> Self {
            var result = diagonal(1);

            const q = 1.0 / tan(toRadians(0.5 * fov));
            const a = q / aspectRatio;
            const b = ( near + far ) / ( near - far );
            const c = ( 2.0 * near * far ) / ( near - far );

            result.data[0 + 0 * 4] = a;
            result.data[1 + 1 * 4] = q;
            result.data[2 + 2 * 4] = b;
            result.data[2 + 3 * 4] = -1.0;
            result.data[3 + 2 * 4] = c;

            return result;
        }

        pub fn Scale(scale: &const Vec3) -> Self {
            var result = diagonal(1);

            result.data[0 + 0 * 4] = scale.x;
            result.data[1 + 1 * 4] = scale.y;
            result.data[2 + 2 * 4] = scale.z;

            return result;
        }

        pub fn Invert(matrix: &const Self) -> Self {
            var result = dup(matrix);
            return result.Invert();
        }

        pub fn Invert(self: &Self) -> &Self {
            // f32 temp[16];

            // temp[0] = data[5] * data[10] * data[15] -
            //     data[5] * data[11] * data[14] -
            //     data[9] * data[6] * data[15] +
            //     data[9] * data[7] * data[14] +
            //     data[13] * data[6] * data[11] -
            //     data[13] * data[7] * data[10];

            // temp[4] = -data[4] * data[10] * data[15] +
            //     data[4] * data[11] * data[14] +
            //     data[8] * data[6] * data[15] -
            //     data[8] * data[7] * data[14] -
            //     data[12] * data[6] * data[11] +
            //     data[12] * data[7] * data[10];

            // temp[8] = data[4] * data[9] * data[15] -
            //     data[4] * data[11] * data[13] -
            //     data[8] * data[5] * data[15] +
            //     data[8] * data[7] * data[13] +
            //     data[12] * data[5] * data[11] -
            //     data[12] * data[7] * data[9];

            // temp[12] = -data[4] * data[9] * data[14] +
            //     data[4] * data[10] * data[13] +
            //     data[8] * data[5] * data[14] -
            //     data[8] * data[6] * data[13] -
            //     data[12] * data[5] * data[10] +
            //     data[12] * data[6] * data[9];

            // temp[1] = -data[1] * data[10] * data[15] +
            //     data[1] * data[11] * data[14] +
            //     data[9] * data[2] * data[15] -
            //     data[9] * data[3] * data[14] -
            //     data[13] * data[2] * data[11] +
            //     data[13] * data[3] * data[10];

            // temp[5] = data[0] * data[10] * data[15] -
            //     data[0] * data[11] * data[14] -
            //     data[8] * data[2] * data[15] +
            //     data[8] * data[3] * data[14] +
            //     data[12] * data[2] * data[11] -
            //     data[12] * data[3] * data[10];

            // temp[9] = -data[0] * data[9] * data[15] +
            //     data[0] * data[11] * data[13] +
            //     data[8] * data[1] * data[15] -
            //     data[8] * data[3] * data[13] -
            //     data[12] * data[1] * data[11] +
            //     data[12] * data[3] * data[9];

            // temp[13] = data[0] * data[9] * data[14] -
            //     data[0] * data[10] * data[13] -
            //     data[8] * data[1] * data[14] +
            //     data[8] * data[2] * data[13] +
            //     data[12] * data[1] * data[10] -
            //     data[12] * data[2] * data[9];

            // temp[2] = data[1] * data[6] * data[15] -
            //     data[1] * data[7] * data[14] -
            //     data[5] * data[2] * data[15] +
            //     data[5] * data[3] * data[14] +
            //     data[13] * data[2] * data[7] -
            //     data[13] * data[3] * data[6];

            // temp[6] = -data[0] * data[6] * data[15] +
            //     data[0] * data[7] * data[14] +
            //     data[4] * data[2] * data[15] -
            //     data[4] * data[3] * data[14] -
            //     data[12] * data[2] * data[7] +
            //     data[12] * data[3] * data[6];

            // temp[10] = data[0] * data[5] * data[15] -
            //     data[0] * data[7] * data[13] -
            //     data[4] * data[1] * data[15] +
            //     data[4] * data[3] * data[13] +
            //     data[12] * data[1] * data[7] -
            //     data[12] * data[3] * data[5];

            // temp[14] = -data[0] * data[5] * data[14] +
            //     data[0] * data[6] * data[13] +
            //     data[4] * data[1] * data[14] -
            //     data[4] * data[2] * data[13] -
            //     data[12] * data[1] * data[6] +
            //     data[12] * data[2] * data[5];

            // temp[3] = -data[1] * data[6] * data[11] +
            //     data[1] * data[7] * data[10] +
            //     data[5] * data[2] * data[11] -
            //     data[5] * data[3] * data[10] -
            //     data[9] * data[2] * data[7] +
            //     data[9] * data[3] * data[6];

            // temp[7] = data[0] * data[6] * data[11] -
            //     data[0] * data[7] * data[10] -
            //     data[4] * data[2] * data[11] +
            //     data[4] * data[3] * data[10] +
            //     data[8] * data[2] * data[7] -
            //     data[8] * data[3] * data[6];

            // temp[11] = -data[0] * data[5] * data[11] +
            //     data[0] * data[7] * data[9] +
            //     data[4] * data[1] * data[11] -
            //     data[4] * data[3] * data[9] -
            //     data[8] * data[1] * data[7] +
            //     data[8] * data[3] * data[5];

            // temp[15] = data[0] * data[5] * data[10] -
            //     data[0] * data[6] * data[9] -
            //     data[4] * data[1] * data[10] +
            //     data[4] * data[2] * data[9] +
            //     data[8] * data[1] * data[6] -
            //     data[8] * data[2] * data[5];

            // var determinant = data[0] * temp[0] + data[1] * temp[4] + data[2] * temp[8] + data[3] * temp[12];
            // determinant = 1.0 / determinant;

            // for ( int32 i = 0; i < 4 * 4; i++ )
            //     data[i] = temp[i] * determinant;

            // return *this;
        }

        pub fn Transpose(matrix: &const Self) -> Self {
            return Self(
                vec4(matrix.rows[0].x, matrix.rows[1].x, matrix.rows[2].x, matrix.rows[3].x),
                vec4(matrix.rows[0].y, matrix.rows[1].y, matrix.rows[2].y, matrix.rows[3].y),
                vec4(matrix.rows[0].z, matrix.rows[1].z, matrix.rows[2].z, matrix.rows[3].z),
                vec4(matrix.rows[0].w, matrix.rows[1].w, matrix.rows[2].w, matrix.rows[3].w)
            );
        }

        pub fn LookAt(camera: &const Vec3, object: &const Vec3, up: &const Vec3) -> Self {
            var result = Identity();
            const f = normalize(object - camera);
            const s = f.cross(normalize(up));
            const u = s.cross(f);

            result.data[0 + 0 * 4] = s.x;
            result.data[0 + 1 * 4] = s.y;
            result.data[0 + 2 * 4] = s.z;

            result.data[1 + 0 * 4] = u.x;
            result.data[1 + 1 * 4] = u.y;
            result.data[1 + 2 * 4] = u.z;

            result.data[2 + 0 * 4] = -f.x;
            result.data[2 + 1 * 4] = -f.y;
            result.data[2 + 2 * 4] = -f.z;

            return result * Translate(Vec3(-camera.x, -camera.y, -camera.z));
        }

        pub fn Translate(translation: &const Vec3) -> Self {
            var result = diagonal(1);

            result.data[3 + 0 * 4] = translation.x;
            result.data[3 + 1 * 4] = translation.y;
            result.data[3 + 2 * 4] = translation.z;

            return result;
        }

        pub fn rotate(angle: f32, axis: &const Vec3) -> Self {
            var result = diagonal(1);

            const r = toRadians(angle);
            const c = cos(r);
            const s = sin(r);
            const omc = 1.0 - c;
            const x = axis.x;
            const y = axis.y;
            const z = axis.z;

            result.data[0 + 0 * 4] = x * x * omc + c;
            result.data[0 + 1 * 4] = y * x * omc + z * s;
            result.data[0 + 2 * 4] = x * z * omc - y * s;

            result.data[1 + 0 * 4] = x * y * omc - z * s;
            result.data[1 + 1 * 4] = y * y * omc + c;
            result.data[1 + 2 * 4] = y * z * omc + x * s;

            result.data[2 + 0 * 4] = x * z * omc + y * s;
            result.data[2 + 1 * 4] = y * z * omc - x * s;
            result.data[2 + 2 * 4] = z * z * omc + c;

            return result;
        }

        pub fn rotate(quat: &const QuatT(T)) -> Self {
            var result = diagonal(1);

            const qx = quat.x;
            const qy = quat.y;
            const qz = quat.z;
            const qw = quat.w;
            const qx2 = ( qx + qx );
            const qy2 = ( qy + qy );
            const qz2 = ( qz + qz );
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
    }
}

// column
// row