const Platform = @import("../platform/index.zig");
const loadPcx = @import("../load_pcx.zig").loadPcx;
const Draw = @import("../draw.zig");

const GRAPHICS_FILENAME = "../assets/mytiles.pcx";
const TRANSPARENT_COLOR_INDEX = 27;

pub const SimpleAnim = enum{
  PlaSparks,
  MonSparks,
  Explosion,
};

pub const SimpleAnimConfig = struct{
  frames: []const Graphic,
  ticks_per_frame: u32,
};

pub fn getSimpleAnim(simpleAnim: SimpleAnim) SimpleAnimConfig {
  return switch (simpleAnim) {
    SimpleAnim.Explosion => SimpleAnimConfig{
      .frames = ([4]Graphic{
        Graphic.Explode1,
        Graphic.Explode2,
        Graphic.Explode3,
        Graphic.Explode4,
      })[0..],
      .ticks_per_frame = 6,
    }
  };
}

pub fn loadTileset(dsaf: *DoubleStackAllocatorFlat, out_tileset: *Draw.Tileset) !void {
  const low_mark = dsaf.get_low_mark();
  defer dsaf.free_to_low_mark(low_mark);

  const img = try loadPcx(dsaf, GRAPHICS_FILENAME, TRANSPARENT_COLOR_INDEX);

  out_tileset.texture = Platform.uploadTexture(img);
  out_tileset.xtiles = 8;
  out_tileset.ytiles = 8;
}
