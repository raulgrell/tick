use @import("../math/index.zig");

const tick = @import("../tick.zig");
const lib = tick.lib;

const c = @import("../system/c.zig");
const mem = @import("../system/memory.zig");
const app = @import("../app/core.zig");
const cam = @import("../graphics/camera.zig");
const tex = @import("../graphics/renderable.zig");
const render = @import("../graphics/renderer.zig");
const light = @import("../graphics/light.zig");

const ArrayList = lib.ArrayList;
const InputManager = app.InputManager;
const Camera = cam.Camera;
const Texture = tex.Texture;
const IMRenderer = render.IMRenderer;
const BatchRenderer = render.BatchRenderer;

const AGENT_WIDTH  = f32(16.0);
const AGENT_HEIGHT = f32(16.0);
const AGENT_RADIUS = f32(AGENT_WIDTH / 2.0);

pub const Agent = struct {
    position: Vec3,
    dimensions: Vec3,
    colour: Vec4,
    texture: &Texture,
    direction: Vec3,
    velocity: Vec3,
    speed: f32,
    mass: f32,
    radius: f32,
    // ownerCell: ?&Cell,
    cellVectorIndex: usize,

    pub fn init(position: &const Vec3, dimensions: &const Vec3, texture: &Texture) -> Agent {
        Agent {
            .position = *position,
            .dimensions = *dimensions,
            .colour = vec4(0.5,0,0,1),
            .texture = texture,
            .direction = vec3(1, 0, 0),
            .velocity = vec3(0, 0, 0),
            .speed = 1,
            .mass = 1,
            .radius = 1,
            // .ownerCell = null,
            .cellVectorIndex = 0
        }
    }

    pub fn getAngle(self: &Agent) -> f32 {
        const right = vec3(1.0, 0.0);
        const angle = acos(right.dot(self.direction));
        return if(self.direction.y > 0.0) angle else -angle;
    }

    pub fn collideWithLevel(self: &Agent, levelData: [][]u8) -> bool {
        var collideTilePositions = ArrayList(Vec2).init();

        // Check the four corners
        checkTilePosition(levelData, collideTilePositions, self.position.x, self.position.y);
        checkTilePosition(levelData, collideTilePositions, self.position.x, self.position.y + self.HEIGHT);
        checkTilePosition(levelData, collideTilePositions, self.position.x + self.WIDTH, self.position.y);
        checkTilePosition(levelData, collideTilePositions, self.position.x + self.WIDTH, self.position.y + self.HEIGHT);

        // No collisions
        if ( collideTilePositions.size() == 0 ) return false;

        for ( collideTilePositions ) | position | {
            collideWithTile(position);
        }

        return true;
    }

    // Circular Collision
    pub fn collideWithAgent(self: &Agent, agent: &Agent) -> bool {
        const MIN_DISTANCE = AGENT_RADIUS * 2.0;

        const centerPositionA = self.position + vec2(AGENT_RADIUS);
        const centerPositionB = agent.position + vec2(AGENT_RADIUS);

        const distVec = centerPositionA - centerPositionB;
        const distance = distVec.length();

        const collisionDepth = MIN_DISTANCE - distance;

        if ( collisionDepth > 0 ) {
            const collisionDepthVec = distVec.normalize() * collisionDepth;
            self.position += collisionDepthVec / 2.0;
            agent.position -= collisionDepthVec / 2.0;
            return true;
        }

        return false;
    }

    pub fn checkTilePosition(self: &Agent, levelData: [][]u8, collideTilePositions: ArrayList(Vec2), x: f32, y: f32) {
        const cornerPos = vec2(floor(x / TILE_SIZE), floor(y / TILE_SIZE));

        // Don't collide if outside world
        if ( cornerPos.x < 0 or cornerPos.x >= levelData[0].length()
            or cornerPos.y < 0 or cornerPos.y >= levelData.size() ) {
            return;
        }

        if ( levelData[cornerPos.y][cornerPos.x] != ' ' ) {
            collideTilePositions.append(cornerPos * TILE_SIZE + vec2(TILE_RADIUS));
        }
    }

    // Axis Alligned Bounding Box Collision
    pub fn collideWithTile(self: &Agent, tilePosition: &const Vec2) {
        const MIN_DISTANCE = AGENT_RADIUS + TILE_RADIUS;

        const centerPlayerPos = self.position + vec2(AGENT_RADIUS);
        const distVec = centerPlayerPos - tilePosition;
        const xDepth = MIN_DISTANCE - abs(distVec.x);
        const yDepth = MIN_DISTANCE - abs(distVec.y);

        if ( xDepth > 0 or yDepth > 0 ) {
            if ( max(xDepth, 0.0) < max(yDepth, 0.0) ) {
                if ( distVec.x < 0 ) {
                    self.position.x -= xDepth;
                } else {
                    self.position.x += xDepth;
                }
            } else {
                if ( distVec.y < 0 ) {
                    self.position.y -= yDepth;
                } else {
                    self.position.y += yDepth;
                }
            }
        }
    }

    pub fn draw(self: &const Agent,  r: &IMRenderer) {
        r.draw_rect(self.texture, self.position.x(), self.position.y(), AGENT_WIDTH, AGENT_HEIGHT);
    }

    pub fn submit(self: &const Agent,  r: &BatchRenderer) {
        const destRect = Vec4(self.position.x, self.position.y, AGENT_WIDTH, AGENT_HEIGHT);
        const uvRect = Vec4(0.0, 0.0, 1.0, 1.0);
        r.submit(destRect, uvRect, self.textureID, 1.0, self.colour, self.direction);
    }

    pub fn drawDebug(self: &const Agent, r: &LineRenderer) {
        const radius = self.dimensions.x / 2.0;
        const center = self.position + ( radius );
        r.drawCircle(center, ColourRGBA(255, 255, 255, 255), radius);
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
    
    pub fn update(self: &TopDownPlayer, levelData: []const u8, deltaTime: f32) {
        if(self.input.keyDown[c.GLFW_KEY_W]) self.agent.position.data[1] -= self.agent.speed * deltaTime;
        if(self.input.keyDown[c.GLFW_KEY_S]) self.agent.position.data[1] += self.agent.speed * deltaTime;
        if(self.input.keyDown[c.GLFW_KEY_A]) self.agent.position.data[0] -= self.agent.speed * deltaTime;
        if(self.input.keyDown[c.GLFW_KEY_D]) self.agent.position.data[0] += self.agent.speed * deltaTime;

        // const mouseCoords = self.inputManager.GetMouseCoords();
        // const mouse = self.camera.convertScreenToWorld(mouseCoords.x, mouseCoords.y);
        // self.direction = vec2(mouse.x - self.position.x, mouse.y - self.position.y);

        // collideWithLevel(levelData);
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
    cellSize: usize,
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
            .columns = ceil(width / cellSize),
            .rows = ceil(height / cellSize),
        };
        
        // Allocate all the cells
        %%g.cells.reserve(g.rows * g.columns);

        for ( g.cells.toSlice() ) | *cell, i | {
            %%cell.agents.reserve(reserve);
        }

        return g;
    }

    pub fn add(self: &Grid, agent: &Agent) {
        Cell* cell = getCell(agent.getPosition());
        cell.agents.append(agent);
        agent.ownerCell = cell;
        agent.cellVectorIndex = cell.agents.size() - 1;
    }

    pub fn addToCell(self: &Grid, agent: &Agent, cell: &Cell) {
        cell.agents.append(agent);
        agent.ownerCell = cell;
        agent.cellVectorIndex = cell.agents.size() - 1;
    }

    pub fn getCell(self: &Grid, pos: &const Vec2) -> & Cell {
        const x = int(pos.x / self.cellSize);
        const y = int(pos.y / self.cellSize);

        if ( x < 0 ) x = 0;
        if ( x >= self.columns ) x = self.columns - 1;
        if ( y < 0 ) y = 0;
        if ( y >= self.rows ) y = self.rows - 1;

        return &self.cells[y * self.columns + x];
    }

    pub fn removeFromCell(self: &Grid, agent: &Agent) -> %void {
        var agents = agent.ownerCell.agents;
        // Normal vector swap
        agents[agent.cellVectorIndex] = agents.back();
        agents.pop_back();
        // Update vector index
        if ( agent.cellVectorIndex < agents.size() ) {
            agents[agent.cellVectorIndex].cellVectorIndex = agent.cellVectorIndex;
        }
        // Set the index of agent to -1
        agent.cellVectorIndex = -1;
        agent.ownerCell = nullptr;
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

    pub fn update(self: &Controller, deltaTime: f32) {
        const FRICTION = f32(0.01);
        const gravity = f32(10);

        // for ( self.agents.toSlice() ) | *agent | {
        //     agent.position += agent.velocity * deltaTime;
        //     // Apply friction
        //     const momentumVec = agent.velocity * agent.mass;
        //     if ( momentumVec.x != 0 or momentumVec.y != 0 ) {
        //         if ( FRICTION < momentumVec.length() ) {
        //             agent.velocity -= momentumVec.normalize() * deltaTime * FRICTION / agent.mass;
        //         }
        //         else {
        //             agent.velocity = vec2(0.0);
        //         }
        //     }

        //     // Apply gravity
        //     agent.velocity += gravity * deltaTime;

        //     // Check wall collision
        //     if ( agent.position.x < agent.radius ) {
        //         agent.position.x = agent.radius;
        //         if ( agent.velocity.x < 0 ) agent.velocity.x *= -1;
        //     }
        //     else if ( agent.position.x + agent.radius >= self.rect.data[2] ) {
        //         agent.position.x = self.rect.data[2] - agent.radius - 1;
        //         if ( agent.velocity.x > 0 ) agent.velocity.x *= -1;
        //     }
        //     if ( agent.position.y < agent.radius ) {
        //         agent.position.y = agent.radius;
        //         if ( agent.velocity.y < 0 ) agent.velocity.y *= -1;
        //     }
        //     else if ( agent.position.y + agent.radius >= self.rect.data[3] ) {
        //         agent.position.y = self.rect.data[3] - agent.radius - 1;
        //         if ( agent.velocity.y > 0 ) agent.velocity.y *= -1;
        //     }

        //     // Check to see if the agent moved
        //     const newCell = self.grid.getCell(agent.position);
        //     if ( newCell != agent.ownerCell ) {
        //         self.grid.removeFromCell(agent);
        //         self.grid.add(agent, newCell);
        //     }
        // }
        // // Updates all collisions using the spatial partitioning
        // updateCollisions(&self.grid);
    }

    fn updateCollisions(grid: &Grid) {
        for ( grid.cells.toSlice() ) | cell, i | {
            const x: int = i % grid.columns;
            const y: int = i / grid.columns;

            // Loop through all agents in a cell
            for ( cell.agents.toSlice() ) | agent | {
                /// Update with the residing cell
                checkCollisions(agent, cell.agents, j + 1);

                /// Update collision with neighbor cells
                if ( x > 0 ) {
                    // Left
                    checkCollisions(agent, grid.getCell(x - 1, y).agents, 0);
                    if ( y > 0 ) {
                        /// Top left
                        checkCollisions(agent, grid.getCell(x - 1, y - 1).agents, 0);
                    }
                    if ( y < grid.rows - 1 ) {
                        // Bottom left
                        checkCollisions(agent, grid.getCell(x - 1, y + 1).agents, 0);
                    }
                }
                // Up cell
                if ( y > 0 ) {
                    checkCollisions(agent, grid.getCell(x, y - 1).agents, 0);
                }
            }
        }
    }

    fn checkCollisions(agent: &Agent, check: ArrayList(Agent), startingIndex: usize) {
        for ( check.toSlice() ) | other | {
            checkCollision(*agent, *other);
        }
    }

    fn checkCollision(agent1: &Agent, agent2: &Agent) {
        // We add radius since position is the top left corner
        const distVec = agent2.position - agent1.position;
        const distDir = normalize(distVec);
        const dist = length(distVec);
        const totalRadius = agent1.radius + agent2.radius;
        const collisionDepth = totalRadius - dist;
        if ( collisionDepth > 0 ) {
            // Push away the less massive one
            if ( agent1.mass < agent2.mass ) {
                agent1.position -= distDir * collisionDepth;
            }
            else {
                agent2.position += distDir * collisionDepth;
            }
            const aci = agent1.velocity.dot(distDir);
            const bci = agent2.velocity.dot(distDir);
            const acf = ( aci * ( agent1.mass - agent2.mass ) + 2 * agent2.mass * bci ) / ( agent1.mass + agent2.mass );
            const bcf = ( bci * ( agent2.mass - agent1.mass ) + 2 * agent1.mass * aci ) / ( agent1.mass + agent2.mass );
            agent1.velocity += distDir * ( acf - aci );
            agent2.velocity += distDir * ( bcf - bci );
        }
    }
};

