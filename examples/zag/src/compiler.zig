const std = @import("std");

const Chunk = @import("./chunk.zig").Chunk;
const OpCode = @import("./vm.zig").OpCode;
const Token = @import("./scanner.zig").Token;
const TokenType = @import("./scanner.zig").TokenType;
const Scanner = @import("./scanner.zig").Scanner;
const Value = @import("./value.zig").Value;

pub const Parser = struct {
    current: Token,
    previous: Token,
    hadError: bool,
    hadPanic: bool,

    pub fn create() Parser {
        return Parser {
            .current = undefined,
            .previous = undefined,
            .hadError = false,
            .hadPanic = false
        };
    }

    fn errorAtCurrent(self: *Parser, message: []const u8) void {
        self.errorAt(&self.current, message);
    }

    fn errorAtPrevious(self: *Parser, message: []const u8) void {
        self.errorAt(&self.previous, message);
    }

    fn errorAt(self: *Parser, token: *Token, message: []const u8) void {
        if (self.hadPanic) return;
        self.hadPanic = true;

        std.debug.warn("[line {}] Error", token.line);

        if (token.token_type == TokenType.EOF) {
            std.debug.warn(" at end");
        } else if (token.token_type == TokenType.Error) {
            // Nothing.
        } else {
            std.debug.warn(" at '{}'", token.lexeme);
        }

        std.debug.warn(": {}\n", message);
        self.hadError = true;
    }
};

pub const ParseRule = struct {
    prefix: ?ParseFn,
    infix: ?ParseFn,
    precedence: Precedence
};

pub const ParseFn = fn(self: *Compiler) void;

pub const Precedence = packed enum(u8) {
    None,
    Assignment,  // =
    Or,          // or
    And,         // and
    Equality,    // == !=
    Comparison,  // < > <= >=
    Term,        // + -
    Factor,      // * /
    Unary,       // ! - +
    Call,        // . () []
    Primary,

    fn next(current: Precedence) Precedence {
        return @intToEnum(Precedence, @enumToInt(current) + 1);
    }

    fn isLowerThan(current: Precedence, other: Precedence) bool {
        return @enumToInt(current) <= @enumToInt(other);
    }
};

fn makeRule(_: TokenType, prefix: ?ParseFn, infix: ?ParseFn, precedence: Precedence) ParseRule {
    return ParseRule {
        .prefix = prefix,
        .infix = infix,
        .precedence = precedence
    };
}

pub const Compiler = struct {
    parser: Parser,
    scanner: Scanner,
    current_chunk: *Chunk,

    const rules = []ParseRule {
        makeRule(TokenType.LeftParen,    grouping, null,   Precedence.Call),
        makeRule(TokenType.RightParen,   null,     null,   Precedence.None),
        makeRule(TokenType.LeftBrace,    null,     null,   Precedence.None),
        makeRule(TokenType.RightBrace,   null,     null,   Precedence.None),
        makeRule(TokenType.Comma,        null,     null,   Precedence.None),
        makeRule(TokenType.Dot,          null,     null,   Precedence.Call),
        makeRule(TokenType.Minus,        unary,    binary, Precedence.Term),
        makeRule(TokenType.Plus,         null,     binary, Precedence.Term),
        makeRule(TokenType.Semicolon,    null,     null,   Precedence.None),
        makeRule(TokenType.Slash,        null,     binary, Precedence.Factor),
        makeRule(TokenType.Star,         null,     binary, Precedence.Factor),
        makeRule(TokenType.Bang,         unary,    null,   Precedence.None),
        makeRule(TokenType.BangEqual,    null,     binary, Precedence.Equality),
        makeRule(TokenType.Equal,        null,     null,   Precedence.None),
        makeRule(TokenType.EqualEqual,   null,     binary, Precedence.Equality),
        makeRule(TokenType.Greater,      null,     binary, Precedence.Comparison),
        makeRule(TokenType.GreaterEqual, null,     binary, Precedence.Comparison),
        makeRule(TokenType.Less,         null,     binary, Precedence.Comparison),
        makeRule(TokenType.LessEqual,    null,     binary, Precedence.Comparison),
        makeRule(TokenType.Identifier,   null,     null,   Precedence.None),
        makeRule(TokenType.String,       null,     null,   Precedence.None),
        makeRule(TokenType.Number,       number,   null,   Precedence.None),
        makeRule(TokenType.And,          null,     null,   Precedence.And),
        makeRule(TokenType.Class,        null,     null,   Precedence.None),
        makeRule(TokenType.Else,         null,     null,   Precedence.None),
        makeRule(TokenType.False,        literal,  null,   Precedence.None),
        makeRule(TokenType.Fn,           null,     null,   Precedence.None),
        makeRule(TokenType.For,          null,     null,   Precedence.None),
        makeRule(TokenType.If,           null,     null,   Precedence.None),
        makeRule(TokenType.Nil,          literal,  null,   Precedence.None),
        makeRule(TokenType.Or,           null,     null,   Precedence.Or),
        makeRule(TokenType.Print,        null,     null,   Precedence.None),
        makeRule(TokenType.Return,       null,     null,   Precedence.None),
        makeRule(TokenType.Super,        null,     null,   Precedence.None),
        makeRule(TokenType.This,         null,     null,   Precedence.None),
        makeRule(TokenType.True,         literal,  null,   Precedence.None),
        makeRule(TokenType.Var,          null,     null,   Precedence.None),
        makeRule(TokenType.While,        null,     null,   Precedence.None),
        makeRule(TokenType.Error,        null,     null,   Precedence.None),
        makeRule(TokenType.EOF,          null,     null,   Precedence.None),
    };

    pub fn create() Compiler {
        return Compiler {
            .parser = Parser.create(),
            .scanner = Scanner.create(),
            .current_chunk = undefined
        };
    }

    pub fn compile(self: *Compiler, source: []const u8, chunk: *Chunk) bool {
        self.scanner.init(source);
        self.current_chunk = chunk;
        self.parser.hadError = false;
        self.parser.hadPanic = false;

        self.advance();
        self.parseExpression();
        self.consume(TokenType.EOF, "Expect end of expression.");
        self.end();

        return !self.parser.hadError;
    }

    fn advance(self: *Compiler) void {
        self.parser.previous = self.parser.current;

        while (true) {
            self.parser.current = self.scanner.scanToken();
            if (true) std.debug.warn("Scanned {}\n", @tagName(self.parser.current.token_type));
            if (self.parser.current.token_type != TokenType.Error) break;
            self.parser.errorAtCurrent(self.parser.current.lexeme);
        }
    }

    fn consume(self: *Compiler, token_type: TokenType, message: []const u8) void {
        if (self.parser.current.token_type == token_type) {
            _ = self.advance();
            return;
        }

        self.parser.errorAtCurrent(message);
    }

    fn currentChunk(self: *const Compiler) *Chunk {
        return self.current_chunk;
    }

    fn parseExpression(self: *Compiler) void {
       self.parsePrecedence(Precedence.Assignment);
    }

    fn parsePrecedence(self: *Compiler, precedence: Precedence) void {
        _ = self.advance();

        const parsePrefix = getRule(self.parser.previous.token_type).prefix;
        std.debug.warn("Parsing Prefix {}, Precedence {}\n", @tagName(self.parser.previous.token_type), @tagName(precedence));
        
        if (parsePrefix == null) {
            self.parser.errorAtCurrent("Expect expression");
            return;
        }

        parsePrefix.?(self);

        while (precedence.isLowerThan(getRule(self.parser.current.token_type).precedence)) {
            _ = self.advance();
            const parseInfix = getRule(self.parser.previous.token_type).infix.?;
            parseInfix(self);
        }
    }

    fn getRule(token_type: TokenType) *const ParseRule {
        const rule = &rules[@enumToInt(token_type)];
        return rule;
    }

    fn grouping(self: *Compiler) void {
        self.parseExpression();
        self.consume(TokenType.RightParen, "Expect ')' after expression.");
    }

    fn number(self: *Compiler) void {
        const value = std.fmt.parseUnsigned(u8, self.parser.previous.lexeme, 10) catch unreachable;
        self.emitConstant(Value { .Number = @intToFloat(f64, value) });
    }

    fn unary(self: *Compiler) void {
        const operator_type = self.parser.previous.token_type;

        // Compile the operand.
        self.parsePrecedence(Precedence.Unary);

        // Emit the operator instruction.
        switch (operator_type) {
            TokenType.Bang => self.emitOpCode(OpCode.Not),
            TokenType.Minus => self.emitOpCode(OpCode.Negate),
            else => unreachable
        }
    }

    fn binary(self: *Compiler) void {
        // Remember the operator.
        const operator_type = self.parser.previous.token_type;

        // Compile the right operand.
        const rule = getRule(operator_type);
        self.parsePrecedence(rule.precedence.next());

        // Emit the operator instruction.
        switch (operator_type) {
            TokenType.BangEqual    => self.emitOpCodes(OpCode.Equal, OpCode.Not),
            TokenType.EqualEqual   => self.emitOpCode(OpCode.Equal),
            TokenType.Greater      => self.emitOpCode(OpCode.Greater),
            TokenType.GreaterEqual => self.emitOpCodes(OpCode.Less, OpCode.Not),
            TokenType.Less         => self.emitOpCode(OpCode.Less),
            TokenType.LessEqual    => self.emitOpCodes(OpCode.Greater, OpCode.Not),
            TokenType.Plus         => self.emitOpCode(OpCode.Add),
            TokenType.Minus        => self.emitOpCode(OpCode.Subtract),
            TokenType.Star         => self.emitOpCode(OpCode.Multiply),
            TokenType.Slash        => self.emitOpCode(OpCode.Divide),
            else => unreachable
        }
    }

    fn literal(self: *Compiler) void {
        switch (self.parser.previous.token_type) {
            TokenType.False => self.emitOpCode(OpCode.False),
            TokenType.Nil => self.emitOpCode(OpCode.Nil),
            TokenType.True => self.emitOpCode(OpCode.True),
            else => unreachable
        }
    }

    fn end(self: *Compiler) void {
        self.emitReturn();
        if(!self.parser.hadError) {
            self.currentChunk().disassemble("Chunk");
        }
    }

    fn emitReturn(self: *Compiler) void {
        self.emitOpCode(OpCode.Return);
    }

    fn emitOpCode(self: *Compiler, op: OpCode) void {
        self.emitByte(@enumToInt(op));
    }

    fn emitOpCodes(self: *Compiler, op1: OpCode, op2: OpCode) void {
        self.emitByte(@enumToInt(op1));
        self.emitByte(@enumToInt(op2));
    }

    fn emitByte(self: *Compiler, byte: u8) void {
        self.currentChunk().write(byte, self.parser.previous.line) catch unreachable;
    }

    fn emitBytes(self: *Compiler, byte1: u8, byte2: u8) void {
        self.emitByte(byte1);
        self.emitByte(byte2);
    }

    fn emitConstant(self: *Compiler, value: Value) void {
        self.emitBytes(@enumToInt(OpCode.Constant), self.makeConstant(value));
    }

    fn makeConstant(self: *Compiler, value: Value) u8 {
        return self.currentChunk().addConstant(value);
    }
};
