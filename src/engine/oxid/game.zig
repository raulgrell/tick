const builtin = @import("builtin");
const std = @import("std");
const assert = std.debug.assert;

const Gbe = @import("../gbe.zig");
const Constants = @import("constants.zig");
const C = @import("components.zig");

const COMPONENT_TYPES = []const type{
  C.Animation,
  C.Pickup,
};

pub fn ComponentStorage(comptime T: type, comptime capacity: usize) type {
  return struct{
    objects: [capacity]Gbe.ComponentObject(T),
  };
}

pub const MaxDrawables = 100;
pub const MaxPhysObjects = 100;

// FIXME - is there any way to generate this from COMPONENT_TYPES.
// there is other code that assumes the type name is the same as the field name
// so it's bad to write this out...
pub const GameComponentStorage = struct {
  Animation: ComponentStorage(C.Animation, 10),
  Pickup: ComponentStorage(C.Pickup, 5),
};

// FIXME - is there any way to generate this from COMPONENT_TYPES.
// there is other code that assumes the type name is the same as the field name
// so it's bad to write this out...
pub const GameComponentLists = struct {
  Animation: Gbe.ComponentList(C.Animation),
  Pickup: Gbe.ComponentList(C.Pickup),
};

pub const GameSession = struct {
  component_storage: GameComponentStorage,
  gbe: Gbe.Session(COMPONENT_TYPES[0..], GameComponentLists),

  god_mode: bool,
  in_left: bool,
  in_right: bool,
  in_up: bool,
  in_down: bool,
  in_shoot: bool,

  pub fn init(self: *GameSession, rand_seed: u32) void {
    self.gbe.init(&self.component_storage, rand_seed);

    self.god_mode = false;
    self.in_up = false;
    self.in_down = false;
    self.in_left = false;
    self.in_right = false;
    self.in_shoot = false;
  }

  pub fn getGameController(self: *GameSession) *C.GameController {
    return &self.gbe.iter(C.GameController).next().?.data;
  }
};
