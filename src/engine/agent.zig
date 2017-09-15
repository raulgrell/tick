const tick = @import("../tick.zig");

use tick.core;
use tick.math;
use tick.system;
use tick.graphics;
use tick.graphics.texture;
use tick.engine.scene;

const ArrayList = lib.ArrayList;
const math = std.math;

pub const Agent = struct {
    position: Vec3,
    // Body
    dimensions: Vec3,
    velocity: Vec3,
    direction: Vec3,
    color: Vec4,
    texture: &Texture,
    speed: f32,
    mass: f32,
    // Collision Detection
    radius: f32,
    // Spatial Partitioning
    owner_cell: ?&Cell,
    cell_array_index: usize,

    pub fn init(position: &const Vec3, dimensions: &const Vec3, speed: f32, agent_texture: &Texture) -> Agent {
        Agent {
            .position = *position,
            .dimensions = *dimensions,
            .color = vec4(0.5,0,0,1),
            .texture = agent_texture,
            .direction = vec3(1, 0, 0),
            .velocity = vec3(0, 0, 0),
            .speed = speed,
            .mass = 1,
            .radius = 1,
            .owner_cell = null,
            .cell_array_index = 0
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
        var collision_positions = ArrayList(Vec2).init(&c.mem);

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
        const collision_depth = MIN_DISTANCE - distance;

        if ( collision_depth > 0 ) {
            const collision_vec = dist_vec.normalize().mul(collision_depth);
            self.position.offset(collision_vec.mul_scalar(2.0));
            other.position.offset(collision_vec.mul_scalar(-2.0));
            return true;
        }

        return false;
    }

    // Axis Alligned Bounding Box Collision
    pub fn collideWithTile(self: &Agent, tile_position: &const Vec2, tile_dimensions: &const Vec2) {
        const min_distance_x = self.dimensions.x / 2 + tile_dimensions.x / 2;
        const min_distance_y = self.dimensions.y / 2 + tile_dimensions.y / 2;

        const player_center = self.position.add(self.dimensions.div_scalar(2));
        const dist_vec = player_center.sub(vec3(tile_position.x, tile_position.y, 0));
        const x_depth = min_distance_x - math.fabs(dist_vec.x);
        const y_depth = min_distance_y - math.fabs(dist_vec.y);

        if ( x_depth > 0 or y_depth > 0 ) {
            if ( math.max(x_depth, f32(0)) < math.max(y_depth, f32(0)) ) {
                if ( dist_vec.x < 0 ) {
                    self.position.x -= x_depth;
                } else {
                    self.position.x += x_depth;
                }
            } else {
                if ( dist_vec.y < 0 ) {
                    self.position.y -= y_depth;
                } else {
                    self.position.y += y_depth;
                }
            }
        }
    }

    fn checkTilePosition(level: &Level, collision_positions: &ArrayList(Vec2), x: f32, y: f32) {
        const corner_position = UVec2.init(
            u32(math.floor(x / level.tile_dimensions.x)),
            u32(math.floor(y / level.tile_dimensions.y))
        );

        // Don't collide if outside world
        if ( corner_position.x < 0 or corner_position.x >= level.getWidth()
            or corner_position.y < 0 or corner_position.y >= level.getHeight()) {
            return;
        }

        if ( level.level_data[corner_position.y][corner_position.x] != ' ' ) {
            const collision_pos = corner_position
                .mul_scalar(u32(level.tile_dimensions.x))
                .cast(f32)
                .add(level.tile_dimensions.div_scalar(2));
            %%collision_positions.append( vec2(collision_pos.x, collision_pos.y) );
        }
    }
};

pub const ImpulsePlayer = struct {
    agent: &Agent,
    input: &InputManager,
    camera: &Camera,

    pub fn init(agent: &Agent, input_manager: &InputManager, camera: &Camera) -> ImpulsePlayer {
        ImpulsePlayer {
            .agent = agent,
            .input = input_manager,
            .camera = camera,
        }
    }

    pub fn update(self: &ImpulsePlayer, level: &Level, delta_time: f32) {
        if(self.input.keyPressed[c.GLFW_KEY_UP]) self.agent.velocity.y = -self.agent.speed * delta_time;
        if(self.input.keyPressed[c.GLFW_KEY_DOWN]) self.agent.velocity.y = self.agent.speed * delta_time;
        if(self.input.keyPressed[c.GLFW_KEY_LEFT]) self.agent.velocity.x = -self.agent.speed * delta_time;
        if(self.input.keyPressed[c.GLFW_KEY_RIGHT]) self.agent.velocity.x = self.agent.speed * delta_time;

        // Apply friction
        const friction = f32(0.1);        
        const momentum_vec = self.agent.velocity.mul_scalar(self.agent.mass);
        if ( momentum_vec.x != 0 or momentum_vec.y != 0 ) {
            if ( friction < momentum_vec.length() ) {
                _ = self.agent.velocity.offset(
                    momentum_vec.normalize().mul_scalar(-friction / self.agent.mass * delta_time)
                );
            } else {
                self.agent.velocity = vec3(0, 0, 0);
            }
        }

        // Apply displacement
        _ = self.agent.position.offset(self.agent.velocity);

        // Check collisions
        _ = self.agent.collideWithLevel(level);
    }
};

pub const TopDownPlayer = struct {
    agent: &Agent,
    input: &InputManager,
    camera: &Camera,

    pub fn init(agent: &Agent, input_manager: &InputManager, camera: &Camera)  -> TopDownPlayer {
        TopDownPlayer {
            .agent = agent,
            .input = input_manager,
            .camera = camera,
        }
    }
    
    pub fn update(self: &TopDownPlayer, level: &Level, delta_time: f32) {
        if(self.input.keyDown[c.GLFW_KEY_W]) self.agent.position.y -= self.agent.speed * delta_time;
        if(self.input.keyDown[c.GLFW_KEY_S]) self.agent.position.y += self.agent.speed * delta_time;
        if(self.input.keyDown[c.GLFW_KEY_A]) self.agent.position.x -= self.agent.speed * delta_time;
        if(self.input.keyDown[c.GLFW_KEY_D]) self.agent.position.x += self.agent.speed * delta_time;
        _ = self.agent.collideWithLevel(level);
    }
};

pub const MousePlayer = struct {
    agent: &Agent,
    input: &InputManager,
    camera: &Camera,

    pub fn init(agent: &Agent, input_manager: &InputManager, camera: &Camera)  -> MousePlayer {
        MousePlayer {
            .agent = agent,
            .input = input_manager,
            .camera = camera,
        }
    }
    
    pub fn update(self: &MousePlayer, level: &Level, delta_time: f32) {
        if(self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
            const mouse_direction = self.input.cursor_position.sub(self.agent.position.xy()).normalize();
            _ = self.agent.position.offset(mouse_direction.mul_scalar(self.agent.speed).xyz());
        }
        _ = self.agent.collideWithLevel(level);
    }
};

pub const Cell = struct {
    agents: ArrayList(&Agent),

    pub fn init() -> Cell {
        Cell { .agents = ArrayList(&Agent).init(&c.mem) }
    }
};

const ceil = usize;

pub const Grid = struct {
    cells: ArrayList(&Cell),
    cellSize: f32,
    width: f32,
    height: f32,
    columns: usize,
    rows: usize,

    pub fn init(width: f32, height: f32, cellSize: f32, reserve: usize) -> Grid {
        var g = Grid {
            .cells = ArrayList(&Cell).init(&c.mem),
            .cellSize = 1,
            .width = width,
            .height = height,
            .columns = usize(math.ceil(width / cellSize)),
            .rows = usize(math.ceil(height / cellSize)),
        };
        
        // Allocate all the cells
        %%g.cells.reserve(g.rows * g.columns);

        for ( g.cells.toSlice() ) | cell, i | {
            %%cell.agents.reserve(reserve);
        }

        return g;
    }

    pub fn add(self: &Grid, agent: &Agent) {
        var cell = self.getCellAt(agent.position.xy());
        self.addToCell(agent, cell);
    }

    pub fn addToCell(self: &Grid, agent: &Agent, cell: &Cell) {
        %%cell.agents.append(agent);
        agent.owner_cell = cell;
        agent.cell_array_index = cell.agents.length - 1;
    }

    pub fn getCellAt(self: &Grid, pos: &const Vec2) -> &Cell {
        var x = usize(pos.x / self.cellSize);
        var y = usize(pos.y / self.cellSize);
        return self.getCell(x, y);
    }

    pub fn getCell(self: &Grid, x: usize, y: usize) -> &Cell {
        const col = if ( x < 0 ) 0 else if ( x >= self.columns ) self.columns - 1 else x;
        const row = if ( y < 0 ) 0 else if ( y >= self.rows ) self.rows - 1 else y;

        return self.cells.data[row * self.columns + col];
    }

    pub fn removeFromCell(self: &Grid, agent: &Agent) -> void {
        var agents = (agent.owner_cell ?? return).agents;
        agents.data[agent.cell_array_index] = agents.last();
        _ = agents.pop();
        if ( agent.cell_array_index < agents.length ) {
            agents.data[agent.cell_array_index].cell_array_index = agent.cell_array_index;
        }
        // Set the index of agent to -1
        agent.cell_array_index = -1;
        agent.owner_cell = null;
    }
};

pub const Controller = struct {
    agents: ArrayList(&Agent),
    grid: Grid,
    rect: Vec4,

    pub fn init(width: f32, height: f32) -> Controller {
        Controller {
            .agents = ArrayList(&Agent).init(&c.mem),
            .grid = Grid.init(width, height, 100, 10),
            .rect = vec4(0, 0, width, height),
        }
    }

    pub fn add(self: &Controller, agent: &Agent) {
        %%self.agents.append(agent);
    }

    pub fn addNew(self: &Controller, agent: &const Agent) {
        var new_agent = %%c.mem.init(Agent, agent);
        %%self.agents.append(new_agent);
    }

    pub fn draw(self: &const Controller, renderer: &IMRenderer) {
        for (self.agents.toSlice()) | agent, i | {
            agent.draw(renderer);
        }
    }

    pub fn update(self: &Controller, level: &Level, delta_time: f32) {
        const friction = f32(0.02);
        const gravity = vec2(0, 0.1);

        for ( self.agents.toSlice() ) | agent | {
            _ = agent.position.offset(agent.velocity.mul_scalar(delta_time));

            // Apply friction
            const momentum_vec = agent.velocity.mul_scalar(agent.mass);
            if ( momentum_vec.x != 0 or momentum_vec.y != 0 ) {
                if ( friction < momentum_vec.length() ) {
                    _ = agent.velocity.offset(momentum_vec.normalize().mul_scalar(-friction / agent.mass * delta_time));
                } else {
                    agent.velocity = vec3(0, 0, 0);
                }
            }
            
            // Apply gravity
            _ = agent.velocity.offset(gravity.mul_scalar(delta_time).xyz());
            
            // Level Collisions
            if(agent.collideWithLevel(level)) {
                agent.velocity.y = 0;
            }
            
            // Check to see if the agent moved
            if (agent.owner_cell) | cell | {
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
        for ( grid.cells.toSlice() ) | cell, i | {
            const x = i % grid.columns;
            const y = i / grid.columns;

            for ( cell.agents.toSlice() ) | agent, j | {
                checkCollisions(agent, &cell.agents, j + 1);
                // Neighbor cells: left, top left, bottom left and up
                if ( x > 0 ) {
                    checkCollisions(agent, &grid.getCell(x - 1, y).agents, 0);
                    if ( y > 0 ) checkCollisions(agent, &grid.getCell(x - 1, y - 1).agents, 0);
                    if ( y < grid.rows - 1 ) checkCollisions(agent, &grid.getCell(x - 1, y + 1).agents, 0);
                }
                if ( y > 0 ) checkCollisions(agent, &grid.getCell(x, y - 1).agents, 0);
            }
        }
    }

    fn checkCollisions(agent: &Agent, check: &ArrayList(&Agent), startingIndex: usize) {
        for ( check.toSlice() ) | other | {
            checkCollision(agent, other);
        }
    }

    fn checkCollision(agent1: &Agent, agent2: &Agent) {
        // We add radius since position is the top left corner
        const dist_vec = agent2.position.sub(agent1.position);
        const dist_vec_direction = dist_vec.normalize();
        const dist = dist_vec.length();
        const min_distance = agent1.radius + agent2.radius;
        const collision_depth = min_distance - dist;
        if ( collision_depth > 0 ) {
            // Push away the less massive one
            if ( agent1.mass < agent2.mass ) {
                _ = agent1.position.offset(dist_vec_direction.mul_scalar(-collision_depth));
            } else {
                _ = agent2.position.offset(dist_vec_direction.mul_scalar(collision_depth));
            }
            const aci = agent1.velocity.dot(dist_vec_direction);
            const bci = agent2.velocity.dot(dist_vec_direction);
            const acf = ( aci * ( agent1.mass - agent2.mass ) + 2 * agent2.mass * bci ) / ( agent1.mass + agent2.mass );
            const bcf = ( bci * ( agent2.mass - agent1.mass ) + 2 * agent1.mass * aci ) / ( agent1.mass + agent2.mass );

            _ = agent1.velocity.offset(dist_vec_direction.mul_scalar( acf - aci ));
            _ = agent2.velocity.offset(dist_vec_direction.mul_scalar( bcf - bci ));
        }
    }
};

const AgentRenderer = struct {
    program: ?&ShaderProgram,

    pub fn render(self: &AgentRenderer, renderer: &BatchRenderer, agents: &const ArrayList(&Agent), proj_matrix: &const Mat4 ) {
        // Lazily initialize the program
        if (self.program == null) {
            self.program = c.mem.create(ShaderProgram);
            self.program.compileShaders("res/shaders/gameShader.vert", "res/shaders/gameShader.frag");
            self.program.addAttribute("vertexPosition");
            self.program.addAttribute("vertexColour");
            self.program.addAttribute("vertexUV");
            self.program.linkShaders();
        }

        self.program.bind();

        renderer.begin();
        {
            glActiveTexture(GL_TEXTURE0);
            const textureUniform = self.program.getUniformLocation("sprite");
            glUniform1i(textureUniform, 0);

            const pUniform = self.program.getUniformLocation("camera");
            glUniformMatrix4fv(pUniform, 1, GL_FALSE, proj_matrix.elements);

            // Render all the balls
            for (agents.toSlice()) | agent, i | {
                const uvRect = vec4(0.0, 0.0, 1.0, 1.0);
                const destRect = vec4(
                    agent.position.x - agent.radius,
                    agent.position.y - agent.radius,
                    agent.radius * 2.0,
                    agent.radius * 2.0
                );
                renderer.submit(destRect, uvRect, agent.texture, 0.0, agent.colour);
            }
        }
        renderer.end();
        renderer.render();

        self.program.unbind();
    }
};


pub const ActionList = struct {
    actions: ArrayList(Action),

    pub fn init() -> ActionList {
        ActionList {
            .actions = ArrayList(Action).init(&c.mem),
        }
    }
};

pub const Action = struct {
    name: []const u8,
    action_func: fn(agent: &Agent)
};
