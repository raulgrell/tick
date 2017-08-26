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
    player_start_position: Vec2,
    player_end_position: Vec2,

    pub fn init(level_data: [][]const u8, tile_dimensions: &const Vec3) -> Level {
        var self = Level {
            .tile_dimensions = tile_dimensions.xy(),
            .level_data = undefined,
            .player_start_position = vec2(0, 0),
            .player_end_position = vec2(0, 0)
        };

        for (level_data) |line, row| {
            std.mem.copy(u8, self.level_data[row][0..], level_data[row][0..]);
            for (line) |sym, col| {
                switch (sym) {
                    // Agents
                    '@' => {
                        self.player_start_position.x = f32(col) * tile_dimensions.x;
                        self.player_start_position.y = f32(row) * tile_dimensions.y;
                        self.level_data[row][col] = ' ';
                    },
                    '$' => {
                        self.player_end_position.x = f32(col) * tile_dimensions.x;
                        self.player_end_position.y = f32(row) * tile_dimensions.y;
                        self.level_data[row][col] = ' ';
                    },
                    else => { },
                }
            }
        }
        return self;
    }

    pub fn getSize(self: &const Level) -> Vec2 {
        vec2(self.level_data[0].len, self.level_data.len)
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
