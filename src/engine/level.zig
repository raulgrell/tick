const math = @import("std").math;

use @import("../math/index.zig");
use @import("../system/index.zig");

const lib = @import("../tick.zig").lib;
const app = @import("../app/core.zig");
const tex = @import("../graphics/sprite.zig");
const render = @import("../graphics/renderer.zig");
const light = @import("../graphics/light.zig");

const IMRenderer = render.IMRenderer;
const Texture = tex.Texture;

pub const Level = struct {
    tile_dimensions: Vec2,
    level_data: [9][16]u8,
    start: Vec2,
    end: Vec2,

    pub fn init(level_data: []const []const u8, tile_dimensions: &const Vec3) -> Level {
        var self = Level {
            .tile_dimensions = tile_dimensions.xy(),
            .level_data = undefined,
            .start = vec2(0, 0),
            .end = vec2(0, 0)
        };

        for (level_data) |line, row| {
            std.mem.copy(u8, self.level_data[row][0..], level_data[row][0..]);
            for (line) |sym, col| {
                switch (sym) {
                    // Agents
                    '@' => {
                        self.start.x = f32(col) * tile_dimensions.x;
                        self.start.y = f32(row) * tile_dimensions.y;
                        self.level_data[row][col] = ' ';
                    },
                    '$' => {
                        self.end.x = f32(col) * tile_dimensions.x;
                        self.end.y = f32(row) * tile_dimensions.y;
                        self.level_data[row][col] = ' ';
                    },
                    else => { },
                }
            }
        }

        return self;
    }

    pub fn getSize(self: &const Level) -> UVec2 {
        UVec2.init(self.level_data[0].len, self.level_data.len)
    }

    pub fn getCenter(self: &const Level) -> Vec2 {
        const x = f32(self.level_data[0].len / 2) * self.tile_dimensions.x;
        const y = f32(self.level_data.len / 2) * self.tile_dimensions.y;
        return Vec2.init(x, y)
    }

    pub fn getWidth(self: &const Level) -> usize {
        return self.level_data[0].len; 
    }
    
    pub fn getHeight(self: &const Level) -> usize {
        return self.level_data.len; 
    }

    pub fn draw(self: &const Level, renderer: &IMRenderer, tile_map: []?Texture) {
        const uvRect = vec4(0.0, 0.0, 1.0, 1.0);
        const dimensions = self.tile_dimensions;
        for (self.level_data) |line, row| {
            for (line) |sym, col| {
                const pos_x = f32(col) * dimensions.x;
                const pos_y = f32(row) * dimensions.y;
                if (tile_map[sym]) | *tx | {
                    renderer.draw_rect(tx, pos_x, pos_y, dimensions.x, dimensions.y);                    
                }
            }
        }
    }

    pub fn save(file_path: []const u8, player: &TopDownPlayer, boxes: &ArrayList(Box), lights: &ArrayList(Light)) {
    }

    pub fn load(file_path: []const u8, player: &TopDownPlayer, boxes: &ArrayList(Box), lights: &ArrayList(Light)) {
    }
};

pub fn Tiles(comptime C: u32, comptime R: u32) -> type {
    struct {
        color: Vec4,
        tiles: [R][C]u8,

        const Self = this;

        fn renderTiles(self: &Self, position: &const Vec2, tile_size: f32, renderer: &StripRenderer) {
            for (self.tiles) |row, y| {
                for (row) |tile, x| {
                    switch (tile) {
                        Tile.Color => | color | {
                            const tile_left = position.x + f32(x) * tile_size;
                            const tile_top = position.y + f32(y) * tile_size;
                            renderer.draw(t, color, f32(tile_left), f32(tile_top), tile_Size, tile_Size);
                        },
                        else => {},
                    }
                }
            }
        }
    }
}
