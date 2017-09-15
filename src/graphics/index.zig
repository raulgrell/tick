// Core
pub const drawing = @import("drawing.zig");
pub const light = @import("light.zig");
pub const mesh = @import("mesh.zig");
pub const particle = @import("particle.zig");
pub const primitive =  @import("primitive.zig");
pub const shader =  @import("shader.zig");
pub const sprite =  @import("sprite.zig");
pub const texture =  @import("texture.zig");
pub const text =  @import("text.zig");

use @import("../system/index.zig");
use @import("../math/index.zig");

pub const Vertex = struct {
    position: Vec3,
    uv: Vec2,
    colour: Vec4,
};

pub const rectangleVertices = [][3]c.GLfloat {
    []c.GLfloat{0.0, 0.0, 0.0},
    []c.GLfloat{0.0, 1.0, 0.0},
    []c.GLfloat{1.0, 0.0, 0.0},
    []c.GLfloat{1.0, 1.0, 0.0},
};

pub const rectangleUV = [][2]c.GLfloat{
    []c.GLfloat{0, 0},
    []c.GLfloat{0, 1},
    []c.GLfloat{1, 0},
    []c.GLfloat{1, 1},
};

pub const triangleVertices = [][3]c.GLfloat {
    []c.GLfloat{0.0, 0.0, 0.0},
    []c.GLfloat{0.0, 1.0, 0.0},
    []c.GLfloat{1.0, 0.0, 0.0},
};

pub const triangleUV = [][2]c.GLfloat{
    []c.GLfloat{0, 0},
    []c.GLfloat{0, 1},
    []c.GLfloat{1, 0},
};