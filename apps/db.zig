const std = @import("std");

fn print_prompt() void {
    std.debug.warn("db > ");
}

pub fn main() error!void {
    var stdin_file = try std.io.getStdIn();
    var stdin_file_stream = std.io.FileInStream.init(&stdin_file);
    const stdin = &stdin_file_stream.stream;

    var input_buffer = std.Buffer.initNull(std.debug.global_allocator);

    while (true) {
        print_prompt();

        stdin.readUntilDelimiterBuffer(&input_buffer, '\n', 255) catch |err| {
            std.debug.warn("Error reading input: {}\n", @errorName(err));
            return err;
        };

        const input = input_buffer.toSliceConst();

        if (input[0] == '.') {
            switch(do_meta_command(input)) {
                MetaCommandResult.Success => {
                    continue;
                },
                MetaCommandResult.Unrecognized => {
                    continue;
                }
            }
        }

        var statement: Statement = undefined;
        switch (prepare_statement(input, &statement)) {
            PrepareResult.Success => {},
            PrepareResult.Unrecognized => {
                std.debug.warn("Unrecognized keyword at start of {}\n", input);
                continue;
            }
        }

        execute_statement(&statement);
        std.debug.warn("Executed");
    }
}

const MetaCommandResult = enum {
    Success,
    Unrecognized
};

const PrepareResult = enum {
    Success,
    Unrecognized
};

const StatementType = enum {
    Insert,
    Select
};

const Statement = struct {
    T: StatementType,
};

fn do_meta_command(input: []const u8) MetaCommandResult {
    if (std.mem.eql(u8, input, ".exit")) {
        std.debug.warn("Exit\n");
        std.os.exit(0);
    }

    return MetaCommandResult.Unrecognized;
}

fn prepare_statement(input: []const u8, statement: &Statement) PrepareResult {
    if (std.mem.eql(u8, input, "select")) {
        statement.T = StatementType.Select;
        return PrepareResult.Success;
    } else if (std.mem.eql(u8, input, "insert")) {
        statement.T = StatementType.Insert;
        return PrepareResult.Success;
    }

    return PrepareResult.Unrecognized;
}

fn execute_statement(statement: &Statement) void {
    switch(statement.T) {
        StatementType.Insert => {
            std.debug.warn("Inserting\n");
        },
        StatementType.Select => {
            std.debug.warn("Selecting\n");
        }
    }
}