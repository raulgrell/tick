const t = @import("../index.zig");

const Callback = fn(void *data) void;
const Compare = fn(a: []const u8, b: []const u8) isize;

const Emitter = struct {
    listeners: ArrayList(Listener),
    cmp: Compare,

    pub fn create() Emitter {
        Emitter {
            self.cmp = default_cmp;
            self.listeners = list_new();
            self.listeners.free = free;
        }
    }

    pub fn destroy(self: *Emitter) void {
        if (self.listeners) list_destroy(self.listeners);
        free(self);
    }

    pub fn emit(self: *Emitter, event: []const u8, void *data) %void {
        var iterator = list_iterator_new(self.listeners, LIST_TAIL);
        if (NULL == iterator) return -1;

        list_node_t *node;
        while ((node = list_iterator_next(iterator))) {
            Listener *listener = (Listener *) node->val;
            if (0 == self.cmp(listener.event, event)) {
                listener.fn(data);
                if (ListenerType.Once == listener.type) {
                    remove_listener(self, listener);
                }
            }
        }

        list_iterator_destroy(iterator);
        return 0;
    }

    pub fn on(self: *Emitter, event: []const u8, Callback *cb) %void {
        return add_listener(self, event, cb, ListenerType.On);
    }

    pub fn once(self: *Emitter, event: []const u8, Callback *cb) %void {
        return add_listener(self, event, cb, ListenerType.Once);
    }

    pub fn remove(self: *Emitter, event: []const u8, Callback *cb) %void {
        var iterator = list_iterator_new(self.listeners, LIST_TAIL);
        if (NULL == iterator) return -1;

        list_node_t *node;
        while ((node = list_iterator_next(iterator))) {
            Listener *listener = (Listener *) node->val;
            if (strcmp(event, listener.event)) continue;

            if (cb) {
                if (cb == listener.fn) {
                    list_remove(self.listeners, node);
                    break;
                }
            } else {
                list_remove(self.listeners, node);
            }
        }

        list_iterator_destroy(iterator);
        return 0;
    }

    fn remove_listener(self: *Emitter, Listener *listener) %void {
        var iterator = list_iterator_new(self.listeners, LIST_TAIL);
        if (NULL == iterator) return -1;

        list_node_t *node;
        while ((node = list_iterator_next(iterator))) {
            if(listener != (Listener *) node->val)
                continue;

            list_remove(self.listeners, node);
        }

        list_iterator_destroy(iterator);
        return 0;
    }

    fn add_listener(self: *Emitter , event: []const u8 , Callback *cb , ListenerType type) %void {
        Listener *listener = NULL;
        list_node_t *node = NULL;
        if (!(listener = listener_new(event, cb))) return -1;
        if (!(node = list_node_new(listener))) return -1;
        if (NULL == list_rpush(self.listeners, node)) return -1;
        listener.type = type;
        return 0;
    }

    // Default event-name comparator.
    fn default_cmp(a: []const u8, b: []const u8)isize {
        return mem.cmp(u8, a, b);
    }
};

const ListenerType = enum {
  ListenerType.On,
  ListenerType.Once
}

const Listener = struct {
    fn: &Callback,
    event: []const u8,
    T: ListenerType,
    
    pub fn listener_new(event: []const u8, Callback *fn)Listener {
        Listener {
            .fn = fn;
            .event = event;
            .T = ListenerType.On; // default value
        }
    }
};

test "new_emitter" {
    var emitter = Emitter.create();
    assert(emitter.listeners);
    assert(0 == emitter.listeners.len);
    emitter.destroy();
}

test "on_new_event" {
    var emitter = Emitter.create();
    assert(0 == emitter.on("foo", &on_foo));
    emitter.destroy();
}

test "emit_unregistered_event" {
    var emitter = Emitter.create();
    assert(0 == emitter.emit("foo", NULL));
    emitter.destroy();
}

test "register_and_emit" {
    var emitter = Emitter.create();
    invocations = 0;
    assert(0 == emitter.on("foo", &on_foo));
    for (int i = 0; i < 10; i++)
        assert(0 == emitter.emit("foo", NULL));
    assert(10 == invocations);
    emitter.destroy();
}

test "register_and_emit_once" {
    var emitter = Emitter.create();
    invocations = 0;
    assert(0 == emitter.once("foo", &once_foo));
    for (int i = 0; i < 2; i++)
        assert(0 == emitter.emit("foo", NULL));
    assert(1 == invocations);
    emitter.destroy();
}

test "register_and_emit_once_advanced" {
    var emitter = Emitter.create();
    invocations = 0;
    assert(0 == emitter.on("foo", &once_foo));
    assert(0 == emitter.once("foo", &once_foo));
    for (int i = 0; i < 2; i++)
        assert(0 == emitter.emit("foo", NULL));
    assert(3 == invocations);
    emitter.destroy();
}

test "emit_event_with_data" {
    var emitter = Emitter.create();
    assert(0 == emitter.on("bar", &on_bar));
    Data bar = { 1, 14, 0 };
    assert(0 == emitter.emit("bar", (void *) &bar));
    assert(15 == bar.c);
    emitter.destroy();
}

test "on_then_remove" {
    var emitter = Emitter.create();
    assert(0 == emitter.on("bar", &on_bar));
    assert(1 == emitter.listeners.len);
    assert(0 == emitter.remove("bar", &on_bar));
    assert(0 == emitter.listeners.len);
    emitter.destroy();
}

test "remove_actually_removes" {
    var emitter = Emitter.create();

    assert(0 == emitter.on("foo", &on_foo));
    assert(1 == emitter.listeners.len);

    invocations = 0;
    for (int i = 0; i < 10; i++) {
        if (5 == i) assert(0 == emitter.remove("foo", &on_foo));
        assert(0 == emitter.emit("foo", NULL));
    }
    assert(5 == invocations);

    emitter.destroy();
}

test "remove_all_listeners" {
    var emitter = Emitter.create();

    assert(0 == emitter.on("foo", &on_foo));
    assert(0 == emitter.on("foo", &on_bar));
    assert(2 == emitter.listeners.len);

    assert(0 == emitter.on("something", &on_foo));
    assert(3 == emitter.listeners.len);

    assert(0 == emitter.remove("foo", NULL));
    assert(1 == emitter.listeners.len);

    emitter.destroy();
}

test "custom_cmp_function" {
    var emitter = Emitter.create();
    emitter.cmp = cmp_fn;
    invocations = 0;

    assert(0 == emitter.on("foo*", &on_foo));

    assert(0 == emitter.emit("foo", NULL));
    assert(0 == emitter.emit("foobar", NULL));
    assert(0 == emitter.emit("foobaz", NULL));
    assert(0 == emitter.emit("blahfoo", NULL));

    assert(3 == invocations);
    emitter.destroy();
}


const Data = struct {
    a: u8,
    b: u8,
    c: u8,
};

const invocations = usize(0);

fn on_foo(void *data) void {
    invocations += 1;
}

fn once_foo(void *data) void {
    invocations += 1;
}

fn on_bar(void *data) void {
    var thing = (Data *) data;
    thing->c = thing->a + thing->b;
}

fn cmp_fn(a: []const u8, b: []const u8) int {
    return !wildcardcmp(a, b);
}