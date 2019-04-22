const t = @import("../index.zig");

const Key = enum(@typeOf(c.GLFW_KEY_LAST)) {
    Space = c.GLFW_KEY_SPACE,
    Apostrophe = c.GLFW_KEY_APOSTROPHE,
    Comma = c.GLFW_KEY_COMMA,
    Minus = c.GLFW_KEY_MINUS,
    Period = c.GLFW_KEY_PERIOD,
    Slash = c.GLFW_KEY_SLASH,
    Num0 = c.GLFW_KEY_0,
    Num1 = c.GLFW_KEY_1,
    Num2 = c.GLFW_KEY_2,
    Num3 = c.GLFW_KEY_3,
    Num4 = c.GLFW_KEY_4,
    Num5 = c.GLFW_KEY_5,
    Num6 = c.GLFW_KEY_6,
    Num7 = c.GLFW_KEY_7,
    Num8 = c.GLFW_KEY_8,
    Num9 = c.GLFW_KEY_9,
    SemiColon = c.GLFW_KEY_SEMICOLON,
    Equal = c.GLFW_KEY_EQUAL,
    A = c.GLFW_KEY_A,
    B = c.GLFW_KEY_B,
    C = c.GLFW_KEY_C,
    D = c.GLFW_KEY_D,
    E = c.GLFW_KEY_E,
    F = c.GLFW_KEY_F,
    G = c.GLFW_KEY_G,
    H = c.GLFW_KEY_H,
    I = c.GLFW_KEY_I,
    J = c.GLFW_KEY_J,
    K = c.GLFW_KEY_K,
    L = c.GLFW_KEY_L,
    M = c.GLFW_KEY_M,
    N = c.GLFW_KEY_N,
    O = c.GLFW_KEY_O,
    P = c.GLFW_KEY_P,
    Q = c.GLFW_KEY_Q,
    R = c.GLFW_KEY_R,
    S = c.GLFW_KEY_S,
    T = c.GLFW_KEY_T,
    U = c.GLFW_KEY_U,
    V = c.GLFW_KEY_V,
    W = c.GLFW_KEY_W,
    X = c.GLFW_KEY_X,
    Y = c.GLFW_KEY_Y,
    Z = c.GLFW_KEY_Z,
    OpenBracket = c.GLFW_KEY_LEFT_BRACKET,
    BackSlash = c.GLFW_KEY_BACKSLASH,
    CloseBracket = c.GLFW_KEY_RIGHT_BRACKET,
    GraveAccent = c.GLFW_KEY_GRAVE_ACCENT,
    World1 = c.GLFW_KEY_WORLD_1,
    World2 = c.GLFW_KEY_WORLD_2,
    Escape = c.GLFW_KEY_ESCAPE,
    Enter = c.GLFW_KEY_ENTER,
    Tab = c.GLFW_KEY_TAB,
    Backspace = c.GLFW_KEY_BACKSPACE,
    Insert = c.GLFW_KEY_INSERT,
    Delete = c.GLFW_KEY_DELETE,
    Right = c.GLFW_KEY_RIGHT,
    Left = c.GLFW_KEY_LEFT,
    Down = c.GLFW_KEY_DOWN,
    Up = c.GLFW_KEY_UP,
    PageUp = c.GLFW_KEY_PAGE_UP,
    PageDown = c.GLFW_KEY_PAGE_DOWN,
    Home = c.GLFW_KEY_HOME,
    End = c.GLFW_KEY_END,
    CapsLock = c.GLFW_KEY_CAPS_LOCK,
    ScrollLock = c.GLFW_KEY_SCROLL_LOCK,
    NumLock = c.GLFW_KEY_NUM_LOCK,
    PrintScreen = c.GLFW_KEY_PRINT_SCREEN,
    Pause = c.GLFW_KEY_PAUSE,
    F1 = c.GLFW_KEY_F1,
    F2 = c.GLFW_KEY_F2,
    F3 = c.GLFW_KEY_F3,
    F4 = c.GLFW_KEY_F4,
    F5 = c.GLFW_KEY_F5,
    F6 = c.GLFW_KEY_F6,
    F7 = c.GLFW_KEY_F7,
    F8 = c.GLFW_KEY_F8,
    F9 = c.GLFW_KEY_F9,
    F10 = c.GLFW_KEY_F10,
    F11 = c.GLFW_KEY_F11,
    F12 = c.GLFW_KEY_F12,
    F13 = c.GLFW_KEY_F13,
    F14 = c.GLFW_KEY_F14,
    F15 = c.GLFW_KEY_F15,
    F16 = c.GLFW_KEY_F16,
    F17 = c.GLFW_KEY_F17,
    F18 = c.GLFW_KEY_F18,
    F19 = c.GLFW_KEY_F19,
    F20 = c.GLFW_KEY_F20,
    F21 = c.GLFW_KEY_F21,
    F22 = c.GLFW_KEY_F22,
    F23 = c.GLFW_KEY_F23,
    F24 = c.GLFW_KEY_F24,
    F25 = c.GLFW_KEY_F25,
    KP0 = c.GLFW_KEY_KP_0,
    KP1 = c.GLFW_KEY_KP_1,
    KP2 = c.GLFW_KEY_KP_2,
    KP3 = c.GLFW_KEY_KP_3,
    KP4 = c.GLFW_KEY_KP_4,
    KP5 = c.GLFW_KEY_KP_5,
    KP6 = c.GLFW_KEY_KP_6,
    KP7 = c.GLFW_KEY_KP_7,
    KP8 = c.GLFW_KEY_KP_8,
    KP9 = c.GLFW_KEY_KP_9,
    KPDecimal = c.GLFW_KEY_KP_DECIMAL,
    KPDivide = c.GLFW_KEY_KP_DIVIDE,
    KPMultiply = c.GLFW_KEY_KP_MULTIPLY,
    KPSubtract = c.GLFW_KEY_KP_SUBTRACT,
    KPAdd = c.GLFW_KEY_KP_ADD,
    KPEnter = c.GLFW_KEY_KP_ENTER,
    KPEqual = c.GLFW_KEY_KP_EQUAL,
    LeftSift = c.GLFW_KEY_LEFT_SHIFT,
    LeftControl = c.GLFW_KEY_LEFT_CONTROL,
    LeftAlt = c.GLFW_KEY_LEFT_ALT,
    LeftSuper = c.GLFW_KEY_LEFT_SUPER,
    RightShift = c.GLFW_KEY_RIGHT_SHIFT,
    RightControl = c.GLFW_KEY_RIGHT_CONTROL,
    RightAlt = c.GLFW_KEY_RIGHT_ALT,
    RightSuper = c.GLFW_KEY_RIGHT_SUPER,
    Menu = c.GLFW_KEY_MENU,
};

fn getKey(sym: @typeOf(c.GLFW_KEY_LAST)) ?Key {
  return switch (sym) {
    c.GLFW_KEY_SPACE => Key.Space,
    c.GLFW_KEY_APOSTROPHE => Key.Apostrophe,
    c.GLFW_KEY_COMMA => Key.Comma,
    c.GLFW_KEY_MINUS => Key.Minus,
    c.GLFW_KEY_PERIOD => Key.Period,
    c.GLFW_KEY_SLASH => Key.Slash,
    c.GLFW_KEY_0 => Key.Num0,
    c.GLFW_KEY_1 => Key.Num1,
    c.GLFW_KEY_2 => Key.Num2,
    c.GLFW_KEY_3 => Key.Num3,
    c.GLFW_KEY_4 => Key.Num4,
    c.GLFW_KEY_5 => Key.Num5,
    c.GLFW_KEY_6 => Key.Num6,
    c.GLFW_KEY_7 => Key.Num7,
    c.GLFW_KEY_8 => Key.Num8,
    c.GLFW_KEY_9 => Key.Num9,
    c.GLFW_KEY_SEMICOLON => Key.SemiColon,
    c.GLFW_KEY_EQUAL => Key.Equal,
    c.GLFW_KEY_A => Key.A,
    c.GLFW_KEY_B => Key.B,
    c.GLFW_KEY_C => Key.C,
    c.GLFW_KEY_D => Key.D,
    c.GLFW_KEY_E => Key.E,
    c.GLFW_KEY_F => Key.F,
    c.GLFW_KEY_G => Key.G,
    c.GLFW_KEY_H => Key.H,
    c.GLFW_KEY_I => Key.I,
    c.GLFW_KEY_J => Key.J,
    c.GLFW_KEY_K => Key.K,
    c.GLFW_KEY_L => Key.L,
    c.GLFW_KEY_M => Key.M,
    c.GLFW_KEY_N => Key.N,
    c.GLFW_KEY_O => Key.O,
    c.GLFW_KEY_P => Key.P,
    c.GLFW_KEY_Q => Key.Q,
    c.GLFW_KEY_R => Key.R,
    c.GLFW_KEY_S => Key.S,
    c.GLFW_KEY_T => Key.T,
    c.GLFW_KEY_U => Key.U,
    c.GLFW_KEY_V => Key.V,
    c.GLFW_KEY_W => Key.W,
    c.GLFW_KEY_X => Key.X,
    c.GLFW_KEY_Y => Key.Y,
    c.GLFW_KEY_Z => Key.Z,
    c.GLFW_KEY_LEFT_BRACKET => Key.OpenBracket,
    c.GLFW_KEY_BACKSLASH => Key.BackSlash,
    c.GLFW_KEY_RIGHT_BRACKET => Key.CloseBracket,
    c.GLFW_KEY_GRAVE_ACCENT => Key.GraveAccent,
    c.GLFW_KEY_WORLD_1 => Key.World1,
    c.GLFW_KEY_WORLD_2 => Key.World2,
    c.GLFW_KEY_ESCAPE => Key.Escape,
    c.GLFW_KEY_ENTER => Key.Enter,
    c.GLFW_KEY_TAB => Key.Tab,
    c.GLFW_KEY_BACKSPACE => Key.Backspace,
    c.GLFW_KEY_INSERT => Key.Insert,
    c.GLFW_KEY_DELETE => Key.Delete,
    c.GLFW_KEY_RIGHT => Key.Right,
    c.GLFW_KEY_LEFT => Key.Left,
    c.GLFW_KEY_DOWN => Key.Down,
    c.GLFW_KEY_UP => Key.Up,
    c.GLFW_KEY_PAGE_UP => Key.PageUp,
    c.GLFW_KEY_PAGE_DOWN => Key.PageDown,
    c.GLFW_KEY_HOME => Key.Home,
    c.GLFW_KEY_END => Key.End,
    c.GLFW_KEY_CAPS_LOCK => Key.CapsLock,
    c.GLFW_KEY_SCROLL_LOCK => Key.ScrollLock,
    c.GLFW_KEY_NUM_LOCK => Key.NumLock,
    c.GLFW_KEY_PRINT_SCREEN => Key.PrintScreen,
    c.GLFW_KEY_PAUSE => Key.Pause,
    c.GLFW_KEY_F1 => Key.F1,
    c.GLFW_KEY_F2 => Key.F2,
    c.GLFW_KEY_F3 => Key.F3,
    c.GLFW_KEY_F4 => Key.F4,
    c.GLFW_KEY_F5 => Key.F5,
    c.GLFW_KEY_F6 => Key.F6,
    c.GLFW_KEY_F7 => Key.F7,
    c.GLFW_KEY_F8 => Key.F8,
    c.GLFW_KEY_F9 => Key.F9,
    c.GLFW_KEY_F10 => Key.F10,
    c.GLFW_KEY_F11 => Key.F11,
    c.GLFW_KEY_F12 => Key.F12,
    c.GLFW_KEY_F13 => Key.F13,
    c.GLFW_KEY_F14 => Key.F14,
    c.GLFW_KEY_F15 => Key.F15,
    c.GLFW_KEY_F16 => Key.F16,
    c.GLFW_KEY_F17 => Key.F17,
    c.GLFW_KEY_F18 => Key.F18,
    c.GLFW_KEY_F19 => Key.F19,
    c.GLFW_KEY_F20 => Key.F20,
    c.GLFW_KEY_F21 => Key.F21,
    c.GLFW_KEY_F22 => Key.F22,
    c.GLFW_KEY_F23 => Key.F23,
    c.GLFW_KEY_F24 => Key.F24,
    c.GLFW_KEY_F25 => Key.F25,
    c.GLFW_KEY_KP_0 => Key.KP0,
    c.GLFW_KEY_KP_1 => Key.KP1,
    c.GLFW_KEY_KP_2 => Key.KP2,
    c.GLFW_KEY_KP_3 => Key.KP3,
    c.GLFW_KEY_KP_4 => Key.KP4,
    c.GLFW_KEY_KP_5 => Key.KP5,
    c.GLFW_KEY_KP_6 => Key.KP6,
    c.GLFW_KEY_KP_7 => Key.KP7,
    c.GLFW_KEY_KP_8 => Key.KP8,
    c.GLFW_KEY_KP_9 => Key.KP9,
    c.GLFW_KEY_KP_DECIMAL => Key.KPDecimal,
    c.GLFW_KEY_KP_DIVIDE => Key.KPDivide,
    c.GLFW_KEY_KP_MULTIPLY => Key.KPMultiply,
    c.GLFW_KEY_KP_SUBTRACT => Key.KPSubtract,
    c.GLFW_KEY_KP_ADD => Key.KPAdd,
    c.GLFW_KEY_KP_ENTER => Key.KPEnter,
    c.GLFW_KEY_KP_EQUAL => Key.KPEqual,
    c.GLFW_KEY_LEFT_SHIFT => Key.LeftSift,
    c.GLFW_KEY_LEFT_CONTROL => Key.LeftControl,
    c.GLFW_KEY_LEFT_ALT => Key.LeftAlt,
    c.GLFW_KEY_LEFT_SUPER => Key.LeftSuper,
    c.GLFW_KEY_RIGHT_SHIFT => Key.RightShift,
    c.GLFW_KEY_RIGHT_CONTROL => Key.RightControl,
    c.GLFW_KEY_RIGHT_ALT => Key.RightAlt,
    c.GLFW_KEY_RIGHT_SUPER => Key.RightSuper,
    c.GLFW_KEY_MENU => Key.Menu,
  };
}

const MouseButton = enum(@typeOf(c.GLFW_KEY_LAST)) {
    B1 = c.GLFW_MOUSE_BUTTON_0,
    B2 = c.GLFW_MOUSE_BUTTON_1,
    B3 = c.GLFW_MOUSE_BUTTON_2,
    B4 = c.GLFW_MOUSE_BUTTON_3,
    B5 = c.GLFW_MOUSE_BUTTON_4,
    B6 = c.GLFW_MOUSE_BUTTON_5,
    B7 = c.GLFW_MOUSE_BUTTON_6,
    B8 = c.GLFW_MOUSE_BUTTON_7,
    ScrollUp = c.GLFW_MOUSE_BUTTON_0,
    ScrollDown = c.GLFW_MOUSE_BUTTON_1,
    ScrollLeft = c.GLFW_MOUSE_BUTTON_2,
    ScrollRight = c.GLFW_MOUSE_BUTTON_3,
    Left = c.GLFW_MOUSE_BUTTON_LEFT,
    Right = c.GLFW_MOUSE_BUTTON_RIGHT,
    Middle = c.GLFW_MOUSE_BUTTON_MIDDLE,
};

fn getButton(sym: @typeOf(c.GLFW_BUTTON_LAST)) ?MouseButton {
    return switch(button){
        c.GLFW_MOUSE_BUTTON_LEFT => MouseButton.Left;
        c.GLFW_MOUSE_BUTTON_RIGHT => MouseButton.Right;
        c.GLFW_MOUSE_BUTTON_MIDDLE => MouseButton.Middle;
        c.GLFW_MOUSE_BUTTON_4 => MouseButton.x1;
        c.GLFW_MOUSE_BUTTON_5 => MouseButton.x2;
        c.GLFW_MOUSE_BUTTON_6 => MouseButton.x3;
        c.GLFW_MOUSE_BUTTON_7 => MouseButton.x4;
        c.GLFW_MOUSE_BUTTON_8 => MouseButton.x5;
    };
}


pub const Event = union(enum) {
  KeyDown: Key,
  KeyUp: Key,
  Quit,
};

pub const ResizeEvent = struct {
    width: u32;
    height: u32;
};

pub const KeyEvent = struct {
    key: Key;
    mods: int;
};

pub const TextEvent = struct {
    codepoint: u32;
    mods: int;
};

pub const MouseEvent = struct {
    x: f32;
    y: f32;
    button: Button;
    mods: int;
};

pub const ScrollEvent = struct {
    xOffset: f32;
    yOffset: f32;
};

pub const FileDropEvent = struct {
    count: int;
    paths: [*][*]const u8;
};

std::queue<Event> eventQueue;

void init(GLFWwindow* window){
    glfwSetWindowSizeCallback(window, windowResizeCallback);
    glfwSetKeyCallback(window, keyCallback);
    glfwSetCharModsCallback(window, textCallback);
    glfwSetCursorPosCallback(window, cursorPosCallback);
    glfwSetCursorEnterCallback(window, cursorEnterLeaveCallback);
    glfwSetMouseButtonCallback(window, mouseButtonCallback);
    glfwSetScrollCallback(window, scrollCallback);
    glfwSetDropCallback(window, fileDropCallback);
}

bool pollEvents(Event &event){
    if(eventQueue.empty()){
        return false;
    }
    event = eventQueue.front();
    eventQueue.pop();
    return true;
}

//callbacks
void windowResizeCallback(GLFWwindow * window, int width, int height){
    makeEvent()
    event.type = Event::EventType::Resized;
    event.size.width = width;
    event.size.height = height;
    eventQueue.push(event);
}

void keyCallback(GLFWwindow * window, int key, int scancode, int action, int mods){
    makeEvent()
    if(action == GLFW_PRESS)
        event.type = Event::EventType::KeyPressed;
    if(action == GLFW_RELEASE)
        event.type = Event::EventType::KeyReleased;
    event.keyBoard.key = getKeyFromCode(key);
    event.keyBoard.mods = mods;
    eventQueue.push(event);
}

void textCallback(GLFWwindow * window, u32 codepoint, int mods){
    makeEvent()
    event.type = Event::EventType::TextEntered;
    event.text.codepoint = codepoint;
    event.text.mods = mods;
    eventQueue.push(event);
}

void cursorPosCallback(GLFWwindow * window, double x, double y){
    makeEvent()
    event.type = Event::EventType::MouseMoved;
    event.mouse.x = (f32) x;
    event.mouse.y = (f32) y;
    eventQueue.push(event);
}

void cursorEnterLeaveCallback(GLFWwindow * window, int entered){
    makeEvent()
    if(entered){
        event.type = Event::EventType::MouseEnter;
    } else {
        event.type = Event::EventType::MouseLeave;
    }
    eventQueue.push(event);
}

void mouseButtonCallback(GLFWwindow * window, int button, int action, int mods){
    makeEvent()
    if (action == GLFW_PRESS) event.type = Event::EventType::MouseButtonPressed;
    if (action == GLFW_RELEASE) event.type = Event::EventType::MouseButtonReleased;
    event.mouse.button = getButtonFromCode(button);
    event.mouse.mods = mods;
    eventQueue.push(event);
}

void scrollCallback(GLFWwindow * window, double xOffset, double yOffset){
    makeEvent()
    event.type = Event::EventType::Scrolled;
    event.scroll.xOffset = (f32) xOffset;
    event.scroll.yOffset = (f32) yOffset;
    eventQueue.push(event);
}

void fileDropCallback(GLFWwindow * window, int count, const char ** paths){
    Event event = Event();
    event.type = Event::EventType::FileDrop;
    event.drop.count = count;
    event.drop.paths = paths;
    eventQueue.push(event);
}

extern fn keyCallback(win: ?*c.GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) void {
    // Filter actions and make sure key is a valid array index for the input manager
    if (action == c.GLFW_REPEAT or key < 0) return;
    const app = @ptrCast(&App, @alignCast(@alignOf(App), c.glfwGetWindowUserPointer(win).?));
    switch (key) {
        c.GLFW_KEY_ESCAPE => c.glfwSetWindowShouldClose(win, c.GL_TRUE),
        else => app.input.keyDown[usize(key)] = (action != c.GLFW_RELEASE)
    }
}

extern fn cursorPositionCallback(win: ?*c.GLFWwindow, xpos: f64, ypos: f64) void {
    const app = @ptrCast(&App, @alignCast(@alignOf(App), ??c.glfwGetWindowUserPointer(win)));
    app.input.cursor_position = vec2(f32(xpos - 1), f32(ypos - 1));
}

extern fn cursorEnterCallback(win: ?*c.GLFWwindow, entered: c_int) void {
    std.debug.warn("Cursor {}", if (entered != 0) "entered" else "left");
}

extern fn mouseButtonCallback(win: ?*c.GLFWwindow, button: c_int, action: c_int, mods: c_int) void {
    if (button < 0) return;
    const app = @ptrCast(&App, @alignCast(@alignOf(App), ??c.glfwGetWindowUserPointer(win)));
    app.input.buttonDown[usize(button)] = (action != c.GLFW_RELEASE);
}

extern fn scroll_callback(win: ?*c.GLFWwindow, xpos: f64, ypos: f64) void {
    std.debug.warn("Scrolling: ({}, {})\n", xpos, ypos);
}

extern fn monitorCallback(monitor: ?*c.GLFWmonitor, event: c_int) void {
    if (event == c.GLFW_CONNECTED) {
        std.debug.warn("Monitor connected\n");
    } else if (event == c.GLFW_DISCONNECTED) {
        std.debug.warn("Monitor disconnected\n");
    }
}

extern fn joystickCallback(joy: c_int, event: c_int) void {
    if (event == c.GLFW_CONNECTED) {
        std.debug.warn("Joystick {} connected\n", joy);
    } else if (event == c.GLFW_DISCONNECTED) {
        std.debug.warn("Joystick {} disconnected\n", joy);
    }
}

extern fn closeWindowCallback(win: ?*c.GLFWwindow) void {
    c.glfwSetWindowShouldClose(win, c.GLFW_TRUE);
}

extern fn windowSizeCallback(win: ?*c.GLFWwindow, width: c_int, height: c_int) void {
    std.debug.warn("Window resized: {} x {}\n", width, height);
}

extern fn fileDropCallback(win: ?*c.GLFWwindow, count: c_int, paths: ?[*]?[*]const u8) void {
    std.debug.warn("Files dropped ({}):\n", count)
    var i: usize = 0; while (i < count) : (i += 1) {
        std.debug.warn("|   File {}: {}\n", i, paths.?[i]);
    } 
}