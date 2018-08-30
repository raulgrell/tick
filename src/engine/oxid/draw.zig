const SortItem = struct {
  object: *Gbe.ComponentObject(C.Drawable),
  z_index: u32,
};

pub fn drawGame(g: *GameState) void {
  const gs = &g.session;

  // sort drawables
  perf.begin(&perf.timers.DrawSort);
  var sortarray: [MaxDrawables]SortItem = undefined;
  var num_drawables: usize = 0;
  var it = gs.gbe.iter(C.Drawable); while (it.next()) |object| {
    if (object.is_active) {
      sortarray[num_drawables] = SortItem{
        .object = object,
        .z_index = object.data.z_index,
      };
      num_drawables += 1;
    }
  }
  var sortslice = sortarray[0..num_drawables];
  std.sort.sort(SortItem, sortslice, lessThanField(SortItem, "z_index"));
  perf.end(&perf.timers.DrawSort, g.perf_spam);

  // actually draw
  Platform.drawBegin(&g.platform_state, g.tileset.texture.handle);

  perf.begin(&perf.timers.DrawMap);
  drawMap(g);
  perf.end(&perf.timers.DrawMap, g.perf_spam);

  perf.begin(&perf.timers.DrawEntities);
  for (sortslice) |sort_item| {
    const object = sort_item.object;
    switch (object.data.draw_type) {
      C.Drawable.Type.Animation => drawAnimation(g, object.entity_id),
      C.Drawable.Type.Pickup => drawPickup(g, object.entity_id),
    }
  }
  perf.end(&perf.timers.DrawEntities, g.perf_spam);

  Platform.drawEnd(&g.platform_state);

  if (g.render_move_boxes) {
    var it2 = gs.gbe.iter(C.PhysObject); while (it2.next()) |object| {
      const int = object.data.internal;
      drawBox(g, int.move_bbox, Draw.Color{
        .r = @intCast(u8, 64 + ((int.group_index * 41) % 192)),
        .g = @intCast(u8, 64 + ((int.group_index * 901) % 192)),
        .b = @intCast(u8, 64 + ((int.group_index * 10031) % 192)),
        .a = 255,
      });
    }
    var it3 = gs.gbe.iter(C.Player); while (it3.next()) |object| {
      if (object.data.line_of_fire) |box| {
        drawBox(g, box, Draw.Color{
          .r = 0,
          .g = 0,
          .b = 0,
          .a = 255,
        });
      }
    }
    var it4 = gs.gbe.iter(C.Bullet); while (it4.next()) |object| {
      if (object.data.line_of_fire) |box| {
        drawBox(g, box, Draw.Color{
          .r = 0,
          .g = 0,
          .b = 0,
          .a = 255,
        });
      }
    }
  }

  perf.begin(&perf.timers.DrawHud);
  drawHud(g);
  perf.end(&perf.timers.DrawHud, g.perf_spam);
}

// helper
fn alternation(comptime T: type, variable: T, half_period: T) bool {
  return @mod(@divFloor(variable, half_period), 2) == 0;
}

fn drawAnimation(g: *GameState, entity_id: Gbe.EntityId) void {
  const animation = g.session.gbe.find(entity_id, C.Animation) orelse return;
  const transform = g.session.gbe.find(entity_id, C.Transform) orelse return;
  const animcfg = getSimpleAnim(animation.simple_anim);
  std.debug.assert(animation.frame_index < animcfg.frames.len);
  const graphic = animcfg.frames[animation.frame_index];
  drawBlock(g, transform.pos, graphic, Draw.Transform.Identity);
}

fn drawPickup(g: *GameState, entity_id: Gbe.EntityId) void {
  const pickup = g.session.gbe.find(entity_id, C.Pickup) orelse return;
  const transform = g.session.gbe.find(entity_id, C.Transform) orelse return;
  const graphic = switch (pickup.pickup_type) {
    ConstantTypes.PickupType.PowerUp => Graphic.PowerUp,
    ConstantTypes.PickupType.SpeedUp => Graphic.SpeedUp,
    ConstantTypes.PickupType.LifeUp => Graphic.LifeUp,
    ConstantTypes.PickupType.Coin => Graphic.Coin,
  };
  drawBlock(g, transform.pos, graphic, Draw.Transform.Identity);
}

fn drawMap(g: *GameState) void {
  var y: u31 = 0;
  while (y < LEVEL.h) : (y += 1) {
    var x: u31 = 0;
    while (x < LEVEL.w) : (x += 1) {
      const gridpos = Math.Vec2.init(x, y);
      if (switch (LEVEL.getGridValue(gridpos).?) {
        0x00 => Graphic.Floor,
        0x80 => Graphic.Wall,
        0x81 => Graphic.Wall2,
        0x82 => Graphic.Pit,
        0x83 => Graphic.EvilWallTL,
        0x84 => Graphic.EvilWallTR,
        0x85 => Graphic.EvilWallBL,
        0x86 => Graphic.EvilWallBR,
        else => null,
      }) |graphic| {
        mapTile(g, Math.Vec2.scale(gridpos, GRIDSIZE_SUBPIXELS), graphic);
      }
    }
  }
}

fn drawBlock(g: *GameState, pos: Math.Vec2, graphic: Graphic, transform: Draw.Transform) void {
  const x = @intToFloat(f32, @divFloor(pos.x, Math.SUBPIXELS));
  const y = @intToFloat(f32, @divFloor(pos.y, Math.SUBPIXELS)) + HUD_HEIGHT;
  const w = GRIDSIZE_PIXELS;
  const h = GRIDSIZE_PIXELS;
  Platform.drawTile(
    &g.platform_state,
    &g.tileset,
    getGraphicTile(graphic),
    x, y, w, h, transform,
  );
}

fn drawBox(g: *GameState, abs_bbox: Math.BoundingBox, color: Draw.Color) void {
  const x0 = @intToFloat(f32, @divFloor(abs_bbox.mins.x, Math.SUBPIXELS));
  const y0 = @intToFloat(f32, @divFloor(abs_bbox.mins.y, Math.SUBPIXELS)) + HUD_HEIGHT;
  const x1 = @intToFloat(f32, @divFloor(abs_bbox.maxs.x + 1, Math.SUBPIXELS));
  const y1 = @intToFloat(f32, @divFloor(abs_bbox.maxs.y + 1, Math.SUBPIXELS)) + HUD_HEIGHT;
  const w = x1 - x0;
  const h = y1 - y0;
  Platform.drawUntexturedRect(
    &g.platform_state,
    x0, y0, w, h,
    color,
    true,
  );
}

fn mapTile(g: *GameState, pos: Math.Vec2, graphic: Graphic) void {
  const x = @intToFloat(f32, @divFloor(pos.x, Math.SUBPIXELS));
  const y = @intToFloat(f32, @divFloor(pos.y, Math.SUBPIXELS)) + HUD_HEIGHT;
  const w = GRIDSIZE_PIXELS;
  const h = GRIDSIZE_PIXELS;
  Platform.drawTile(
    &g.platform_state,
    &g.tileset,
    getGraphicTile(graphic),
    x, y, w, h, Draw.Transform.Identity,
  );
}
