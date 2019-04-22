const std = @import("std");
const X = @import("c.zig");

pub fn ptr(p: var) t: {
    const T = @typeOf(p);
    const info = @typeInfo(@typeOf(p)).Pointer;
    break :t if (info.is_const) ?[*]const info.child else ?[*]info.child;
} {
    return @ptrCast(@typeInfo(@typeOf(this)).Fn.return_type.?, p);
}

var c: *X.xcb_connection_t = undefined;
var screens: [*]X.xcb_screen_t = undefined;
var foreground: X.xcb_gcontext_t = undefined;
var fill: X.xcb_gcontext_t = undefined;
var win: X.xcb_drawable_t = undefined;
var pid: X.xcb_drawable_t = undefined;
var line_start: X.xcb_point_t = undefined;

pub fn main() !void {
  c = X.xcb_connect(0, 0) orelse return error.ConnectionFailed;
  screens = X.xcb_setup_roots_iterator(X.xcb_get_setup(c)).data; // orelse return error.SetupFailed;
  create_window();
  _ = X.xcb_flush(c);
  event_loop();
}

fn create_window() void {
  // black foreground graphic context
  foreground = X.xcb_generate_id (c);
  var mask = @intCast(u32, @enumToInt(X.XCB_GC_FOREGROUND)) | @intCast(u32, @enumToInt(X.XCB_GC_GRAPHICS_EXPOSURES));
  var values = [2]u32 { @intCast(u32, screens[0].black_pixel), 0};
  _ = X.xcb_create_gc(c, foreground, screens[0].root, mask, @ptrCast(*c_void, &values));

  // make the background pixmap for the window
  pid = X.xcb_generate_id (c);
  _ = X.xcb_create_pixmap(c,
        screens[0].root_depth,
        pid,
        screens[0].root,
        500, 500);

  // context for filling with white
  fill = X.xcb_generate_id(c);
  mask = @intCast(u32, @enumToInt(X.XCB_GC_FOREGROUND)) | @intCast(u32, @enumToInt(X.XCB_GC_BACKGROUND));
  values[0] = @intCast(u32, screens[0].white_pixel);
  values[1] = @intCast(u32, screens[0].white_pixel);
  _ = X.xcb_create_gc(c, fill, pid, mask, @ptrCast(*c_void, &values));

  // Create the window
  win = X.xcb_generate_id(c);
  mask = @intCast(u32, @enumToInt(X.XCB_CW_BACK_PIXMAP)) | @intCast(u32, @enumToInt(X.XCB_CW_EVENT_MASK));
  values[0] = @intCast(u32, pid);
  values[1] = @intCast(u32, @enumToInt(X.XCB_EVENT_MASK_EXPOSURE))
    | @intCast(u32, @enumToInt(X.XCB_EVENT_MASK_BUTTON_PRESS))  
    | @intCast(u32, @enumToInt(X.XCB_EVENT_MASK_BUTTON_RELEASE))
    | @intCast(u32, @enumToInt(X.XCB_EVENT_MASK_BUTTON_MOTION)) 
    | @intCast(u32, @enumToInt(X.XCB_EVENT_MASK_KEY_PRESS))
    | @intCast(u32, @enumToInt(X.XCB_EVENT_MASK_KEY_RELEASE));

  _ = X.xcb_create_window(c,             // Connection         
    screens[0].root_depth,           // depth              
    win,                             // window Id          
    screens[0].root,                 // parent window      
    0, 0,                            // x, y               
    600, 400,                        // width, height      
    10,                              // border_width       
    @intCast(u16, @enumToInt(X.XCB_WINDOW_CLASS_INPUT_OUTPUT)), // class              
    screens[0].root_visual,          // visual             
    @intCast(u32, mask), @ptrCast(*c_void, &values));                   // masks

  // Map the window on the screen
  _ = X.xcb_map_window (c, win);

  // fill the pixmap with white (it starts empty)
  var rect = []X.xcb_rectangle_t { X.xcb_rectangle_t {
    .x = 0,
    .y = 0,
    .width = 500,
    .height = 500 }};
  _ = X.xcb_poly_fill_rectangle(c, pid, fill, 1, &rect[0]);
}

fn event_loop() void {
  while (true) {
    var e = X.xcb_wait_for_event(c);
    if (e == 0) break;
    switch (e[0].response_type & ~(u8)(0x80)) {
      X.XCB_KEY_PRESS => {
        // fill pixmap with white
        const rect = []X.xcb_rectangle_t { X.xcb_rectangle_t {
          .x = 0,
          .y = 0,
          .width = 500,
          .height = 500}
        };
        _ = X.xcb_poly_fill_rectangle_checked(c, pid, fill, 1, &rect[0]);
        // clear win to reveal pixmap
        _ = X.xcb_clear_area(c, 1, win, 0, 0, 500,500);
        _ = X.xcb_flush(c);
      },
      X.XCB_MOTION_NOTIFY => {
        const ev = @ptrCast(*X.xcb_motion_notify_event_t, e);
        // 1. clear the area on the win between line_start and mouse_pos (or whole win)
        // 2. update mouse_pos
        // 3. draw line from line_start to mouse_pos
        _ = X.xcb_clear_area(c, 1, win,0, 0, 500,500);
        var mouse_pos = X.xcb_point_t { 
          .x = ev.event_x - line_start.x,
          .y = ev.event_y - line_start.y};
        var points = []X.xcb_point_t { line_start, mouse_pos };
        _ = X.xcb_poly_line (c, @intCast(u8, @enumToInt(X.XCB_COORD_MODE_PREVIOUS)), win, foreground, 2, &points[0]);
        _ = X.xcb_flush(c);
      },
      X.XCB_BUTTON_PRESS => {
        const ev = @ptrCast(*X.xcb_button_press_event_t, e);
        line_start = X.xcb_point_t {
          .x = ev.event_x, 
          .y = ev.event_y
        };
        _ = X.xcb_flush (c);
      },
      X.XCB_BUTTON_RELEASE => {
        const ev = @ptrCast(*X.xcb_button_release_event_t, e);
        var line_end = X.xcb_point_t { 
          .x = ev.event_x - line_start.x,
          .y = ev.event_y - line_start.y
        };
        var points = []X.xcb_point_t { line_start, line_end };
        _ = X.xcb_poly_line (c, @intCast(u8, @enumToInt(X.XCB_COORD_MODE_PREVIOUS)), pid, foreground, 2, &points[0]);
        _ = X.xcb_poly_line (c, @intCast(u8, @enumToInt(X.XCB_COORD_MODE_PREVIOUS)), win, foreground, 2, &points[0]);
        _ = X.xcb_flush (c);
      },
      X.XCB_EXPOSE => {
        _ = X.xcb_flush(c);
      },
      else => {}
    }
    std.c.free(@ptrCast(*c_void, e));
  }
}

