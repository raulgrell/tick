const X = @import("xlib.zig");

fn max(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b);
} 

pub fn main() !void {
    var display: *X.Display = X.OpenDisplay(0) orelse return error.NoDisplay;
    var root: *X.Window = X.DefaultRootWindow(display);
    var attrs: XWindowAttributes = undefined;

    var start: X.ButtonEvent = undefined;
    var event: X.Event = undefined;

    X.GrabKey(display, X.KeysymToKeycode(display, X.StringToKeysym("F1")), X.Mod1Mask, root, X.True, X.GrabModeAsync, X.GrabModeAsync);
    X.GrabButton(display, 1, X.Mod1Mask, root, X.True, X.ButtonPressMask, X.GrabModeAsync, X.GrabModeAsync, X.None, X.None);
    X.GrabButton(display, 3, X.Mod1Mask, root, X.True, X.ButtonPressMask, X.GrabModeAsync, X.GrabModeAsync, X.None, X.None);

    while (true) {
        X.NextEvent(display, &ev);
        if (ev.@"type" == X.KeyPress && ev.xkey.subwindow != X.None) {
            X.RaiseWindow(display, ev.xkey.subwindow);
        } else if (ev.@"type" == X.ButtonPress && ev.xbutton.subwindow != X.None) {
            X.GrabPointer(display, ev.xbutton.subwindow, X.True,
                    X.PointerMotionMask | X.ButtonReleaseMask, X.GrabModeAsync,
                    X.GrabModeAsync, X.None, X.None, X.CurrentTime);
            X.GetWindowAttributes(display, ev.xbutton.subwindow, &attr);
            start = ev.xbutton;
        } else if (ev.@"type" == X.MotionNotify) {
            while (X.CheckTypedEvent(display, X.MotionNotify, &ev)) {};
            var xdiff = ev.xbutton.x_root - start.x_root;
            var ydiff = ev.xbutton.y_root - start.y_root;
            X.MoveResizeWindow(display, ev.xmotion.window,
                attr.x + (start.button==1 ? xdiff : 0),
                attr.y + (start.button==1 ? ydiff : 0),
                max(c_int, 1, attr.width + if (start.button == 3) xdiff else 0),
                max(c_int, 1, attr.height + if (start.button == 3) ydiff else 0));
        }
        else if (ev.@"type" == ButtonRelease)
            X.UngrabPointer(display, CurrentTime);
    }
}

