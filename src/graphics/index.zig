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

const Platform = @import("platform/index.zig");

pub const Tileset = struct {
  texture: Platform.Texture,
  xtiles: u32,
  ytiles: u32,
};

pub const Tile = struct {
  tx: u32,
  ty: u32,
};

pub const Transform = enum {
  Identity,
  FlipHorizontal,
  FlipVertical,
  RotateClockwise,
  RotateCounterClockwise,
};

// FIXME - use the palette!
pub const Color = struct {
  r: u8,
  g: u8,
  b: u8,
  a: u8,
};

pub const SolidParams = struct {
  color: Color,
};

pub const OutlineParams = struct {
  color: Color,
};

pub const RectStyle = union(enum) {
  Solid: SolidParams,
  Outline: OutlineParams,
};
