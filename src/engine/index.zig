const t = @import("../index.zig");

pub const EntityId = struct {
  id: usize,
  pub fn eql(a: EntityId, b: EntityId) bool { return a.id == b.id; }
  pub fn isZero(a: EntityId) bool { return a.id == 0; }
};

pub fn ComponentObject(comptime T: type) type {
  return struct {
    is_active: bool,
    entity_id: EntityId,
    data: T,
  };
}

pub fn ComponentList(comptime T: type, comptime capacity_: usize) type {
  return struct {
    const Self = this;
    const ComponentType = T;
    const capacity = capacity_;
    objects: [capacity]ComponentObject(T),
    count: usize,
  };
}

pub fn Session(comptime ComponentLists: type) type {
  assert(@typeId(ComponentLists) == builtin.TypeId.Struct);
  inline for (@typeInfo(ComponentLists).Struct.fields) |field| {
    assert(@typeId(@typeOf(field)) == builtin.TypeId.Struct);
  }

  return struct { 
    const Self = this;

    prng: std.rand.DefaultPrng,
    next_entity_id: usize,
    removals: [MaxRemovalsPerFrame] EntityId,
    num_removals: usize,
    components: ComponentLists,

    pub fn init(self: *Self, rand_seed: u32) void {
      self.prng = std.rand.DefaultPrng.init(rand_seed);
      self.next_entity_id = 1;
      self.num_removals = 0;
      inline for (@typeInfo(ComponentLists).Struct.fields) |field| {
        @field(&self.components, field.name).count = 0;
      }
    }

    pub fn iter(self: *Self, comptime T: type) blk: {
      comptime var capacity: usize = 0;
      inline for (@typeInfo(ComponentLists).Struct.fields) |field| {
        comptime if (std.mem.eql(u8, field.name, @typeName(T))) {
          capacity = field.field_type.capacity;
        };
      }
      break :blk ComponentObjectIterator(T, capacity);
    } {
      comptime var capacity: usize = 0;
      inline for (@typeInfo(ComponentLists).Struct.fields) |field| {
        comptime if (std.mem.eql(u8, field.name, @typeName(T))) {
          capacity = field.field_type.capacity;
        };
      }
      const list = &@field(&self.components, @typeName(T));
      return ComponentObjectIterator(T, capacity).init(list);
    }

    pub fn eventIter(self: *Self, comptime T: type, comptime field: []const u8, entity_id: EntityId) blk: {
      comptime var capacity: usize = 0;
      inline for (@typeInfo(ComponentLists).Struct.fields) |sfield| {
        comptime if (std.mem.eql(u8, sfield.name, @typeName(T))) {
          capacity = sfield.field_type.capacity;
        };
      }
      break :blk EventIterator(T, capacity, field);
    } {
      comptime var capacity: usize = 0;
      inline for (@typeInfo(ComponentLists).Struct.fields) |sfield| {
        comptime if (std.mem.eql(u8, sfield.name, @typeName(T))) {
          capacity = sfield.field_type.capacity;
        };
      }
      return EventIterator(T, capacity, field).init(list, entity_id);
    }

    pub fn findObject(self: *Self, entity_id: EntityId, comptime T: type) ?*ComponentObject(T) {
      var it = self.iter(T); while (it.next()) |object| {
        if (EntityId.eql(object.entity_id, entity_id)) return object;
      }
      return null;
    }

    pub fn findFirstObject(self: *Self, comptime T: type) ?*ComponentObject(T) {
      return self.iter(T).next();
    }

    pub fn find(self: *Self, entity_id: EntityId, comptime T: type) ?*T {
	    return if (self.findObject(entity_id, T)) |object| &object.data else null;
    }

    pub fn findFirst(self: *Self, comptime T: type) ?*T {
      return if (self.findFirstObject(T)) |object| &object.data else null;
    }

    pub fn getRand(self: *Self) *std.rand.Random {
      return &self.prng.random;
    }

    pub fn spawn(self: *Self) EntityId {
      const id = EntityId{ .id = self.next_entity_id };
      self.next_entity_id += 1;
      return id;
    }

    // called in spawn functions to clean up components of a partially constructed entity after an error
    pub fn undoSpawn(self: *Self, entity_id: EntityId) void {
      inline for (@typeInfo(ComponentLists).Struct.fields) |field| {
        self.destroyComponent(entity_id, field.field_type.ComponentType);
      }
    }

    pub fn markEntityForRemoval(self: *Self, entity_id: EntityId) void {
      if (self.num_removals >= MaxRemovalsPerFrame) @panic("markEntityForRemoval: no removal slots available");
      self.removals[self.num_removals] = entity_id;
      self.num_removals += 1;
    }

    pub fn addComponent(self: *Self, entity_id: EntityId, data: var) !void {
      const T: type = @typeOf(data);
      assert(@typeId(T) == builtin.TypeId.Struct);
      var list = &@field(&self.components, @typeName(T));
      const slot = blk: {
        var i: usize = 0;
        while (i < list.count) : (i += 1) {
          const object = &list.objects[i];
          if (!object.is_active) {
            break :blk object;
          }
        }
        if (list.count < list.objects.len) {
          i = list.count;
          list.count += 1;
          break :blk &list.objects[i];
        }
        break :blk null;
      };
      if (slot) |object| {
        object.is_active = true;
        object.data = data;
        object.entity_id = entity_id;
      } else {
        std.debug.warn("warning: no slots available for new `" ++ @typeName(T) ++ "` component\n");
        return error.NoComponentSlotsAvailable;
      }
    }

    pub fn destroyComponent(self: *Self, entity_id: EntityId, comptime T: type) void {
      if (self.findObject(entity_id, T)) |object| {
        object.is_active = false;
      }
    }

    pub fn applyRemovals(self: *Self) void {
      for (self.removals[0..self.num_removals]) |entity_id| {
        inline for (@typeInfo(ComponentLists).Struct.fields) |field| {
          self.destroyComponent(entity_id, field.field_type.ComponentType);
        }
      }
      self.num_removals = 0;
    }
  };
}

pub fn ComponentObjectIterator(comptime T: type, comptime capacity: usize) type {
  return struct {
    const Self = this;

    list: *Gbe.ComponentList(T, capacity),
    index: usize,

    pub fn next(self: *Self) ?*Gbe.ComponentObject(T) {
      for (self.list.objects[self.index..self.list.count]) |*object, i| {
        if (object.is_active) {
          self.index += i + 1;
          return object;
        }
      }
      self.index = self.list.count + 1;
      return null;
    }

    pub fn init(list: *Gbe.ComponentList(T, capacity)) Self {
      return Self{
        .list = list,
        .index = 0,
      };
    }
  };
}

// EventIterator is like ComponentObjectIterator, with the following differences:
// - takes a field name (compile-time) and entity id (run-time), and only
//   yields events where event.field == entity_id
// - returns *T (component data) directly, instead of *ComponentObject(T)

	pub fn EventIterator(comptime T: type, comptime capacity: usize, comptime field: []const u8) type {
  return struct {
    const Self = this;

    list: *Gbe.ComponentList(T, capacity),
    entity_id: Gbe.EntityId,
    index: usize,

    pub fn next(self: *Self) ?*T {
      for (self.list.objects[self.index..self.list.count]) |*object, i| {
        if (object.is_active and Gbe.EntityId.eql(@field(&object.data, field), self.entity_id)) {
          self.index += i + 1;
          return &object.data;
        }
      }
      self.index = self.list.count + 1;
      return null;
    }

    pub fn init(list: *Gbe.ComponentList(T, capacity), entity_id: Gbe.EntityId) Self {
      return Self{
        .list = list,
        .entity_id = entity_id,
        .index = 0,
      };
    }
  };
}

// `SessionType` param must have have a field called `gbe`of type `Gbe.Session(...)`
// Implement a system that exposes an iterator instead of running everything internally
pub fn build(
  comptime SessionType: type,
  comptime SelfType: type,
  comptime process: fn(*SessionType, SelfType) bool,
) fn(*SessionType)void {
  assert(@typeId(SelfType) == builtin.TypeId.Struct);

  const Impl = struct{
    fn runOne( gs: *SessionType, self_id: Gbe.EntityId, comptime MainComponentType: type, main_component: *MainComponentType, ) bool {
      // fill in the fields of the `self` structure
      var self: SelfType = undefined;
      inline for (@typeInfo(SelfType).Struct.fields) |field| {
        // if the field is of type EntityId, fill it in....
        if (field.field_type == Gbe.EntityId) {
          @field(self, field.name) = self_id;
          continue;
        }
        // otherwise, it must be a pointer to a component, or an optional pointer to a component
        comptime const ComponentType = unpackComponentType(field.field_type);
        comptime const is_optional = @typeId(field.field_type) == builtin.TypeId.Optional;
        @field(self, field.name) =
          if (ComponentType == MainComponentType)
            main_component
          else if (is_optional)
            gs.gbe.find(self_id, ComponentType)
          else
            gs.gbe.find(self_id, ComponentType) orelse return true;
      }
      // call the process function
      return process(gs, self);
    }

    fn runAll( gs: *SessionType, comptime MainComponentType: type, ) void {
      var it = gs.gbe.iter(MainComponentType); while (it.next()) |object| {
        if (!runOne(gs, object.entity_id, MainComponentType, &object.data)) {
          gs.gbe.markEntityForRemoval(object.entity_id);
        }
      }
    }

    fn run(gs: *SessionType) void {
      // only consider optional fields if all fields are optional
      var all_fields_optional = true;

      inline for (@typeInfo(SelfType).Struct.fields) |field, i| {
        if (field.field_type != Gbe.EntityId and
            @typeId(field.field_type) != builtin.TypeId.Optional) {
          all_fields_optional = false;
        }
      }

      // decide which component type to do the outermost iteration over.
      // choose the component type with the lowest amount of active entities.
      var best: usize = @maxValue(usize);
      var which: ?usize = null;

      // go through the fields in the SelfType struct (where each field is
      // either an EntityId or a pointer to a component)
      inline for (@typeInfo(SelfType).Struct.fields) |field, i| {
        if (field.field_type == Gbe.EntityId) {
          continue;
        }
        if (@typeId(field.field_type) == builtin.TypeId.Optional and
            !all_fields_optional) {
          continue;
        }
        comptime const field_type = unpackComponentType(field.field_type);
        if (@field(&gs.gbe.components, @typeName(field_type)).count < best) {
          best = @field(&gs.gbe.components, @typeName(field_type)).count;
          which = i;
        }
      }

      // run the iteration
      // note: i can't just look up `which_index` in Struct.fields because of a
      // compiler bug https://github.com/ziglang/zig/issues/1435
      if (which) |which_index| {
        inline for (@typeInfo(SelfType).Struct.fields) |field, i| {
          if (field.field_type == Gbe.EntityId) {
            continue;
          }
          if (@typeId(field.field_type) == builtin.TypeId.Optional and
              !all_fields_optional) {
            continue;
          }
          comptime const field_type = unpackComponentType(field.field_type);
          if (i == which_index) {
            runAll(gs, field_type);
            return;
          }
        }
        unreachable;
      } else {
        std.debug.panic("no matches");
      }
    }

    fn unpackComponentType(comptime field_type: type) type {
      comptime var ft = field_type;
      if (@typeId(ft) == builtin.TypeId.Optional) {
        ft = @typeInfo(ft).Optional.child;
      }
      if (@typeId(ft) != builtin.TypeId.Pointer) {
        @compileError("field must be a pointer");
        unreachable;
      }
      ft = @typeInfo(ft).Pointer.child;
      return ft;
    }
  };

  return Impl.run;
}