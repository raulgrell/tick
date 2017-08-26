const math = @import("std").math;

use @import("../math/index.zig");
use @import("../system/index.zig");

const lib = @import("../tick.zig").lib;
const app = @import("../app/core.zig");
const tex = @import("../graphics/sprite.zig");
const render = @import("../graphics/renderer.zig");
const light = @import("../graphics/light.zig");

const lev = @import("level.zig");
const cam = @import("scene.zig");

const ArrayList = lib.ArrayList;
const Level = lev.Level;
const InputManager = app.InputManager;
const Camera = cam.Camera;
const Texture = tex.Texture;
const IMRenderer = render.IMRenderer;
const BatchRenderer = render.BatchRenderer;

pub const Agent = struct {
    position: Vec3,
    dimensions: Vec3,
    color: Vec4,
    texture: &Texture,
    direction: Vec3,
    velocity: Vec3,
    speed: f32,
    mass: f32,
    radius: f32,
    ownerCell: ?&Cell,
    cellVectorIndex: usize,

    pub fn init(position: &const Vec3, dimensions: &const Vec3, texture: &Texture) -> Agent {
        Agent {
            .position = *position,
            .dimensions = *dimensions,
            .color = vec4(0.5,0,0,1),
            .texture = texture,
            .direction = vec3(1, 0, 0),
            .velocity = vec3(0, 0, 0),
            .speed = 2,
            .mass = 1,
            .radius = 1,
            .ownerCell = null,
            .cellVectorIndex = 0
        }
    }

    pub fn draw(self: &const Agent,  r: &IMRenderer) {
        r.draw_rect(self.texture, self.position.x, self.position.y, self.dimensions.x, self.dimensions.y);
    }

    pub fn submit(self: &const Agent,  r: &BatchRenderer) {
        const destRect = Vec4(self.position.x, self.position.y, self.dimensions.x, self.dimensions.y);
        const uvRect = Vec4(0.0, 0.0, 1.0, 1.0);
        r.submit(destRect, uvRect, self.textureID, 1.0, self.colour, self.direction);
    }

    pub fn drawDebug(self: &const Agent, r: &LineRenderer) {
        const radius = self.dimensions.x / 2.0;
        const center = self.position + ( radius );
        r.drawCircle(center, ColourRGBA(255, 255, 255, 255), radius);
    }

    pub fn getAngle(self: &const Agent) -> f32 {
        const right = vec3(1.0, 0.0);
        const angle = math.acos(right.dot(self.direction));
        return if(self.direction.y > 0.0) angle else -angle;
    }

    pub fn collideWithLevel(self: &Agent, level: &Level) -> bool {
        var collision_positions = ArrayList(Vec2).init(&mem.mem);

        checkTilePosition(level, &collision_positions, self.position.x, self.position.y);
        checkTilePosition(level, &collision_positions, self.position.x, self.position.y + self.dimensions.y);
        checkTilePosition(level, &collision_positions, self.position.x + self.dimensions.x , self.position.y);
        checkTilePosition(level, &collision_positions, self.position.x + self.dimensions.x , self.position.y + self.dimensions.y);

        if ( collision_positions.length == 0 )
            return false;

        for ( collision_positions.toSlice() ) | pos | 
            self.collideWithTile(pos, level.tile_dimensions);

        return true;
    }

    // Circular Collision
    pub fn collideWithAgent(self: &Agent, other: &Agent) -> bool {
        const MIN_DISTANCE = AGENT_RADIUS * 2.0;

        const self_center = self.position.add(self.dimensions.mul_scalar(0.5).xy());
        const other_center = other.position.add(other.dimensions.mul_scalar(0.5).xy());
        const dist_vec = self_center.sub(other_center);

        const distance = dist_vec.length();
        const collisionDepth = MIN_DISTANCE - distance;

        if ( collisionDepth > 0 ) {
            const collision_vec = dist_vec.normalize().mul(collisionDepth);
            self.position.offset(collision_vec.mul_scalar(2.0));
            other.position.offset(collision_vec.mul_scalar(-2.0));
            return true;
        }

        return false;
    }

    // Axis Alligned Bounding Box Collision
    pub fn collideWithTile(self: &Agent, tilePosition: &const Vec2, tile_dimensions: &const Vec2) {
        const min_distance_x = self.dimensions.x / 2 + tile_dimensions.x / 2;
        const min_distance_y = self.dimensions.y / 2 + tile_dimensions.y / 2;

        const centerPlayerPos = self.position.add(self.dimensions.div_scalar(2));
        const dist_vec = centerPlayerPos.sub(vec3(tilePosition.x, tilePosition.y, 0));
        const xDepth = min_distance_x - math.fabs(dist_vec.x);
        const yDepth = min_distance_y - math.fabs(dist_vec.y);

        if ( xDepth > 0 or yDepth > 0 ) {
            if ( math.max(xDepth, f32(0)) < math.max(yDepth, f32(0)) ) {
                if ( dist_vec.x < 0 ) {
                    self.position.x -= xDepth;
                } else {
                    self.position.x += xDepth;
                }
            } else {
                if ( dist_vec.y < 0 ) {
                    self.position.y -= yDepth;
                } else {
                    self.position.y += yDepth;
                }
            }
        }
    }

    fn checkTilePosition(level: &Level, collision_positions: &ArrayList(Vec2), x: f32, y: f32) {
        const corner_position = UVec2.init(
            usize(math.floor(x / level.tile_dimensions.x)),
            usize(math.floor(y / level.tile_dimensions.y))
        );

        // Don't collide if outside world
        if ( corner_position.x < 0 or corner_position.x >= level.getWidth()
            or corner_position.y < 0 or corner_position.y >= level.getHeight()) {
            return;
        }

        if ( level.level_data[corner_position.y][corner_position.x] != ' ' ) {
            const collision_pos = corner_position
                .mul_scalar(usize(level.tile_dimensions.x))
                .cast(f32)
                .add(level.tile_dimensions.div_scalar(2));
            %%collision_positions.append( vec2(collision_pos.x, collision_pos.y) );
        }
    }
};

pub const Player = struct {
    agent: &Agent,
    input: &InputManager,
    camera: &Camera,

    pub fn init(agent: &Agent, inputManager: &InputManager, camera: &Camera) -> Player {
        Player {
            .agent = agent,
            .input = inputManager,
            .camera = camera,
        }
    }
};

pub const TopDownPlayer = struct {
    agent: &Agent,
    input: &InputManager,
    camera: &Camera,

    pub fn init(agent: &Agent, inputManager: &InputManager, camera: &Camera)  -> TopDownPlayer {
        var p = TopDownPlayer {
            .agent = agent,
            .input = inputManager,
            .camera = camera,
        };
        return p;
    }
    
    pub fn update(self: &TopDownPlayer, level: &Level, delta_time: f32) {
        if(self.input.keyDown[c.GLFW_KEY_W]) self.agent.position.y -= self.agent.speed * delta_time;
        if(self.input.keyDown[c.GLFW_KEY_S]) self.agent.position.y += self.agent.speed * delta_time;
        if(self.input.keyDown[c.GLFW_KEY_A]) self.agent.position.x -= self.agent.speed * delta_time;
        if(self.input.keyDown[c.GLFW_KEY_D]) self.agent.position.x += self.agent.speed * delta_time;

        // const mouse = self.camera.convertScreenToWorld(self.input.cursor_position);
        // self.agent.direction = mouse.sub(self.agent.position);

        _ = self.agent.collideWithLevel(level);
    }
};

pub const Cell = struct {
    agents: ArrayList(Agent),

    pub fn init() -> Cell {
        Cell { .agents = ArrayList(Agent).init(&mem.mem) }
    }
};

const ceil = usize;

pub const Grid = struct {
    cells: ArrayList(Cell),
    cellSize: f32,
    width: f32,
    height: f32,
    columns: usize,
    rows: usize,

    pub fn init(width: f32, height: f32, cellSize: f32, reserve: usize) -> Grid {
        var g = Grid {
            .cells = ArrayList(Cell).init(&mem.mem),
            .cellSize = 1,
            .width = width,
            .height = height,
            .columns = usize(math.ceil(width / cellSize)),
            .rows = usize(math.ceil(height / cellSize)),
        };
        
        // Allocate all the cells
        %%g.cells.reserve(g.rows * g.columns);

        for ( g.cells.data ) | *cell, i | {
            %%cell.agents.reserve(reserve);
        }

        return g;
    }

    pub fn add(self: &Grid, agent: &Agent) {
        var cell = self.getCellAt(agent.position.xy());
        %%cell.agents.append(agent);
        agent.ownerCell = cell;
        agent.cellVectorIndex = cell.agents.length - 1;
    }

    pub fn addToCell(self: &Grid, agent: &Agent, cell: &Cell) {
        %%cell.agents.append(agent);
        agent.ownerCell = cell;
        agent.cellVectorIndex = cell.agents.length - 1;
    }

    pub fn getCellAt(self: &Grid, pos: &const Vec2) -> &Cell {
        var x = usize(pos.x / self.cellSize);
        var y = usize(pos.y / self.cellSize);
        return self.getCell(x, y);
    }

    pub fn getCell(self: &Grid, x: usize, y: usize) -> &Cell {
        const col = if ( x < 0 ) 0 else if ( x >= self.columns ) self.columns - 1 else x;
        const row = if ( y < 0 ) 0 else if ( y >= self.rows ) self.rows - 1 else y;

        return &self.cells.data[row * self.columns + col];
    }

    pub fn removeFromCell(self: &Grid, agent: &Agent) -> void {
        var agents = (agent.ownerCell ?? return).agents;
        // Normal vector swap
        agents.data[agent.cellVectorIndex] = agents.back();
        _ = agents.pop_back();
        // Update vector index
        if ( agent.cellVectorIndex < agents.length ) {
            agents.data[agent.cellVectorIndex].cellVectorIndex = agent.cellVectorIndex;
        }
        // Set the index of agent to -1
        agent.cellVectorIndex = -1;
        agent.ownerCell = null;
    }
};

pub const Controller = struct {
    agents: ArrayList(Agent),
    grid: Grid,
    rect: Vec4,

    pub fn init(width: f32, height: f32) -> Controller {
        Controller {
            .agents = ArrayList(Agent).init(&mem.mem),
            .grid = Grid.init(width, height, 100, 10),
            .rect = vec4(0, 0, width, height),
        }
    }

    pub fn add(self: &Controller, agent: &Agent) {
        self.grid.add(agent);
    }

    pub fn update(self: &Controller, delta_time: f32) {
        const friction = f32(0.01);
        const gravity = vec2(0, 10);

        for ( self.agents.data ) | *agent | {
            _ = agent.position.offset(agent.velocity.mul_scalar(delta_time));
            
            // Apply friction
            const momentumVec = agent.velocity.mul_scalar(agent.mass);
            if ( momentumVec.x != 0 or momentumVec.y != 0 ) {
                if ( friction < momentumVec.length() ) {
                    _ = agent.velocity.offset(momentumVec.normalize().mul_scalar(-friction / agent.mass * delta_time));
                } else {
                    agent.velocity = vec3(0, 0, 0);
                }
            }

            // Apply gravity
            _ = agent.velocity.offset(gravity.mul_scalar(delta_time).xyz());

            // Check to see if the agent moved
            if (agent.ownerCell) | cell | {
                const newCell = self.grid.getCellAt(agent.position.xy());
                if ( newCell != cell ) {
                    self.grid.removeFromCell(agent);
                    self.grid.addToCell(agent, newCell);
                }
            }
        }
        // Updates all collisions using the spatial partitioning
        updateCollisions(&self.grid);
    }

    fn updateCollisions(grid: &Grid) {
        for ( grid.cells.toSlice() ) | *cell, i | {
            const x = i % grid.columns;
            const y = i / grid.columns;

            // Loop through all agents in a cell
            for ( cell.agents.toSlice() ) | *agent, j | {
                /// Update with the residing cell
                checkCollisions(agent, &cell.agents, j + 1);

                /// Update collision with neighbor cells
                if ( x > 0 ) {
                    // Left
                    checkCollisions(agent, &grid.getCell(x - 1, y).agents, 0);
                    if ( y > 0 ) {
                        /// Top left
                        checkCollisions(agent, &grid.getCell(x - 1, y - 1).agents, 0);
                    }
                    if ( y < grid.rows - 1 ) {
                        // Bottom left
                        checkCollisions(agent, &grid.getCell(x - 1, y + 1).agents, 0);
                    }
                }
                // Up cell
                if ( y > 0 ) {
                    checkCollisions(agent, &grid.getCell(x, y - 1).agents, 0);
                }
            }
        }
    }

    fn checkCollisions(agent: &Agent, check: &ArrayList(Agent), startingIndex: usize) {
        for ( check.toSlice() ) | *other | {
            checkCollision(agent, other);
        }
    }

    fn checkCollision(agent1: &Agent, agent2: &Agent) {
        // We add radius since position is the top left corner
        const dist_vec = agent2.position.sub(agent1.position);
        const distDir = dist_vec.normalize();
        const dist = dist_vec.length();
        const totalRadius = agent1.radius + agent2.radius;
        const collisionDepth = totalRadius - dist;
        if ( collisionDepth > 0 ) {
            // Push away the less massive one
            if ( agent1.mass < agent2.mass ) {
                _ = agent1.position.offset(distDir.mul_scalar(-collisionDepth));
            } else {
                _ = agent2.position.offset(distDir.mul_scalar(collisionDepth));
            }
            const aci = agent1.velocity.dot(distDir);
            const bci = agent2.velocity.dot(distDir);
            const acf = ( aci * ( agent1.mass - agent2.mass ) + 2 * agent2.mass * bci ) / ( agent1.mass + agent2.mass );
            const bcf = ( bci * ( agent2.mass - agent1.mass ) + 2 * agent1.mass * aci ) / ( agent1.mass + agent2.mass );

            _ = agent1.velocity.offset(distDir.mul_scalar( acf - aci ));
            _ = agent2.velocity.offset(distDir.mul_scalar( bcf - bci ));
        }
    }
};

