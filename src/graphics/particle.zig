
pub const Particle2D = struct {
    position: Vec2,
    velocity: Vec2,
    colour: Vec4,
    timer: f32,
    width: f32,
};

pub fn defaultParticleUpdate(particle: *Particle2D, deltaTime: f32) void {
    particle.position.offset(particle.velocity.mul_scalar(deltaTime));
}

const MAX_BATCHES = 32;

pub const ParticleEngine2D  = struct {
    batches: [MAX_BATCHES]*ParticleBatch2D,
    num_batches: u8,

    pub fn init()ParticleEngine2D {
        return ParticleEngine2D {
            .batches = undefined,
            .num_batches = 0,
        };
    }

    pub fn addParticleBatch(self: *ParticleEngine2D, pb: *ParticleBatch2D) void {
        self.batches[self.num_batches] = pb;
        self.num_batches += 1;
    }

    pub fn update(self: *ParticleEngine2D, deltaTime: f32) void {
        for (self.batches[0 .. self.num_batches - 1]) | batch, i |  {
            batch.update(deltaTime);
        }
    }

    pub fn draw(self: *ParticleEngine2D, br: *BatchRenderer) void {
        for (self.batches[0 .. self.num_batches - 1]) | batch, i | {
            br.begin();
            batch.draw(br);
            br.end();
            br.render();
        }
    }
};

const MAX_PARTICLES = 32;
const UpdateFunction = fn(particle: *Particle2D, deltaTime: f32) void;

pub const ParticleBatch2D = struct {
    updateFn: UpdateFunction,
    particles: [MAX_PARTICLES]Particle2D,
    decayRate: f32,
    maxParticles : usize,
    lastFreeParticle : usize,
    texture: *Texture,

    pub fn init(texture: *Texture, maxParticles: usize, decayRate: f32,  updateFn: UpdateFunction) ParticleBatch2D {
        return ParticleBatch2D {
            .updateFn = updateFn,
            .decayRate = decayRate,
            .particles = undefined,
            .maxParticles = maxParticles,
            .lastFreeParticle = 0,
            .texture = texture
        };
    }
    
    pub fn addParticle(pb: *ParticleBatch2D, position: *const Vec2, velocity: *const Vec2, colour: *const Vec4, timer: f32, width: f32) void {
        const particleIndex = pb.findFreeParticle();
        var particle = &pb.particles[particleIndex];

        particle.timer = timer;
        particle.position = *position;
        particle.velocity = *velocity;
        particle.colour = *colour;
        particle.width = width;
    }
    
    pub fn update(pb: *ParticleBatch2D, deltaTime: f32) void {
        for (pb.particles) | *particle, i |  {
            if (particle.timer > 0.0) {
                pb.updateFn(particle, deltaTime);
                particle.timer -= pb.decayRate * deltaTime;
            }
        }
    }
    
    pub fn draw(pb: *ParticleBatch2D, br: *BatchRenderer) void {
        const uvRect = vec4(0.0, 0.0, 1.0, 1.0);
        for (pb.particles) | particle, i |  {
            if (particle.timer > 0.0) {
                const destRect = vec4(particle.position.x, particle.position.y, particle.width, particle.width);
                br.submit(destRect, uvRect, pb.texture, 0.0, particle.colour, 0.0);
            }
        }
    }
    
    fn findFreeParticle(pb: *ParticleBatch2D)usize {
        { var i = pb.lastFreeParticle; while(i < pb.maxParticles) : (i += 1 ){
            if (pb.particles[i].timer <= 0.0) {
                pb.lastFreeParticle = i;
                return i;
            }
        }}

        { var i = usize(0); while(i < pb.lastFreeParticle) : (i += 1 ){
            if (pb.particles[i].timer <= 0.0) {
                pb.lastFreeParticle = i;
                return i;
            }
        }}

        pb.lastFreeParticle = 0;
        return 0;
    }
};