const Math = @import("../../math.zig");
const boxesOverlap = @import("../../boxes_overlap.zig").boxesOverlap;
const Gbe = @import("../../gbe.zig");
const GbeSystem = @import("../../gbe_system.zig");
const Constants = @import("../constants.zig");
const GRIDSIZE_SUBPIXELS = @import("../level.zig").GRIDSIZE_SUBPIXELS;
const LEVEL = @import("../level.zig").LEVEL;
const Audio = @import("../audio.zig");
const GameSession = @import("../game.zig").GameSession;
const GameUtil = @import("../util.zig");
const physInWall = @import("../physics.zig").physInWall;
const getLineOfFire = @import("../functions/get_line_of_fire.zig").getLineOfFire;
const C = @import("../components.zig");
const Prototypes = @import("../prototypes.zig");

const SystemData = struct{
  id: Gbe.EntityId,
  creature: *const C.Creature,
  player: *C.Player,
  transform: *const C.Transform,
};

pub const run = GbeSystem.build(GameSession, SystemData, process);

fn process(gs: *GameSession, self: SystemData) bool {
  playerUpdate(gs, self);
  playerMove(gs, self);
  return true;
}

fn playerUpdate(gs: *GameSession, self: SystemData) void {
    var it = gs.gbe.eventIter(C.EventConferBonus, "recipient_id", self.id); while (it.next()) |event| {
    switch (event.pickup_type) {
      ConstantTypes.PickupType.PowerUp => {
        _ = Prototypes.EventSound.spawn(gs, C.EventSound{ .sample = Audio.Sample.PowerUp, });
        self.player.attack_level = switch (self.player.attack_level) {
          C.Player.AttackLevel.One => C.Player.AttackLevel.Two,
          else => C.Player.AttackLevel.Three,
        };
        self.player.last_pickup = ConstantTypes.PickupType.PowerUp;
      }
    }
  }
  return true;
}

fn playerMove(gs: *GameSession, self: SystemData) void {
}