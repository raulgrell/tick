pub const Key = enum {
  Escape,
  Backspace,
  Return,
  F2,
  F3,
  F4,
  F5,
  Up,
  Down,
  Left,
  Right,
  Space,
  Tab,
  Backquote,
  M,
};

pub const Event = union(enum) {
  KeyDown: Key,
  KeyUp: Key,
  Quit,
};

const c = @import("c.zig");
const Event = @import("../event.zig").Event;
const Key = @import("../event.zig").Key;

fn getKey(sym: c.SDL_Keycode) ?Key {
  return switch (sym) {
    c.SDLK_ESCAPE => Key.Escape,
    c.SDLK_BACKSPACE => Key.Backspace,
    c.SDLK_RETURN => Key.Return,
    c.SDLK_F2 => Key.F2,
    c.SDLK_F3 => Key.F3,
    c.SDLK_F4 => Key.F4,
    c.SDLK_F5 => Key.F5,
    c.SDLK_UP => Key.Up,
    c.SDLK_DOWN => Key.Down,
    c.SDLK_LEFT => Key.Left,
    c.SDLK_RIGHT => Key.Right,
    c.SDLK_SPACE => Key.Space,
    c.SDLK_TAB => Key.Tab,
    c.SDLK_BACKQUOTE => Key.Backquote,
    c.SDLK_m => Key.M,
    else => null,
  };
}

pub fn translateEvent(sdl_event: c.SDL_Event) ?Event {
  switch (sdl_event.type) {
    c.SDL_KEYDOWN => {
      if (sdl_event.key.repeat == 0) {
        if (getKey(sdl_event.key.keysym.sym)) |key| {
          return Event{ .KeyDown = key};
        }
      }
    },
    c.SDL_KEYUP => {
      if (getKey(sdl_event.key.keysym.sym)) |key| {
        return Event{ .KeyUp = key };
      }
    },
    c.SDL_QUIT => {
      return Event{ .Quit = {} };
    },
    else => {},
  }

  return null;
}

const Event = struct {
    const ResizeEvent = struct {
        unsigned int width;
        unsigned int height;
    };

    const KeyEvent = struct {
        Key key;
        int mods;
    };

    const TextEvent = struct {
        unsigned int codepoint;
        int mods;
    };

    const MouseEvent = struct {
        float x;
        float y;
        Button button;
        int mods;
    };

    const ScrollEvent = struct {
        float xOffset;
        float yOffset;
    };

    const FileDropEvent = struct {
        int count;
        const char ** paths;
    };

    const EventType = enum {
        Resized,
        KeyPressed,
        KeyReleased,
        TextEntered,
        MouseMoved,
        MouseButtonPressed,
        MouseButtonReleased,
        MouseEnter,
        MouseLeave,
        Scrolled,
        FileDrop
    } type;

    union {
        ResizeEvent size;
        KeyEvent keyBoard;
        TextEvent text;
        MouseEvent mouse;
        ScrollEvent scroll;
        FileDropEvent drop;
    };
};

class EventManager{
    std::queue<Event> eventQueue;
    void windowResizeCallback(GLFWwindow* window, int width, int height);
    void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods);
    void textCallback(GLFWwindow* window, unsigned int codepoint, int mods);
    void cursorPosCallback(GLFWwindow* window, double x, double y);
    void cursorEnterLeaveCallback(GLFWwindow* window, int entered);
    void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods);
    void scrollCallback(GLFWwindow* window, double xOffset, double yOffset);
    void fileDropCallback(GLFWwindow* window, int count, const char** paths);
};

std::queue<Event> EventManager::eventQueue;

void EventManager::init(GLFWwindow* window){
    glfwSetWindowSizeCallback(window, windowResizeCallback);
    glfwSetKeyCallback(window, keyCallback);
    glfwSetCharModsCallback(window, textCallback);
    glfwSetCursorPosCallback(window, cursorPosCallback);
    glfwSetCursorEnterCallback(window, cursorEnterLeaveCallback);
    glfwSetMouseButtonCallback(window, mouseButtonCallback);
    glfwSetScrollCallback(window, scrollCallback);
    glfwSetDropCallback(window, fileDropCallback);
}

bool EventManager::pollEvents(Event &event){
    if(EventManager::eventQueue.empty()){
        return false;
    }
    event = EventManager::eventQueue.front();
    EventManager::eventQueue.pop();
    return true;
}

//callbacks
void EventManager::windowResizeCallback(GLFWwindow * window, int width, int height){
    Event event;
    event.type = Event::EventType::Resized;
    event.size.width = width;
    event.size.height = height;
    EventManager::eventQueue.push(event);
}

void EventManager::keyCallback(GLFWwindow * window, int key, int scancode, int action, int mods){
    Event event;
    if(action == GLFW_PRESS)
        event.type = Event::EventType::KeyPressed;
    if(action == GLFW_RELEASE)
        event.type = Event::EventType::KeyReleased;
    event.keyBoard.key = getKeyFromCode(key);
    event.keyBoard.mods = mods;
    EventManager::eventQueue.push(event);
}

void EventManager::textCallback(GLFWwindow * window, unsigned int codepoint, int mods){
    Event event;
    event.type = Event::EventType::TextEntered;
    event.text.codepoint = codepoint;
    event.text.mods = mods;
    EventManager::eventQueue.push(event);
}

void EventManager::cursorPosCallback(GLFWwindow * window, double x, double y){
    Event event;
    event.type = Event::EventType::MouseMoved;
    event.mouse.x = (float) x;
    event.mouse.y = (float) y;
    EventManager::eventQueue.push(event);
}

void EventManager::cursorEnterLeaveCallback(GLFWwindow * window, int entered){
    Event event;
    if(entered){
        event.type = Event::EventType::MouseEnter;
    } else {
        event.type = Event::EventType::MouseLeave;
    }
    EventManager::eventQueue.push(event);
}

void EventManager::mouseButtonCallback(GLFWwindow * window, int button, int action, int mods){
    Event event;
    if(action == GLFW_PRESS)
        event.type = Event::EventType::MouseButtonPressed;
    if(action == GLFW_RELEASE)
        event.type = Event::EventType::MouseButtonReleased;
    event.mouse.button = getButtonFromCode(button);
    event.mouse.mods = mods;
    EventManager::eventQueue.push(event);
}

void EventManager::scrollCallback(GLFWwindow * window, double xOffset, double yOffset){
    Event event;
    event.type = Event::EventType::Scrolled;
    event.scroll.xOffset = (float) xOffset;
    event.scroll.yOffset = (float) yOffset;
    EventManager::eventQueue.push(event);
}

void EventManager::fileDropCallback(GLFWwindow * window, int count, const char ** paths){
    Event event = Event();

    event.type = Event::EventType::FileDrop;
    event.drop.count = count;
    event.drop.paths = paths;
    EventManager::eventQueue.push(event);
}
    
Key EventManager::getKeyFromCode(int key){
    switch(key){
        GLFW_KEY_SPACE => return Key.Space;    
        GLFW_KEY_APOSTROPHE => return Key.SingleQuote;    
        GLFW_KEY_COMMA => return Key.Comma;    
        GLFW_KEY_MINUS => return Key.Subtract;    
        GLFW_KEY_PERIOD => return Key.Period;    
        GLFW_KEY_SLASH => return Key.ForwardSlash;    
        GLFW_KEY_0 => return Key.Num0;    
        GLFW_KEY_1 => return Key.Num1;    
        GLFW_KEY_2 => return Key.Num2;    
        GLFW_KEY_3 => return Key.Num3;    
        GLFW_KEY_4 => return Key.Num4;    
        GLFW_KEY_5 => return Key.Num5;    
        GLFW_KEY_6 => return Key.Num6;    
        GLFW_KEY_7 => return Key.Num7;    
        GLFW_KEY_8 => return Key.Num8;    
        GLFW_KEY_9 => return Key.Num9;    
        GLFW_KEY_SEMICOLON => return Key.SemiColon;    
        GLFW_KEY_EQUAL => return Key.Equal;    
        GLFW_KEY_A => return Key.A;    
        GLFW_KEY_B => return Key.B;    
        GLFW_KEY_C => return Key.C;    
        GLFW_KEY_D => return Key.D;    
        GLFW_KEY_E => return Key.E;    
        GLFW_KEY_F => return Key.F;    
        GLFW_KEY_G => return Key.G;    
        GLFW_KEY_H => return Key.H;    
        GLFW_KEY_I => return Key.I;    
        GLFW_KEY_J => return Key.J;    
        GLFW_KEY_K => return Key.K;    
        GLFW_KEY_L => return Key.L;    
        GLFW_KEY_M => return Key.M;    
        GLFW_KEY_N => return Key.N;    
        GLFW_KEY_O => return Key.O;    
        GLFW_KEY_P => return Key.P;    
        GLFW_KEY_Q => return Key.;    
        GLFW_KEY_R => return Key.Q;    
        GLFW_KEY_S => return Key.S;    
        GLFW_KEY_T => return Key.T;    
        GLFW_KEY_U => return Key.U;    
        GLFW_KEY_V => return Key.V;    
        GLFW_KEY_W => return Key.W;    
        GLFW_KEY_X => return Key.X;    
        GLFW_KEY_Y => return Key.Y;    
        GLFW_KEY_Z => return Key.Z;    
        GLFW_KEY_LEFT_BRACKET => return Key.OpenBracket;    
        GLFW_KEY_BACKSLASH => return Key.BackSlash;    
        GLFW_KEY_RIGHT_BRACKET => return Key.CloseBracket;    
        GLFW_KEY_GRAVE_ACCENT => return Key.;    
        GLFW_KEY_WORLD_1 => return Key.WIN;    
        GLFW_KEY_WORLD_2 => return Key.WIN;    
        GLFW_KEY_ESCAPE => return Key.Escape;    
        GLFW_KEY_ENTER => return Key.Enter;    
        GLFW_KEY_TAB => return Key.Tab;    
        GLFW_KEY_BACKSPACE => return Key.Backspace;    
        GLFW_KEY_INSERT => return Key.Insert;    
        GLFW_KEY_DELETE => return Key.Delete;    
        GLFW_KEY_RIGHT => return Key.Right;    
        GLFW_KEY_LEFT => return Key.Left;    
        GLFW_KEY_DOWN => return Key.Down;    
        GLFW_KEY_UP => return Key.Up;    
        GLFW_KEY_PAGE_UP => return Key.PageUp;    
        GLFW_KEY_PAGE_DOWN => return Key.PageDown;    
        GLFW_KEY_HOME => return Key.Home;    
        GLFW_KEY_END => return Key.End;    
        GLFW_KEY_CAPS_LOCK => return Key.CapsLock;    
        GLFW_KEY_SCROLL_LOCK => return Key.ScrollLock;    
        GLFW_KEY_NUM_LOCK => return Key.NumLock;    
        GLFW_KEY_PAUSE => return Key.Pause;    
        GLFW_KEY_F1 => return Key.F1;    
        GLFW_KEY_F2 => return Key.F2;    
        GLFW_KEY_F3 => return Key.F3;    
        GLFW_KEY_F4 => return Key.F4;    
        GLFW_KEY_F5 => return Key.F5;    
        GLFW_KEY_F6 => return Key.F6;    
        GLFW_KEY_F7 => return Key.F7;    
        GLFW_KEY_F8 => return Key.F8;    
        GLFW_KEY_F9 => return Key.F9;    
        GLFW_KEY_F10 => return Key.F10;    
        GLFW_KEY_F11 => return Key.F11;    
        GLFW_KEY_F12 => return Key.F12;    
        GLFW_KEY_KP_0 => return Key.NumPad0;    
        GLFW_KEY_KP_1 => return Key.NumPad1;    
        GLFW_KEY_KP_2 => return Key.NumPad2;    
        GLFW_KEY_KP_3 => return Key.NumPad3;    
        GLFW_KEY_KP_4 => return Key.NumPad4;    
        GLFW_KEY_KP_5 => return Key.NumPad5;    
        GLFW_KEY_KP_6 => return Key.NumPad6;    
        GLFW_KEY_KP_7 => return Key.NumPad7;    
        GLFW_KEY_KP_8 => return Key.NumPad8;    
        GLFW_KEY_KP_9 => return Key.NumPad9;    
        GLFW_KEY_KP_DECIMAL => return Key.Decimal;    
        GLFW_KEY_KP_DIVIDE => return Key.Divide;    
        GLFW_KEY_KP_MULTIPLY => return Key.Multiply;    
        GLFW_KEY_KP_SUBTRACT => return Key.Subtract;    
        GLFW_KEY_KP_ADD => return Key.Add;    
        GLFW_KEY_KP_ENTER => return Key.Enter;    
        GLFW_KEY_KP_EQUAL => return Key.Equal;    
        GLFW_KEY_LEFT_SHIFT => return Key.LeftShift;    
        GLFW_KEY_LEFT_CONTROL => return Key.LeftCtrl;    
        GLFW_KEY_LEFT_ALT => return Key.LeftAlt;    
        GLFW_KEY_LEFT_SUPER => return Key.Win;    
        GLFW_KEY_RIGHT_SHIFT => return Key.RightShift;    
        GLFW_KEY_RIGHT_CONTROL => return Key.RightCtrl;    
        GLFW_KEY_RIGHT_ALT => return Key.RightAlt;    
        GLFW_KEY_RIGHT_SUPER => return Key.Win;    
    }
}

Button EventManager::getButtonFromCode(int button){
    switch(button){
        GLFW_MOUSE_BUTTON_LEFT => return MouseButton.Left;
        GLFW_MOUSE_BUTTON_RIGHT => return MouseButton.Right;
        GLFW_MOUSE_BUTTON_MIDDLE => return MouseButton.Middle;
        GLFW_MOUSE_BUTTON_4 => return MouseButton.x1;
        GLFW_MOUSE_BUTTON_5 => return MouseButton.x2;
        GLFW_MOUSE_BUTTON_6 => return MouseButton.x3;
        GLFW_MOUSE_BUTTON_7 => return MouseButton.x4;
        GLFW_MOUSE_BUTTON_8 => return MouseButton.x5;
    }
}