const assert = @import("std").debug.assert;
const io = @import("std").io;
const c = @import("c.zig");

const MAX_OBSERVERS = 20;

error ObserverFail;
error ListenerFail;

pub fn Observer(comptime T: type, comptime S: type) type {
    struct {
        impl: &T,
        destroy: fn(observer: &Self),
        notify: Notify,
        notifyImpl: NotifyImpl,

        const Self = this;
        const Notify = fn(observer: &Self, event: Event, subject: &S);
        const NotifyImpl = fn(impl: &const T, event: Event, subject: &S);

        pub fn make(impl: &T, notifyImpl: NotifyImpl) Self {
            Self {
                .impl = impl,
                .destroy = destroy,
                .notify = notify,
                .notifyImpl = notifyImpl,
            }
        }

        pub fn create(impl: &T, notifyImpl: NotifyImpl) &Self {
            var self = %%c.mem.allocator.create(Self);
            self.impl = impl;
            self.destroy = destroy;
            self.notify = notify;
            self.notifyImpl = notifyImpl;
            return self;
        }

        fn destroy(self: &Self) void {
            c.mem.allocator.destroy(self);
        }

        fn notify(self: &Self, event: Event, subject: &S) void {
            self.notifyImpl(self.impl, event, subject);
        }
    }
}

pub fn Subject(comptime S: type, comptime T: type) type {
    struct {
        impl: &T,
        event: Event,
        observers: [MAX_OBSERVERS]?&Obs,
        destroy: fn(&Self),
        register: fn(&Self, &Obs) %usize,
        unregister: fn(&Self, &Obs) %usize,
        notify: fn(&Self),

        const Self = this;
        const Obs = Observer(S, T);
        
        pub fn make(impl: &T, event: Event) &Self {
            Self {
                .impl = impl,
                .destroy = destroy,
                .event = event,
                .register = registerObserver,
                .unregister = unregisterObserver,
                .notify = notifyObservers,
            }
        }

        pub fn create(impl: &T, event: Event) &Self {
            var self = %%c.mem.allocator.create(Self);
            self.impl = impl;
            self.destroy = destroy;
            self.event = event;
            self.register = registerObserver;
            self.unregister = unregisterObserver;
            self.notify = notifyObservers;
            return self;
        }

        fn destroy(self: &Self) void {
            c.mem.allocator.destroy(self);
        }

        fn registerObserver(self: &Self, observer: &Obs) %usize {
            var i = usize(0);
            while( i < MAX_OBSERVERS) : (i += 1) {
                if (self.observers[i] == null) {
                    self.observers[i] = observer;
                    return i;
                }
            }
            return error.ObserverFail;
        }

        fn unregisterObserver(self: &Self, observer: &Obs) %usize {
            var i = usize(0);
            while( i < MAX_OBSERVERS) : (i += 1) {
                var pObserver = self.observers[i] ?? return error.ObserverFail;
                if (observer == pObserver) {
                    self.observers[i] = null;
                    return i;
                }
            }
            return error.ObserverFail;
        }

        fn notifyObservers(self: &Self) void {
            var i = usize(0);
            while( i < MAX_OBSERVERS) : (i += 1) {
                if (self.observers[i]) | o | {
                    o.notify(o, self.event, self.impl);
                }
            }
        }
    }
}

// Test

const Client = struct {
    name: []const u8,

    speak: fn(&Client),
    watch: fn(&Client, &Server),
    destroy: fn(&Client),
    
    observer: &Obs,
    
    const Obs = Observer(Client, Server);

    pub fn make(name: []const u8)Client {
        var self = Client {
            self.name = name,
            self.watch = watch,
            self.destroy = destroy,
            self.observer = undefined,            
        };
        self.observer = Obs.make(self, notify)
    }
    
    pub fn create(name: []const u8)&Client {
        var self = %%c.mem.allocator.create(Client);
        self.name = name;
        self.watch = watch;
        self.destroy = destroy;
        self.observer = Obs.create(self, notify);
        return self;
    }

    fn destroy(self: &Client) void {
        self.observer.destroy(self.observer);
    }

    fn watch(self: &Client, other: &Server) void {
        const i = other.subject.registerObserver(self.observer);
        %%io.warn("{} watching {} ({})\n", self.name, other.name, i);
    }

    fn handleEvent(self: &const Client, other: &Server) void {
        %%io.warn("{} just heard {}\n", self.name, other.name);
    }

    // Observer Method called upon the receiption of an incoming event.
    fn notify(self: &const Client, event: Event, subject: &Server) void {
        handleEvent(self, subject);
    }
};

const Event = enum {
    Speak
};

const Server = struct {
    name: []const u8,
    event: Event,
    destroy: fn(&Server),
    speak: fn(&Server),

    subject: &Sub,

    const Self = this;
    const Obs = Observer(Client, Server);
    const Sub = Subject(Client, Server);
    
    pub fn create(name: []const u8)&Server {
        var self = %%c.mem.allocator.create(Server);
        self.name = name;
        self.destroy = destroy;
        self.speak = speak;
        self.subject = Subject(Client, Server).create(self, Event.Speak);
        self.subject.register = registerObserver;
        self.subject.unregister = unregisterObserver;
        return self;
    }

    fn destroy(self: &const Server) void {
        self.subject.destroy(self.subject);
    }

    // Whenever a Server MEOWS, Clients listen to it. Server is the Subject.
    fn speak(self: &Server) void {
        %%io.warn("My name is: {}. Miiiaaauu\n", self.name);
        self.event = Event.Speak;
        self.subject.notify(self.subject);
    }

    fn registerObserver(self: &Sub, observer: &Obs) %usize {
        return self.register(self, observer);
    }

    fn unregisterObserver(self: &Sub, observer: &Obs) %usize {
        return self.unregister(self, observer);
    }
};

test "Observer" {
    const hopkins = Server.create("Hopkins");
    defer hopkins.destroy(hopkins);

    const alfred = Client.create("Alfred");
    defer alfred.destroy(alfred);

    const benny = Client.create("Benny");
    defer benny.destroy(benny);

    alfred.watch(alfred, hopkins);
    benny.watch(benny, hopkins);

    hopkins.speak(hopkins);
}