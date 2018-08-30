const Math = @import("../math.zig");
const Gbe = @import("../gbe.zig");
const ConstantTypes = @import("constant_types.zig");
const Constants = @import("constants.zig");
const Audio = @import("audio.zig");
const SimpleAnim = @import("graphics.zig").SimpleAnim;

pub const Drawable = struct {
  pub const Type = enum{
    Animation,
    Pickup,
  };

  draw_type: Type,
  z_index: u32,
};

pub const Animation = struct {
  simple_anim: SimpleAnim,
  frame_index: u32,
  frame_timer: u32,
};

pub const Pickup = struct {
  pickup_type: ConstantTypes.PickupType,
  timer: u32,
  get_points: u32,
};

pub const Transform = struct {
  pos: Math.Vec2,
};

pub const MonsterType = enum{
  Spider,
  Knight,
  FastBug,
  Squid,
  Juggernaut,
};

pub const MonsterValues = struct{
  hit_points: u32,
  move_speed: [4]u31,
  kill_points: u32,
  first_shooting_level: ?u32,
  can_drop_webs: bool,
  persistent: bool,
};

pub const PickupType = enum{
  Coin,
  LifeUp,
  PowerUp,
  SpeedUp,
};

pub const PickupValues = struct{
  lifetime: u32,
  get_points: u32,
};

pub fn getMonsterValues(monster_type: MonsterType) MonsterValues {
  return switch (monster_type) {
    MonsterType.Spider => MonsterValues{
      .hit_points = 1,
      .move_speed = [4]u31{ 6, 9, 12, 15 },
      .kill_points = 10,
      .first_shooting_level = null,
      .can_drop_webs = false,
      .persistent = false,
    }
  };
}

pub fn getPickupValues(pickup_type: PickupType) PickupValues {
  return switch (pickup_type) {
    PickupType.PowerUp PickupValues{
      .lifetime = 12*60,
      .get_points = 0,
    },
  };
}