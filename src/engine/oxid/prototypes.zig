const Math = @import("../math.zig");
const Gbe = @import("../gbe.zig");
const SimpleAnim = @import("graphics.zig").SimpleAnim;
const getSimpleAnim = @import("graphics.zig").getSimpleAnim;
const GameSession = @import("game.zig").GameSession;
const GRIDSIZE_PIXELS = @import("level.zig").GRIDSIZE_PIXELS;
const GRIDSIZE_SUBPIXELS = @import("level.zig").GRIDSIZE_SUBPIXELS;
const ConstantTypes = @import("constant_types.zig");
const Constants = @import("constants.zig");
const C = @import("components.zig");

fn make_bbox(diameter: u31) Math.BoundingBox {
  const graphic_diameter = GRIDSIZE_SUBPIXELS;
  const min = graphic_diameter / 2 - diameter / 2;
  const max = graphic_diameter / 2 + diameter / 2 - 1;
  return Math.BoundingBox{
    .mins = Math.Vec2.init(min, min),
    .maxs = Math.Vec2.init(max, max),
  };
}

// all entities are full size for colliding with the level
const world_bbox = make_bbox(GRIDSIZE_SUBPIXELS);
// pickups are 75% size
const pickup_entity_bbox = make_bbox(GRIDSIZE_SUBPIXELS * 3 / 4);

pub const Animation = struct{
  pub const Params = struct{
    pos: Math.Vec2,
    simple_anim: SimpleAnim,
    z_index: u32,
  };

  pub fn spawn(gs: *GameSession, params: Params) !Gbe.EntityId {
    const entity_id = gs.gbe.spawn();
    errdefer gs.gbe.undoSpawn(entity_id);

    try gs.gbe.addComponent(entity_id, C.Transform{
      .pos = params.pos,
    });

    try gs.gbe.addComponent(entity_id, C.Drawable{
      .draw_type = C.Drawable.Type.Animation,
      .z_index = params.z_index,
    });

    try gs.gbe.addComponent(entity_id, C.Animation{
      .simple_anim = params.simple_anim,
      .frame_index = 0,
      .frame_timer = getSimpleAnim(params.simple_anim).ticks_per_frame,
    });

    return entity_id;
  }
};

pub const Pickup = struct{
  pub const Params = struct{
    pos: Math.Vec2,
    pickup_type: ConstantTypes.PickupType,
  };

  pub fn spawn(gs: *GameSession, params: Params) !Gbe.EntityId {
    const pickup_values = Constants.getPickupValues(params.pickup_type);

    const entity_id = gs.gbe.spawn();
    errdefer gs.gbe.undoSpawn(entity_id);

    try gs.gbe.addComponent(entity_id, C.Transform{
      .pos = params.pos,
    });

    try gs.gbe.addComponent(entity_id, C.Drawable{
      .draw_type = C.Drawable.Type.Pickup,
      .z_index = Constants.ZIndexPickup,
    });

    try gs.gbe.addComponent(entity_id, C.Pickup{
      .pickup_type = params.pickup_type,
      .timer = pickup_values.lifetime,
      .get_points = pickup_values.get_points,
    });

    return entity_id;
  }
};

fn Event(comptime T: type) type {
  return struct {
    fn spawn(gs: *GameSession, body: T) !Gbe.EntityId {
      const entity_id = gs.gbe.spawn();
      errdefer gs.gbe.undoSpawn(entity_id);
      try gs.gbe.addComponent(entity_id, body);
      return entity_id;
    }
  };
}

pub const EventCollide = Event(C.EventCollide);
pub const EventConferBonus = Event(C.EventConferBonus);
