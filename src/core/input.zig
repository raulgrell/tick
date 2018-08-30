const Key = struct {
    const Space          = c.GLFW_KEY_SPACE,
    const Apostrophe     = c.GLFW_KEY_APOSTROPHE,
    const Comma          = c.GLFW_KEY_COMMA,
    const Minus          = c.GLFW_KEY_MINUS,
    const Period         = c.GLFW_KEY_PERIOD,
    const Slash          = c.GLFW_KEY_SLASH,
    const Num0           = c.GLFW_KEY_0,
    const Num1           = c.GLFW_KEY_1,
    const Num2           = c.GLFW_KEY_2,
    const Num3           = c.GLFW_KEY_3,
    const Num4           = c.GLFW_KEY_4,
    const Num5           = c.GLFW_KEY_5,
    const Num6           = c.GLFW_KEY_6,
    const Num7           = c.GLFW_KEY_7,
    const Num8           = c.GLFW_KEY_8,
    const Num9           = c.GLFW_KEY_9,
    const SemiColon      = c.GLFW_KEY_SEMICOLON,
    const Equal          = c.GLFW_KEY_EQUAL,
    const A              = c.GLFW_KEY_A,
    const B              = c.GLFW_KEY_B,
    const C              = c.GLFW_KEY_C,
    const D              = c.GLFW_KEY_D,
    const E              = c.GLFW_KEY_E,
    const F              = c.GLFW_KEY_F,
    const G              = c.GLFW_KEY_G,
    const H              = c.GLFW_KEY_H,
    const I              = c.GLFW_KEY_I,
    const J              = c.GLFW_KEY_J,
    const K              = c.GLFW_KEY_K,
    const L              = c.GLFW_KEY_L,
    const M              = c.GLFW_KEY_M,
    const N              = c.GLFW_KEY_N,
    const O              = c.GLFW_KEY_O,
    const P              = c.GLFW_KEY_P,
    const Q              = c.GLFW_KEY_Q,
    const R              = c.GLFW_KEY_R,
    const S              = c.GLFW_KEY_S,
    const T              = c.GLFW_KEY_T,
    const U              = c.GLFW_KEY_U,
    const V              = c.GLFW_KEY_V,
    const W              = c.GLFW_KEY_W,
    const X              = c.GLFW_KEY_X,
    const Y              = c.GLFW_KEY_Y,
    const Z              = c.GLFW_KEY_Z,
    const OpenBracket    = c.GLFW_KEY_LEFT_BRACKET,
    const BackSlash      = c.GLFW_KEY_BACKSLASH,
    const CloseBracket   = c.GLFW_KEY_RIGHT_BRACKET,
    const GraveAccent    = c.GLFW_KEY_GRAVE_ACCENT,
    const World1         = c.GLFW_KEY_WORLD_1,
    const World2         = c.GLFW_KEY_WORLD_2,
    const Escape         = c.GLFW_KEY_ESCAPE,
    const Enter          = c.GLFW_KEY_ENTER,
    const Tab            = c.GLFW_KEY_TAB,
    const Backspace      = c.GLFW_KEY_BACKSPACE,
    const Insert         = c.GLFW_KEY_INSERT,
    const Delete         = c.GLFW_KEY_DELETE,
    const Right          = c.GLFW_KEY_RIGHT,
    const Left           = c.GLFW_KEY_LEFT,
    const Down           = c.GLFW_KEY_DOWN,
    const Up             = c.GLFW_KEY_UP,
    const PageUp         = c.GLFW_KEY_PAGE_UP,
    const PageDown       = c.GLFW_KEY_PAGE_DOWN,
    const Home           = c.GLFW_KEY_HOME,
    const End            = c.GLFW_KEY_END,
    const CapsLock       = c.GLFW_KEY_CAPS_LOCK,
    const ScrollLock     = c.GLFW_KEY_SCROLL_LOCK,
    const NumLock        = c.GLFW_KEY_NUM_LOCK,
    const PrintScreen    = c.GLFW_KEY_PRINT_SCREEN,
    const Pause          = c.GLFW_KEY_PAUSE,
    const F1             = c.GLFW_KEY_F1,
    const F2             = c.GLFW_KEY_F2,
    const F3             = c.GLFW_KEY_F3,
    const F4             = c.GLFW_KEY_F4,
    const F5             = c.GLFW_KEY_F5,
    const F6             = c.GLFW_KEY_F6,
    const F7             = c.GLFW_KEY_F7,
    const F8             = c.GLFW_KEY_F8,
    const F9             = c.GLFW_KEY_F9,
    const F10            = c.GLFW_KEY_F10,
    const F11            = c.GLFW_KEY_F11,
    const F12            = c.GLFW_KEY_F12,
    const F13            = c.GLFW_KEY_F13,
    const F14            = c.GLFW_KEY_F14,
    const F15            = c.GLFW_KEY_F15,
    const F16            = c.GLFW_KEY_F16,
    const F17            = c.GLFW_KEY_F17,
    const F18            = c.GLFW_KEY_F18,
    const F19            = c.GLFW_KEY_F19,
    const F20            = c.GLFW_KEY_F20,
    const F21            = c.GLFW_KEY_F21,
    const F22            = c.GLFW_KEY_F22,
    const F23            = c.GLFW_KEY_F23,
    const F24            = c.GLFW_KEY_F24,
    const F25            = c.GLFW_KEY_F25,
    const KP0            = c.GLFW_KEY_KP_0,
    const KP1            = c.GLFW_KEY_KP_1,
    const KP2            = c.GLFW_KEY_KP_2,
    const KP3            = c.GLFW_KEY_KP_3,
    const KP4            = c.GLFW_KEY_KP_4,
    const KP5            = c.GLFW_KEY_KP_5,
    const KP6            = c.GLFW_KEY_KP_6,
    const KP7            = c.GLFW_KEY_KP_7,
    const KP8            = c.GLFW_KEY_KP_8,
    const KP9            = c.GLFW_KEY_KP_9,
    const KPDecimal      = c.GLFW_KEY_KP_DECIMAL,
    const KPDivide       = c.GLFW_KEY_KP_DIVIDE,
    const KPMultiply     = c.GLFW_KEY_KP_MULTIPLY,
    const KPSubtract     = c.GLFW_KEY_KP_SUBTRACT,
    const KPAdd          = c.GLFW_KEY_KP_ADD,
    const KPEnter        = c.GLFW_KEY_KP_ENTER,
    const KPEqual        = c.GLFW_KEY_KP_EQUAL,
    const LeftSift       = c.GLFW_KEY_LEFT_SHIFT,
    const LeftControl    = c.GLFW_KEY_LEFT_CONTROL,
    const LeftAlt        = c.GLFW_KEY_LEFT_ALT,
    const LeftSuper      = c.GLFW_KEY_LEFT_SUPER,
    const RightShift     = c.GLFW_KEY_RIGHT_SHIFT,
    const RightControl   = c.GLFW_KEY_RIGHT_CONTROL,
    const RightAlt       = c.GLFW_KEY_RIGHT_ALT,
    const RightSuper     = c.GLFW_KEY_RIGHT_SUPER,
    const Menu           = c.GLFW_KEY_MENU,
};

const MouseButton = struct {
    const B1 = c.GLFW_MOUSE_BUTTON_0,
    const B2 = c.GLFW_MOUSE_BUTTON_1,
    const B3 = c.GLFW_MOUSE_BUTTON_2,
    const B4 = c.GLFW_MOUSE_BUTTON_3,
    const B5 = c.GLFW_MOUSE_BUTTON_4,
    const B6 = c.GLFW_MOUSE_BUTTON_5,
    const B7 = c.GLFW_MOUSE_BUTTON_6,
    const B8 = c.GLFW_MOUSE_BUTTON_7,
    const ScrollUp = c.GLFW_MOUSE_BUTTON_0,
    const ScrollDown = c.GLFW_MOUSE_BUTTON_1,
    const ScrollLeft = c.GLFW_MOUSE_BUTTON_2,
    const ScrollRight = c.GLFW_MOUSE_BUTTON_3,
    const Left = c.GLFW_MOUSE_BUTTON_LEFT,
    const Right = c.GLFW_MOUSE_BUTTON_RIGHT,
    const Middle = c.GLFW_MOUSE_BUTTON_MIDDLE,
};


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
        { var i: usize = 0; while(i < MAX_KEYS) : (i += 1) {
            self.keyPressed[i] = self.keyDown[i] and !self.prevKeyState[i];
        }}
        std.mem.copy(bool, self.prevKeyState[0..], self.keyDown[0..]);

        { var i: usize = 0; while(i < MAX_BUTTONS) : (i += 1) {
            self.buttonPressed[i] = self.buttonDown[i] and !self.prevButtonState[i];
        }}
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