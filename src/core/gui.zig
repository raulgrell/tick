const t = @import("../index.zig");

const Control = enum {
    Label,
    Button,
    Toggle,
    Slider,
    SliderBar,
    ProgressBar,
    Spinner,
    ComboBox,
    CheckBox,
    TextBox,
};

const ControlState = enum {
    Disabled,
    Static,
    Normal,
    Focused,
    Pressed
};

// GUI controls state
const Theme = struct {
    const BORDER_WIDTH          = 1;
    const PADDING               = 2;
    const FONT_WIDTH            = 18;
    const FONT_HEIGHT           = 32;
    const BACKGROUND_COLOR      = 0xf5f5f5ff;
    const FOREGROUND_COLOR      = 0x90abb5ff;
    const HIGHLIGHT_COLOR       = 0x90abb5ff;
    const BORDER_COLOR_NORMAL   = 0x828282f;
    const BASE_COLOR_NORMAL     = 0xc8c8c8ff;
    const TEXT_COLOR_NORMAL     = 0x686868ff;
    const BORDER_COLOR_FOCUSED  = 0x7bb0d6ff;
    const BASE_COLOR_FOCUSED    = 0xc9effeff;
    const TEXT_COLOR_FOCUSED    = 0x6c9bbcff;
    const BORDER_COLOR_PRESSED  = 0x048cc7ff;
    const BASE_COLOR_PRESSED    = 0x7ceafeff;
    const TEXT_COLOR_PRESSED    = 0x0480b5ff;
    const BORDER_COLOR_DISABLED = 0xb1b1b1ff;
    const BASE_COLOR_DISABLED   = 0xfafafaff;
    const TEXT_COLOR_DISABLED   = 0xc8c8c8ff;
};

const Style = struct {
    lines: u32,
    base: u32,
    text: u32,
};

pub fn getStyle(state: ControlState) Style {
    return switch(state) {
        ControlState.Static => Style {
            .lines = Theme.FOREGROUND_COLOR,
            .base  = Theme.BACKGROUND_COLOR,
            .text  = Theme.TEXT_COLOR_NORMAL,
        },
        ControlState.Normal => Style {
            .lines = Theme.BORDER_COLOR_NORMAL,
            .base  = Theme.BASE_COLOR_NORMAL,
            .text  = Theme.TEXT_COLOR_NORMAL,
        },
        ControlState.Pressed => Style {
            .lines = Theme.BORDER_COLOR_PRESSED,
            .base  = Theme.BASE_COLOR_PRESSED,
            .text  = Theme.TEXT_COLOR_PRESSED,
        },
        ControlState.Focused => Style {
            .lines = Theme.BORDER_COLOR_FOCUSED,
            .base  = Theme.BASE_COLOR_FOCUSED,
            .text  = Theme.TEXT_COLOR_FOCUSED,
        },
        ControlState.Disabled => Style {
            .lines = Theme.BORDER_COLOR_DISABLED,
            .base  = Theme.BASE_COLOR_DISABLED,
            .text  = Theme.TEXT_COLOR_DISABLED,
        },
    };
}

pub const Rectangle = struct {
    x: f32,
    y: f32,
    width: f32,
    height: f32,
};

pub const Color = struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,
};

pub const GUI = struct {
    input: *InputManager,
    renderer: *IMRenderer,
    font: *Spritesheet,
    texture: *Texture,

    pub fn init(input: *InputManager, renderer: *IMRenderer, font: *Spritesheet, texture: *Texture) GUI {
        return GUI {
            .input = input,
            .renderer = renderer,
            .font = font,
            .texture = texture,
        };
    }

    // Label control
    pub fn Label(self: *GUI, bounds: *const Rectangle, text: []const u8) void {
        const text_bounds = self.textBounds(bounds, text);
        const state = init: { if (isCursorColliding(self.input.cursor_position, text_bounds)) {
            if (self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
                break :init ControlState.Pressed; 
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state);
        self.draw_centered_text(text, text_bounds, getColor(style.text));
    }

    pub fn Icon(self: *GUI, bounds: *const Rectangle, texture: *Texture) bool {
        var clicked = false;
        const state = init: { if (isCursorColliding(self.input.cursor_position, bounds)) {
            if (self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
                break :init ControlState.Pressed;
            } else if (self.input.prevButtonState[c.GLFW_MOUSE_BUTTON_LEFT]) {
                clicked = true;
                break :init ControlState.Normal;
            } else {
                break :init ControlState.Focused;
            } 
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state); 
        self.draw_outer(bounds, getColor(style.lines));
        self.draw_inner(bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_texture(texture, bounds, Theme.PADDING);
        return clicked;
    }
    
    // Button control, returns true when clicked
    pub fn Button(self: *GUI, bounds: *const Rectangle, text: []const u8) bool {
        const text_bounds = self.textBounds(bounds, text);
        
        var clicked = false;
        var state = ControlState.Normal;
        if (isCursorColliding(self.input.cursor_position, text_bounds)) {
            if (self.input.buttonPressed[c.GLFW_MOUSE_BUTTON_LEFT]) {
                state = ControlState.Pressed;
                clicked = true;
            } else {
                state = ControlState.Focused;
            }
        }
    
        const style = getStyle(state);
        self.draw_outer(text_bounds, getColor(style.lines));
        self.draw_inner(text_bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_centered_text(text, text_bounds, getColor(style.text));
    
        return clicked;
    }

    // Toggle Button, returns state
    pub fn ToggleButton(self: *GUI, bounds: *const Rectangle, text: []const u8, active: bool) bool {
        const text_bounds = self.textBounds(bounds, text);
        var button_active = active;
        const state = init: { if (isCursorColliding(self.input.cursor_position, text_bounds)) {
            if (self.input.buttonPressed[c.GLFW_MOUSE_BUTTON_LEFT]) {
                button_active = !active;
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = if (state == ControlState.Normal)
            getStyle(if (button_active) ControlState.Pressed else ControlState.Normal)
        else 
            getStyle(state);
    
        self.draw_outer(text_bounds, getColor(style.lines));
        self.draw_inner(text_bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_centered_text(text, text_bounds, getColor(style.text));
        
        return button_active;
    }
    
    // Toggle Group control, returns toggled button index
    pub fn ToggleGroup(self: *GUI, bounds: *const Rectangle, options: [][]const u8, active: *usize) void {
        for (options) | option, i | {
            const button_active = self.ToggleButton( Rectangle {
                .x = bounds.x + f32(i) * (bounds.width + Theme.PADDING),
                .y = bounds.y,
                .width = bounds.width,
                .height = bounds.height
            }, option, (i == active.*));
            if (i != active.* and button_active) active.* = i;
        }
    }
    
    // Check Box control, returns true when active
    pub fn CheckBox(self: *GUI, bounds: *const Rectangle, checked: *bool) void {
        const state = init: { if (isCursorColliding(self.input.cursor_position, bounds)) {
            if (self.input.buttonPressed[c.GLFW_MOUSE_BUTTON_LEFT]) {
                *checked = !(*checked);
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state); 
        self.draw_outer(bounds, getColor(style.lines));
        self.draw_inner(bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        if (*checked)
            self.draw_inner(bounds, getColor(style.lines ), Theme.BORDER_WIDTH + Theme.PADDING);
    }
    
    // Combo Box, returns selected item index
    pub fn ComboBox(self: *GUI, bounds: *const Rectangle, options: [][]const u8, active: *usize) void {
        const COMBOBOX_SELECTOR_WIDTH = 35;

        const box_bounds =  Rectangle {
            .x = bounds.x,
            .y = bounds.y,
            .width = bounds.width - (COMBOBOX_SELECTOR_WIDTH + Theme.PADDING),
            .height = bounds.height
        };
        
        const selector = Rectangle {
            .x = bounds.x + bounds.width + Theme.PADDING,
            .y = bounds.y,
            .width = COMBOBOX_SELECTOR_WIDTH,
            .height = bounds.height
        };
        
        active.* = if (active.* < 0) 0 else if (active.* > options.len - 1) options.len - 1 else active.*;
        
        const text_bounds = self.textBounds(box_bounds, options[active.*]);
    
        var clicked = false;   
        const state = init: { if (isCursorColliding(self.input.cursor_position, bounds)
                or isCursorColliding(self.input.cursor_position, selector)) {
            if (self.input.buttonPressed[c.GLFW_MOUSE_BUTTON_LEFT]) {
                clicked = true;
                active.* = if (active.* < options.len - 1) active.* + 1 else 0;
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state); 
        self.draw_outer(text_bounds, getColor(style.lines));
        self.draw_inner(text_bounds, getColor(style.base ), Theme.BORDER_WIDTH);
    
        self.draw_outer(selector, getColor(style.lines));
        self.draw_inner(selector, getColor(style.base ), Theme.BORDER_WIDTH);
        
        self.draw_centered_text(options[active.*], text_bounds, getColor(style.text));
    
        var selection_buffer = [] u8{0} ** 16;
        const selection_text = std.fmt.bufPrint(selection_buffer[0..], "{}/{}", active.* + 1, options.len) catch unreachable;
        self.draw_centered_text(
            selection_text,
            selector,
            getColor(Theme.FOREGROUND_COLOR)
        );
    }
    
    // Slider control, returns selected value
    pub fn Slider(self: *GUI, bounds: *const Rectangle, min_value: f32, max_value: f32, value: *f32) void {
        if (*value < min_value) *value = min_value else if (*value > max_value) *value = max_value;

        const slider_ratio =  *value / (max_value - min_value);
        var slider = Rectangle {
            .x = bounds.x + slider_ratio * ((bounds.width - 2*Theme.BORDER_WIDTH) - 10),
            .y = bounds.y + Theme.BORDER_WIDTH,
            .width = 20,
            .height = bounds.height - 2*Theme.BORDER_WIDTH
        };
    
        const state = init: { if (isCursorColliding(self.input.cursor_position, bounds)) {
            if (self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
                *value = (((max_value - min_value)*(self.input.cursor_position.x - bounds.x))/bounds.width) + min_value;
                if (*value > max_value) *value = max_value else if (*value < min_value) *value = min_value;
                slider.x = bounds.x + ((*value/(max_value - min_value)) * (bounds.width - 2*Theme.BORDER_WIDTH)) - slider.width/2;
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state); 
        self.draw_outer(bounds, getColor(style.lines));
        self.draw_inner(bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_outer(slider, getColor(style.base));
    }
    
    // Slider Bar control, returns selected value
    pub fn SliderBar(self: *GUI, bounds: *const Rectangle, min_value: f32, max_value: f32, value: *f32) void {
        const range = (max_value - min_value);
        const slider_ratio = *value / range;
        var slider = Rectangle {
            .x = bounds.x + Theme.BORDER_WIDTH, 
            .y = bounds.y + Theme.BORDER_WIDTH,
            .width = slider_ratio * (bounds.width - 2 * Theme.BORDER_WIDTH),
            .height = bounds.height - 2*Theme.BORDER_WIDTH,
        };
        
        const state = init: { if (isCursorColliding(self.input.cursor_position, bounds)) {
            if (self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
                *value = ((range * (self.input.cursor_position.x - bounds.x)) / bounds.width) + min_value;
                if (*value > max_value) *value = max_value else if (*value < min_value) *value = min_value;
                slider.width = ((*value/range)*(bounds.width - 2*Theme.BORDER_WIDTH));
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state); 
        self.draw_outer(bounds, getColor(style.lines));
        self.draw_inner(bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_outer(slider, getColor(style.lines));
    }
    
    // Progress Bar control, shows current progress value
    pub fn ProgressBar(self: *GUI, bounds: *const Rectangle, min_value: f32, max_value: f32, value: *f32) void {
        if (*value < min_value) *value = min_value else if (*value > max_value) *value = max_value;
        const progress_ratio =  *value / (max_value - min_value);
        const progress = Rectangle {
            .x = bounds.x + Theme.BORDER_WIDTH, 
            .y = bounds.y + Theme.BORDER_WIDTH,
            .width = progress_ratio * (bounds.width - 2*Theme.BORDER_WIDTH),
            .height = bounds.height - 2*Theme.BORDER_WIDTH,
        };
        
        const state = if (isCursorColliding(self.input.cursor_position, bounds))
            ControlState.Focused
        else
            ControlState.Normal;
    
        const style = getStyle(state);
        self.draw_outer(bounds, getColor(style.lines));
        self.draw_inner(bounds, getColor(Theme.BACKGROUND_COLOR ), Theme.BORDER_WIDTH);
        self.draw_outer(progress, getColor(style.base)); 
    }
    
    // Spinner control, returns selected value
    pub fn Spinner(self: *GUI, bounds: *const Rectangle, min_value: i32, max_value: i32, value: *i32) void {  
        const SPINNER_LEFT_BUTTON = 1;
        const SPINNER_RIGHT_BUTTON = 2;
        const SPINNER_BUTTON_WIDTH = 35;
        const spinner = Rectangle {
            .x = bounds.x + SPINNER_BUTTON_WIDTH + Theme.PADDING,
            .y = bounds.y,
            .width = bounds.width - 2*(SPINNER_BUTTON_WIDTH + Theme.PADDING),
            .height = bounds.height
        };
        const left_button_bounds = Rectangle {
            .x = bounds.x,
            .y = bounds.y,
            .width = SPINNER_BUTTON_WIDTH,
            .height = bounds.height
        };
        const right_button_bounds = Rectangle {
            .x = bounds.x + bounds.width - SPINNER_BUTTON_WIDTH,
            .y = bounds.y,
            .width = SPINNER_BUTTON_WIDTH,
            .height = bounds.height
        };

        var value_buffer = [] u8{0} ** 16;
        const value_text = std.fmt.bufPrint(value_buffer[0..], "{}", *value) catch unreachable;
        const text_bounds = self.textBounds(bounds, value_text);
            
        const state = init: { if (isCursorColliding(self.input.cursor_position, left_button_bounds)) {
            if (self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
                if (*value > min_value) *value -= 1;
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else if (isCursorColliding(self.input.cursor_position, right_button_bounds)) {
            if (self.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT]) {
                if (*value < max_value) *value += 1;
                break :init ControlState.Pressed;
            } else {
                break :init ControlState.Focused;
            }
        } else {
            break :init ControlState.Normal;
        }};
    
        const style = getStyle(state); 
        self.draw_outer(text_bounds, getColor(style.lines));
        self.draw_inner(text_bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_centered_text(
            value_text,
            spinner,
            getColor(Theme.FOREGROUND_COLOR)
        );
    }
    
    // Text Box control, updates input text
    pub fn TextBox(self: *GUI, bounds: *const Rectangle, text: []const u8) void {
        const state = if (isCursorColliding(self.input.cursor_position, bounds))
            ControlState.Focused
        else 
            ControlState.Normal;
    
        const style = getStyle(state); 
        self.draw_outer(bounds, getColor(style.lines));
        self.draw_inner(bounds, getColor(style.base ), Theme.BORDER_WIDTH);
        self.draw_text(
            text, 
            bounds,
            getColor(style.text));
        if (state == ControlState.Focused) {
            const text_cursor_bounds = Rectangle {
                .x = bounds.x + 4 + textWidth(text, Theme.FONT_WIDTH),
                .y = bounds.y + Theme.BORDER_WIDTH,
                .width = Theme.FONT_WIDTH,
                .height = Theme.FONT_HEIGHT - (Theme.BORDER_WIDTH * 2),
            };
            self.draw_inner(text_cursor_bounds, getColor(style.lines), Theme.BORDER_WIDTH);
        }
    }
    
    fn draw_outer(self: *GUI, bounds: *const Rectangle, color: *const Color) void {
        self.renderer.draw_rect(
            self.texture,
            bounds.x,
            bounds.y,
            bounds.width,
            bounds.height
        );
    }
    
    fn draw_inner(self: *GUI, bounds: *const Rectangle, color: *const Color, padding: f32 ) void {
        self.renderer.draw_rect(
            self.texture,
            bounds.x + padding,
            bounds.y + padding,
            bounds.width - 2 * padding,
            bounds.height - 2 * padding,
        );
    }  

    fn draw_texture(self: *GUI, texture: *Texture, bounds: *const Rectangle, padding: f32 ) void {
        self.renderer.draw_rect(
            texture,
            bounds.x,
            bounds.y,
            bounds.width,
            bounds.height
        );
    }

    fn draw_text(self: *GUI, text: []const u8, bounds: *const Rectangle, color: *const Color) void {
        self.renderer.draw_text( self.font, text, bounds.x, bounds.y, 1 );
    }
    
    fn draw_centered_text(self: *GUI, text: []const u8,  bounds: *const Rectangle, color: *const Color) void {
        const text_width = textWidth(text, Theme.FONT_WIDTH);
        const text_height = f32(Theme.FONT_HEIGHT);
        self.renderer.draw_text(
            self.font,
            text,
            bounds.x + bounds.width  / 2 - text_width  / 2,
            bounds.y + bounds.height / 2 - text_height / 2,
            1,
        );
    }
    
    fn textBounds(self: *GUI, bounds: *const Rectangle, text: []const u8)Rectangle {
        const text_width = textWidth(text, Theme.FONT_WIDTH);
        const text_height = f32(Theme.FONT_HEIGHT);
        return Rectangle {
            .x = bounds.x,
            .y = bounds.y,
            .width =  if (bounds.width  < text_width)  text_width  else bounds.width,
            .height = if (bounds.height < text_height) text_height else bounds.height,
        };
    }

    fn isCursorColliding(point: *const Vec2, rec: *const Rectangle)bool {
        return (
            (point.x >= rec.x) and (point.x <= (rec.x + rec.width)) and
            (point.y >= rec.y) and (point.y <= (rec.y + rec.height))
        );
    }

    fn textWidth(text: []const u8, size: usize)f32 {
        return f32(text.len * size);
    }    
};

// Returns a Color struct from hexadecimal value
fn getColor(hexValue: u32)Color {
    return Color {
        .r = @truncate(u8, hexValue >>  24) & 0xFF,
        .g = @truncate(u8, hexValue >>  16) & 0xFF,
        .b = @truncate(u8, hexValue >>   8) & 0xFF,
        .a = @truncate(u8, hexValue) & 0xFF
    };
}

// Returns hexadecimal value for a Color
fn getHex(color: *const Color)int {
    return (color.r << 24) | (color.g << 16) | (color.b <<  8) | (color.a);
}