<<<<<<< HEAD
=======
const std = @import("std");
const builtin = @import("builtin");

const is_windows = builtin.os == builtin.Os.windows;

>>>>>>> Windows misc changes
use @cImport({
    @cInclude("ctype.h");
    @cInclude("errno.h");
    @cInclude("stdio.h");
<<<<<<< HEAD
    @cInclude("unistd.h");
    @cInclude("sys/ioctl.h");
    @cInclude("sys/types.h");
    @cInclude("termios.h");
    @cInclude("stdlib.h");
});

const std = @import("std");
=======
    @cInclude("stdlib.h");
    if (is_windows) {

    } else {
        @cInclude("unistd.h");
        @cInclude("sys/ioctl.h");
        @cInclude("sys/types.h");
        @cInclude("termios.h");
    }
});

>>>>>>> Windows misc changes

const EditorConfig = struct {
    cx: c_int,
    cy: c_int,
    rx: c_int,
    screenrows: c_int,
    screencols: c_int,
    row_offset: c_int,
    col_offset: c_int,
    num_rows: c_int,
    row: std.ArrayList(EditorRow),
    filename: []u8,
    original_termios: termios
};

const EditorRow = struct {
    chars: std.Buffer,
    render_chars: std.Buffer
};

const Key = enum(u8) {
    ArrowLeft,
    ArrowRight,
    ArrowUp,
    ArrowDown,
    Del,
    Home,
    End,
    PageUp,
    PageDown,
};

//
// Data
// 

pub fn main() !void {
    enableRawMode();
    initEditor();

    try editorOpen("apps/text.zig");

    while (true) {
        try editorRefreshScreen();
        editorProcessKeypress();
    }
}

var e = EditorConfig {
    .cx = 0,
    .cy = 0,
    .rx = 0,
    .screenrows = 0,
    .screencols = 0,
    .row_offset = 0,
    .col_offset = 0,
    .num_rows = 0,
    .row = undefined,
    .filename = []u8{},
    .original_termios = undefined
};


fn initEditor() void {
    getWindowSize(&e.screenrows, &e.screencols) catch die(c"getWindowSize");
    e.row = std.ArrayList(EditorRow).init(std.heap.c_allocator);
    e.screenrows -= 1;
}


//
// Terminal
//  

fn die(s: &const u8) void {
    clearTerminal();
    perror(s);
    exit(1);
}

fn enableRawMode() void {
    // Save original settings
    if (tcgetattr(STDIN_FILENO, &e.original_termios) == -1) die(c"tcgetattr");
    if (atexit(disableRawMode) == -1) die(c"atexit");

    // Apply changes
    var raw: termios = e.original_termios;
    raw.c_iflag &= ~(c_uint(BRKINT) | c_uint(ICRNL) | c_uint(INPCK) | c_uint(ISTRIP) | c_uint(IXON));
    raw.c_oflag &= ~(c_uint(OPOST));
    raw.c_lflag &= ~(c_uint(ECHO) | c_uint(ICANON) | c_uint(IEXTEN) | c_uint(ISIG) );
    raw.c_cflag |= ~(c_uint(CS8));

    // Timeout
    raw.c_cc[VMIN] = 0;
    raw.c_cc[VTIME] = 1;

    if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw) == -1) die(c"tcsetattr");
}

extern fn disableRawMode() void {
    if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &e.original_termios) == -1) die(c"tcsetattr");
}

fn readKey() u8 {
    var nread: isize = 0;
    var c : u8 = undefined;
    while (nread != 1) : (nread = read(STDIN_FILENO, @ptrCast(&c_void, &c), 1)) {
        if(nread == -1 and *std.c._errno() != EAGAIN) die(c"read");
    }

    if (c == '\x1b') {
        var seq: [3]u8 = undefined;
        if (read(STDIN_FILENO, @ptrCast(&c_void, &seq[0]), 1) != 1) return '\x1b';
        if (read(STDIN_FILENO, @ptrCast(&c_void, &seq[1]), 1) != 1) return '\x1b';
        if (seq[0] == '[') {
            if (seq[1] >= '0' and seq[1] <= '9') {
                if (read(STDIN_FILENO, @ptrCast(&c_void, &seq[1]), 1) != 1) return '\x1b';
                if (seq[2] == '~') {
                    switch (seq[1]) {
                        '1' => return u8(Key.Home),
                        '3' => return u8(Key.Del),
                        '4' => return u8(Key.End),
                        '5' => return u8(Key.PageUp),
                        '6' => return u8(Key.PageDown),
                        '7' => return u8(Key.Home),
                        '8' => return u8(Key.End),
                        else => {}
                    }                    
                }
            } else {
                switch (seq[1]) {
                    'A' => return u8(Key.ArrowUp),
                    'B' => return u8(Key.ArrowDown),
                    'C' => return u8(Key.ArrowRight),
                    'D' => return u8(Key.ArrowLeft),
                    'H' => return u8(Key.Home),
                    'F' => return u8(Key.End),
                    else => {}
                }
            }
        } else if (seq[0] == 'O') {
            switch (seq[1]) {
                'H' => return u8(Key.Home),
                'F' => return u8(Key.End),
                else => {}
            }
        }
        return '\x1b';
    } else {
        return u8(c);
    }
}

fn getWindowSize(rows: &c_int, cols: &c_int) !void {
    var ws: winsize = undefined;
    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) == -1 or ws.ws_col == 0) {
        if (write(STDOUT_FILENO, @ptrCast(&const c_void, c"\x1b[999C\x1b[999B"), 12) != 12)
            return error.WindowSizeInvalid;
        try getCursorPosition(rows, cols);
    } else {
        *cols = ws.ws_col;
        *rows = ws.ws_row;
    }
}

fn getCursorPosition(rows: &c_int, cols: &c_int) !void {
    var buf = []u8 {0} ** 32;
    var i = usize(0);
    var c = u8(0);

    if (write(STDOUT_FILENO, @ptrCast(&const c_void, c"\x1b[6n"), 4) != 4)
        return error.CursorPositionInvalid;

    while (i < buf.len - 1) : (i += 1) {
        if (read(STDIN_FILENO, @ptrCast(&c_void, &c), 1) != 1) break;
        if (buf[i] == 'R') break;
    }

    _ = printf(c"\r\n%s\r\n", &buf[1]);

    _ = readKey();

    if (buf[0] != '\x1b' or buf[1] != '[') return error.CursorPositionReplyInvalid;
    if (sscanf(&buf[2],c"%d;%d", rows, cols) != 2) return error.CursorPositionReplyInvalid;
}

fn clearTerminal() void {
  _ = write(STDOUT_FILENO, @ptrCast(&const c_void, c"\x1b[2J"), 4);
  _ = write(STDOUT_FILENO, @ptrCast(&const c_void, c"\x1b[H"), 3);
}

fn ctrlKey(key: u8) u8 {
    return key & 0x1f;
}

//
// File IO
//

fn editorOpen(filename: []const u8) !void {
    if (e.filename.len > 0) {
        e.filename = try std.mem.dupe(std.heap.c_allocator, u8, filename);
    }

    var file = try std.os.File.openRead(std.heap.c_allocator, filename);
    var file_stream = std.io.FileInStream.init(&file);
    const file_in = &file_stream.stream;

    var input_buffer = std.Buffer.initNull(std.heap.c_allocator);
    while (true) {
        file_in.readUntilDelimiterBuffer(&input_buffer, '\n', 255) catch | err | {
            switch (err) {
                error.EndOfStream => break,
                else => {
                    std.debug.warn("Error reading input: {}\n", @errorName(err));
                    return err;
                }
            }
        };

        const line = input_buffer.toSliceConst();
        try editorAppendRow(line);
    }

    file.close();
}

//
// Row Operations
//

fn editorAppendRow(row: []const u8) !void {
    var editor_row = EditorRow {
        .chars = try std.Buffer.init(std.heap.c_allocator, row),
        .render_chars = try std.Buffer.initSize(std.heap.c_allocator, 0)
    };

    try editorUpdateRow(&editor_row);
    try e.row.append(editor_row);

    e.num_rows += 1;
}

const TAB_SIZE = 4;

fn editorUpdateRow(row: &EditorRow) !void {
    const row_chars = row.chars.toSliceConst();

    var tabs: usize = 0;
    for (row_chars) | c, i | tabs += 1;

    const render_length = row_chars.len + tabs * (TAB_SIZE - 1);
    row.render_chars.deinit();
    row.render_chars = try std.Buffer.initSize(std.heap.c_allocator, render_length);

    var render_index: usize = 0;
    for (row_chars) | c, i | {
        switch (c) {
            '\t' => {
                row.render_chars.list.at(render_index) = ' ';
                render_index += 1;
                while(render_index % TAB_SIZE != 0) {
                    row.render_chars.list.at(render_index) = ' ';
                    render_index += 1;
                }
            },
            else => {
                row.render_chars.list.at(render_index) = c;
                render_index += 1;
            }
        }

    }
}

fn editorRowCxtoRx(row: &EditorRow, cx: c_int) c_int {
    var rx: c_int = 0;
    for(row.chars.toSliceConst()) | c, i | {
        if (c == '\t') rx += (TAB_SIZE - 1) - (@mod(rx, TAB_SIZE));
        rx += 1;
    }
    return rx;
}

//
// Output
//

fn editorProcessKeypress() void {
    const c = readKey();
    switch (c) {
        ctrlKey('q') => {
            clearTerminal();
            exit(0);
        },

        u8(Key.Home) => e.cx = 0,
        u8(Key.End) => {
            if (e.cy < e.num_rows) {
                e.cx = c_int(e.row.at(usize(e.cy)).chars.len());
            }
        },
        u8(Key.PageUp),
        u8(Key.PageDown) => {
            if (c == u8(Key.PageUp)) {
                e.cy = e.row_offset;
            } else {
                e.cy = e.row_offset + e.screenrows - 1;
                if (e.cy > e.num_rows) e.cy = e.num_rows;
            }

            var times = e.screenrows;
            while (times > 0) : (times -= 1) {
                editorMoveCursor(if (c == u8(Key.PageUp))
                    u8(Key.ArrowUp) else u8(Key.ArrowDown));
            }
        },
        u8(Key.ArrowLeft),
        u8(Key.ArrowRight),
        u8(Key.ArrowUp),
        u8(Key.ArrowDown) => editorMoveCursor(c),
        else => {}
    }
}

fn editorRefreshScreen() !void {
    editorScroll();

    var ab = try std.Buffer.init(std.heap.c_allocator, []u8{});

    try ab.append("\x1b[?25l");
    try ab.append("\x1b[H");

    try editorDrawRows(&ab);
    try editorDrawStatusBar(&ab);

    var buf: [32]u8 = undefined;
    const cursor = try std.fmt.bufPrint(buf[0..], "\x1b[{};{}H",
            (e.cy - e.row_offset) + 1,
            (e.rx - e.col_offset) + 1);

    try ab.append(cursor);

    try ab.append("\x1b[?25h");
    
    _ = write(STDOUT_FILENO, @ptrCast(&const c_void, ab.list.items.ptr), ab.list.len);

    ab.deinit();
}

fn editorDrawRows(ab: &std.Buffer) !void {
    var row_index: c_uint = 0;

    while(row_index < c_uint(e.screenrows)) : (row_index += 1) {
        const file_row = row_index + c_uint(e.row_offset);
        if (file_row >= c_uint(e.num_rows)) {
            if (e.num_rows == 0 and row_index == c_uint(e.screenrows) / 3) {
                const greeting = "Welcome to Zed";
                var padding = (c_uint(e.screencols) - greeting.len) / 2;
                if (padding > 0) try ab.append("~");
                while (padding > 0) : (padding -= 1) try ab.append(" ");
                try ab.append(greeting);
            } else {
                try ab.append("~");
            }
        } else {
            const line = e.row.at(file_row).render_chars.toSliceConst();
            const draw_length = std.math.min( std.math.max(line.len - c_uint(e.col_offset), c_uint(0)), c_uint(e.screencols));
            try ab.append(line[c_uint(e.col_offset) .. draw_length]);
        }

        try ab.append("\x1b[K");
        try ab.append("\r\n");
    }
}

fn editorDrawStatusBar(ab: &std.Buffer) !void {
    try ab.append("\x1b[7m");

    var status_buffer: [80]u8 = undefined;
    var right_buffer: [80]u8 = undefined;

    const status_text = try std.fmt.bufPrint(
            status_buffer[0..],
            "{} - {} lines",
            if (e.filename.len > 0) e.filename else "[unnamed]"[0..],
            e.num_rows);
    
    const right_text = try std.fmt.bufPrint(
            right_buffer[0..],
            "{} / {}",
            e.cy + 1,
            e.num_rows);

    var len: usize = status_text.len;
    try ab.append(status_buffer[0 .. std.math.min(len, usize(e.screencols))]);

    while (len < c_uint(e.screencols)) {
        if(e.screencols - c_int(len) == c_int(right_text.len)) {
            try ab.append(right_text);
            break;
        } else {
            try ab.append(" ");
            len += 1;
        }
    }
    try ab.append("\x1b[m");
}

fn editorMoveCursor(key: u8) void {
    var row = if (e.cy < e.num_rows) e.row.at(c_uint(e.cy)) else null;

    switch (key) {
        u8(Key.ArrowLeft) => if (e.cx != 0) {
            e.cx -= 1;
        } else if (e.cy > 0) {
            e.cy -= 1;
            e.cx = c_int(e.row.at(c_uint(e.cy)).chars.len());
        },
        u8(Key.ArrowRight) => if (row) |r| {
            if (c_uint(e.cx) < r.chars.len()) {
                e.cx += 1;
            } else if (c_uint(e.cx) == r.chars.len()) {
                e.cy += 1;
                e.cx = 0;
            }
        },
        u8(Key.ArrowUp) => if (e.cy != 0) {
            e.cy -= 1;
        },
        u8(Key.ArrowDown) => if (e.cy < e.num_rows) {
            e.cy += 1 ;
        },
        else => unreachable
    }

    row = if (e.cy < e.num_rows) e.row.at(c_uint(e.cy)) else null;
    
    const row_length = if(row) |r| r.chars.len() else 0;
    if (c_uint(e.cx) > row_length) e.cx = c_int(row_length);
}

fn editorScroll() void {
    e.rx = 0;

    if (e.cy < e.num_rows) {
        e.rx = editorRowCxtoRx(&e.row.at(usize(e.cy)), e.cx);
    }

    if (e.cy < e.row_offset) {
        e.row_offset = e.cy;
    }
    if (e.cy >= e.row_offset + e.screenrows) {
        e.row_offset = e.cy - e.screenrows + 1;
    }

    if (e.cx < e.col_offset) {
        e.col_offset = e.rx;
    }
    if (e.cx >= e.col_offset + e.screencols) {
        e.col_offset = e.rx - e.screencols + 1;
    }
}