// Core
pub const core      = @import("core/index.zig");
pub const audio     = @import("core/audio.zig");
pub const c         = @import("core/c.zig");
pub const debug     = @import("core/debug.zig");
pub const gui       = @import("core/gui.zig");
pub const io        = @import("core/io.zig");
pub const system    = @import("core/system.zig");
pub const window    = @import("core/window.zig");

// Engine
pub const engine    = @import("engine/index.zig");
pub const graphics  = @import("engine/draw.zig");
pub const agent     = @import("engine/agent.zig");
pub const entity    = @import("engine/entity.zig");
pub const physics   = @import("engine/physics.zig");
pub const scene     = @import("engine/scene.zig");

// Graphics
pub const graphics  = @import("engine/index.zig");
pub const drawing   = @import("graphics/drawing.zig");
pub const light     = @import("graphics/light.zig");
pub const particle  = @import("graphics/particle.zig");
pub const primitive = @import("graphics/primitive.zig");
pub const shader    = @import("graphics/shader.zig");
pub const sprite    = @import("graphics/sprite.zig");
pub const texture   = @import("graphics/texture.zig");

// Math
pub const math      = @import("math/index.zig");
pub const easing    = @import("math/easing.zig");
pub const geometry  = @import("math/geometry.zig");
pub const hash      = @import("math/hash.zig");
pub const mat       = @import("math/mat.zig");
pub const quat      = @import("math/quat.zig");
pub const vec       = @import("math/vec.zig");