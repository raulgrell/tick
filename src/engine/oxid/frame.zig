const Gbe = @import("../gbe.zig");
const GameSession = @import("game.zig").GameSession;
const physicsFrame = @import("physics.zig").physicsFrame;
const C = @import("components.zig");
const Prototypes = @import("prototypes.zig");

const AnimationSystem = @import("systems/animation.zig");
const PickupSystem = @import("systems/pickup.zig");

pub fn gameInit(gs: *GameSession) void {
  _ = Prototypes.GameController.spawn(gs);
  _ = Prototypes.PlayerController.spawn(gs);
}

pub fn gamePreFrame(gs: *GameSession) void {
  AnimationSystem.run(gs);
  PickupSystem.run(gs);

  // pickups react to event_collide, spawn event_confer_bonus
  PickupCollideSystem.run(gs);
  // player reacts to event_confer_bonus, gets bonus effect
  PlayerReactionSystem.run(gs);
}

pub fn gamePostFrame(gs: *GameSession) void {
  removeAll(gs, C.EventCollide);
  removeAll(gs, C.EventConferBonus);
  gs.gbe.applyRemovals();
}

fn removeAll(gs: *GameSession, comptime T: type) void {
  var it = gs.gbe.iter(T); while (it.next()) |object| {
    gs.gbe.markEntityForRemoval(object.entity_id);
  }
}
