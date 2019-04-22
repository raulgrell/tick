const t = @import("../index.zig");

pub const InputManager = struct {
    // Keyboard
    keyPressed: [MAX_KEYS]bool,
    keyDown: [MAX_KEYS]bool,
    prevKeyState: [MAX_KEYS]bool,
    // Mouse
    buttonPressed: [MAX_BUTTONS]bool,
    buttonDown: [MAX_BUTTONS]bool,
    prevButtonState: [MAX_BUTTONS]bool,
    cursor_position: Vec2,
    scroll_offset: Vec2,

    const KeyMods = struct {
        mods: u8,
        fn controlDown(self: *KeyMods) bool { return (self.mods & c.GLFW_MOD_CONTROL) and c.GLFW_MOD_CONTROL; } 
        fn shiftDown(self: *KeyMods)   bool { return (self.mods & c.GLFW_MOD_SHIFT)   and c.GLFW_MOD_SHIFT; } 
        fn altDown(self: *KeyMods)     bool { return (self.mods & c.GLFW_MOD_ALT)     and c.GLFW_MOD_ALT; } 
        fn superDown(self: *KeyMods)   bool { return (self.mods & c.GLFW_MOD_SUPER)   and c.GLFW_MOD_SUPER; }
    };

    pub fn create() InputManager {
        return InputManager {
            .keyPressed      = []bool{false} ** MAX_KEYS,    
            .keyReleased     = []bool{false} ** MAX_KEYS,    
            .keyDown         = []bool{false} ** MAX_KEYS,    
            .prevKeyState    = []bool{false} ** MAX_KEYS,    
            .buttonPressed   = []bool{false} ** MAX_BUTTONS, 
            .buttonReleased  = []bool{false} ** MAX_BUTTONS, 
            .buttonDown      = []bool{false} ** MAX_BUTTONS, 
            .prevButtonState = []bool{false} ** MAX_BUTTONS, 
            .cursor_position = vec2(0, 0),
            .scroll_offset   = vec2(0, 0)
        };
    }

    pub fn init(self: *InputManager) void {
        self.clearKeys();
        self.clearMouseButtons();
    }

    pub fn update(self: *InputManager) void {
        var i: usize = 0; while(i < MAX_KEYS) : (i += 1) {
            self.keyPressed[i] = self.keyDown[i] and !self.prevKeyState[i];
        }
        std.mem.copy(bool, self.prevKeyState[0..], self.keyDown[0..]);
        var i: usize = 0; while(i < MAX_BUTTONS) : (i += 1) {
            self.buttonPressed[i] = self.buttonDown[i] and !self.prevButtonState[i];
        }
        std.mem.copy(bool, self.prevButtonState[0..], self.buttonDown[0..]);
    }
    
    pub fn clearKeys(self: *InputManager) void {
        for (self.keyDown)         | *k | *k = false;
        for (self.prevKeyState)    | *k | *k = false;
        for (self.keyPressed)      | *k | *k = false;
    }

    pub fn clearMouseButtons(self: *InputManager) void {
        for (self.buttonDown)      | *k | *k = false;
        for (self.prevButtonState) | *k | *k = false;
        for (self.buttonPressed)   | *k | *k = false;
    }
};