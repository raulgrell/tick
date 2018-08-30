const X = @import("xcb.zig");

pub main() !void {
    var display: *X.xcb_connection_t = X.xcb_connect(null, null);
    if (X.X.xcb_connection_has_error(display)) error.ConnectionError;

    var screen: *X.xcb_screen_t = X.xcb_setup_roots_iterator(X.xcb_get_setup(display)).data;
    var root: X.xcb_drawable_t = screen.root;

    X.xcb_grab_key(display, 1, root, X.XCB_MOD_MASK_2, X.XCB_NO_SYMBOL,
                 X.XCB_GRAB_MODE_ASYNC, X.XCB_GRAB_MODE_ASYNC);

    X.xcb_grab_button(display, 0, root, X.XCB_EVENT_MASK_BUTTON_PRESS | 
                X.XCB_EVENT_MASK_BUTTON_RELEASE, X.XCB_GRAB_MODE_ASYNC, 
                X.XCB_GRAB_MODE_ASYNC, root, X.XCB_NONE, 1, X.XCB_MOD_MASK_1);

    X.xcb_grab_button(display, 0, root, X.XCB_EVENT_MASK_BUTTON_PRESS | 
                X.XCB_EVENT_MASK_BUTTON_RELEASE, X.XCB_GRAB_MODE_ASYNC, 
                X.XCB_GRAB_MODE_ASYNC, root, X.XCB_NONE, 3, X.XCB_MOD_MASK_1);

    X.xcb_flush(display);

    var values = [3]u32;
    var win: X.xcb_drawable_t = undefined;
    var ev: *X.xcb_generic_event_t = undefined;
    var geom: *X.xcb_get_geometry_reply_t = undefined;
    while (true) {
        ev = X.xcb_wait_for_event(display);
        switch (ev.response_type & ~0x80) {
            X.XCB_BUTTON_PRESS => {
                const e: X.xcb_button_press_event_t = ( X.xcb_button_press_event_t *) ev;
                win = e.child; 
                values[0] = X.XCB_STACK_MODE_ABOVE;
                X.xcb_configure_window(display, win, X.XCB_CONFIG_WINDOW_STACK_MODE, values);
                geom = X.xcb_get_geometry_reply(display, X.xcb_get_geometry(display, win), null);
                if (1 == e.detail) {
                    values[2] = 1; 
                    X.xcb_warp_pointer(display, X.XCB_NONE, win, 0, 0, 0, 0, 1, 1);
                } else {
                    values[2] = 3; 
                    X.xcb_warp_pointer(display, X.XCB_NONE, win, 0, 0, 0, 0, geom.width, geom.height);
                }
                X.xcb_grab_pointer(display, 0, root, X.XCB_EVENT_MASK_BUTTON_RELEASE
                        | X.XCB_EVENT_MASK_BUTTON_MOTION | X.XCB_EVENT_MASK_POINTER_MOTION_HINT, 
                        X.XCB_GRAB_MODE_ASYNC, X.XCB_GRAB_MODE_ASYNC, root, X.XCB_NONE, X.XCB_CURRENT_TIME);
                X.xcb_flush(display);
            }
            X.XCB_MOTION_NOTIFY => {
                X.xcb_query_pointer_reply_t *pointer;
                pointer = X.xcb_query_pointer_reply(display, X.xcb_query_pointer(display, root), 0);
                if (values[2] == 1) {/* move */
                    geom = X.xcb_get_geometry_reply(display, X.xcb_get_geometry(display, win), null);
                    values[0] = (pointer.root_x + geom.width > screen.width_in_pixels)?
                        (screen.width_in_pixels - geom.width):pointer.root_x;
                    values[1] = (pointer.root_y + geom.height > screen.height_in_pixels)?
                        (screen.height_in_pixels - geom.height):pointer.root_y;
                    X.xcb_configure_window(display, win, X.XCB_CONFIG_WINDOW_X | X.XCB_CONFIG_WINDOW_Y, values);
                    X.xcb_flush(display);
                } else if (values[2] == 3) { /* resize */
                    geom = X.xcb_get_geometry_reply(display, X.xcb_get_geometry(display, win), null);
                    values[0] = pointer.root_x - geom.x;
                    values[1] = pointer.root_y - geom.y;
                    X.xcb_configure_window(display, win, X.XCB_CONFIG_WINDOW_WIDTH | X.XCB_CONFIG_WINDOW_HEIGHT, values);
                    X.xcb_flush(display);
                }
            }
            X.XCB_BUTTON_RELEASE =>{
                X.xcb_ungrab_pointer(display, X.XCB_CURRENT_TIME);
                X.xcb_flush(display); 
            }
        }
    }
}