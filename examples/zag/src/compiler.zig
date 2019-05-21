const std = @import("std");
const allocator = std.debug.global_allocator;

const Chunk = @import("./chunk.zig").Chunk;
const OpCode = @import("./vm.zig").OpCode;
const Token = @import("./scanner.zig").Token;
const TokenType = @import("./scanner.zig").TokenType;
const Scanner = @import("./scanner.zig").Scanner;
const Value = @import("./value.zig").Value;
const ObjString = @import("./object.zig").ObjString;

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

pub const ParseFn = fn(self: *Instance, canAssign: bool) void;

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

pub const Instance = struct {
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
        makeRule(TokenType.String,       string,   null,   Precedence.None),
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

    pub fn create() Instance {
        return Instance {
            .parser = Parser.create(),
            .scanner = Scanner.create(),
            .current_chunk = undefined
        };
    }

    pub fn compile(self: *Instance, source: []const u8, chunk: *Chunk) bool {
        self.scanner.init(source);
        self.current_chunk = chunk;
        self.parser.hadError = false;
        self.parser.hadPanic = false;

        self.advance();

        while (!self.match(.EOF)) {
            self.declaration();
        }

        self.declaration();
        self.end();

        return !self.parser.hadError;
    }

    fn advance(self: *Instance) void {
        self.parser.previous = self.parser.current;

        while (true) {
            self.parser.current = self.scanner.scanToken();
            if (true) std.debug.warn("Scanned {}\n", @tagName(self.parser.current.token_type));
            if (self.parser.current.token_type != TokenType.Error) break;
            self.parser.errorAtCurrent(self.parser.current.lexeme);
        }
    }

    fn consume(self: *Instance, token_type: TokenType, message: []const u8) void {
        if (self.parser.current.token_type == token_type) {
            _ = self.advance();
            return;
        }

        self.parser.errorAtCurrent(message);
    }

    fn currentChunk(self: *const Instance) *Chunk {
        return self.current_chunk;
    }

    fn statement(self: *Instance) void {
        if (self.match(.Print)) {
            self.printStatement();
        } else {
            self.expressionStatement();
        }
    }

    fn match(self: *Instance, token_type: TokenType) bool {
        if (!self.check(token_type)) return false;
        self.advance();
        return true;
    }

    fn check(self: *Instance, token_type: TokenType) bool {
        return self.parser.current.token_type == token_type;
    }

    fn expressionStatement(self: *Instance) void {
        self.expression();
        self.emitOpCode(OpCode.Pop);
        self.consume(TokenType.Semicolon, "Expect ';' after expression.");
    }

    fn printStatement(self: *Instance) void {
        self.expression();
        self.consume(TokenType.Semicolon, "Expect ';' after value.");
        self.emitOpCode(OpCode.Print);
    }

    fn declaration(self: *Instance) void {
        if (self.match(TokenType.Var)) {
            self.varDeclaration();
        } else {
            self.statement();
        }
        if (self.parser.hadPanic) self.synchronize();
    }

    fn synchronize(self: *Instance) void {
        self.parser.hadPanic = false;

        while (self.parser.current.token_type != TokenType.EOF) {
            if (self.parser.previous.token_type == TokenType.Semicolon) return;

            switch (self.parser.current.token_type) {
                .Class, .Fn, .Var, .For, .If, .While, .Print, .Return => return,
                else => {}
            }
            self.advance();
        }
    }

    fn expression(self: *Instance) void {
       self.parsePrecedence(Precedence.Assignment);
    }

    fn  varDeclaration(self: *Instance) void {
        const global = self.parseVariable("Expect variable name.");

        if (self.match(TokenType.Equal)) {
            self.expression();
        } else {
            self.emitOpCode(OpCode.Nil);
        }
        self.consume(TokenType.Semicolon, "Expect ';' after variable declaration.");

        self.defineVariable(global);
    }

    fn  parseVariable(self: *Instance, errorMessage: []const u8) u8 {
        self.consume(TokenType.Identifier, errorMessage);
        return self.identifierConstant(&self.parser.previous);
    }

    fn  identifierConstant(self: *Instance, name: *Token) u8 {
        const obj_string = ObjString.copy(name.lexeme);
        return self.makeConstant(obj_string.value());
    }

    fn  defineVariable(self: *Instance, global: u8) void {
        self.emitBytes(@enumToInt(OpCode.DefineGlobal), global);
    }

    fn parsePrecedence(self: *Instance, precedence: Precedence) void {
        _ = self.advance();

        const parsePrefix = getRule(self.parser.previous.token_type).prefix;
        std.debug.warn("Parsing Prefix {} (.{})\n", @tagName(self.parser.previous.token_type), @tagName(precedence));

        if (parsePrefix == null) {
            self.parser.errorAtCurrent("Expect expression");
            return;
        }

        const canAssign = precedence.isLowerThan(.Assignment);
        parsePrefix.?(self, canAssign);

        while (precedence.isLowerThan(getRule(self.parser.current.token_type).precedence)) {
            _ = self.advance();
            const parseInfix = getRule(self.parser.previous.token_type).infix.?;
            parseInfix(self, canAssign);
        }

        if (canAssign and self.match(TokenType.Equal)) {
            self.parser.errorAtCurrent("Invalid assignment target.");
            self.expression();
        }
    }

    fn getRule(token_type: TokenType) *const ParseRule {
        const rule = &rules[@enumToInt(token_type)];
        return rule;
    }

    fn grouping(self: *Instance, canAssign: bool) void {
        self.expression();
        self.consume(TokenType.RightParen, "Expect ')' after expression.");
    }

    fn number(self: *Instance, canAssign: bool) void {
        const value = std.fmt.parseUnsigned(u8, self.parser.previous.lexeme, 10) catch unreachable;
        self.emitConstant(Value { .Number = @intToFloat(f64, value) });
    }

    fn unary(self: *Instance, canAssign: bool) void {
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

    fn binary(self: *Instance, canAssign: bool) void {
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
            // else => unreachable,
            else => return,
        }
    }

    fn literal(self: *Instance, canAssign: bool) void {
        switch (self.parser.previous.token_type) {
            TokenType.False => self.emitOpCode(OpCode.False),
            TokenType.Nil => self.emitOpCode(OpCode.Nil),
            TokenType.True => self.emitOpCode(OpCode.True),
            // else => unreachable,
            else => return,
        }
    }

    fn variable(canAssign: bool) void {
        self.namedVariable(self.parser.previous, canAssign) catch unreachable;
    }

    fn namedVariable(name: Token, canAssign: bool) void {
        const arg = self.identifierConstant(&name);

        if (canAssign and self.match(TokenType.Equal)) {
            self.expression();
            self.emitBytes(.SetGlobal, arg);
        } else {
            self.emitBytes(.GetGlobal, arg);
        }
    }

    fn string(self: *Instance, canAssign: bool) void {
        const last = self.parser.previous.lexeme.len - 2;
        self.emitConstant(ObjString.copy(self.parser.previous.lexeme[1..last]).value());
    }

    fn end(self: *Instance) void {
        self.emitReturn();
        if(!self.parser.hadError) {
            self.currentChunk().disassemble("Chunk");
        }
    }

    fn emitReturn(self: *Instance) void {
        self.emitOpCode(OpCode.Return);
    }

    fn emitOpCode(self: *Instance, op: OpCode) void {
        self.emitByte(@enumToInt(op));
    }

    fn emitOpCodes(self: *Instance, op1: OpCode, op2: OpCode) void {
        self.emitByte(@enumToInt(op1));
        self.emitByte(@enumToInt(op2));
    }

    fn emitByte(self: *Instance, byte: u8) void {
        self.currentChunk().write(byte, self.parser.previous.line) catch unreachable;
    }

    fn emitBytes(self: *Instance, byte1: u8, byte2: u8) void {
        self.emitByte(byte1);
        self.emitByte(byte2);
    }

    fn emitConstant(self: *Instance, value: Value) void {
        self.emitBytes(@enumToInt(OpCode.Constant), self.makeConstant(value));
    }

    fn makeConstant(self: *Instance, value: Value) u8 {
        return self.currentChunk().addConstant(value);
    }
};
