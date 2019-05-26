const std = @import("std");
const allocator = std.debug.global_allocator;

const Chunk = @import("./chunk.zig").Chunk;
const OpCode = @import("./vm.zig").OpCode;
const Token = @import("./scanner.zig").Token;
const TokenType = @import("./scanner.zig").TokenType;
const Scanner = @import("./scanner.zig").Scanner;
const Value = @import("./value.zig").Value;
const ObjString = @import("./object.zig").ObjString;

const verbose = false;

pub const Parser = struct {
    current: Token,
    previous: Token,
    had_error: bool,
    had_panic: bool,

    pub fn create() Parser {
        return Parser {
            .current = undefined,
            .previous = undefined,
            .had_error = false,
            .had_panic = false
        };
    }

    fn errorAtCurrent(self: *Parser, message: []const u8) void {
        self.errorAt(&self.current, message);
    }

    fn errorAtPrevious(self: *Parser, message: []const u8) void {
        self.errorAt(&self.previous, message);
    }

    fn errorAt(self: *Parser, token: *Token, message: []const u8) void {
        if (self.had_panic) return;
        self.had_panic = true;

        std.debug.warn("[line {}] Error", token.line);

        if (token.token_type == TokenType.EOF) {
            std.debug.warn(" at end");
        } else if (token.token_type == TokenType.Error) {
            // Nothing.
        } else {
            std.debug.warn(" at '{}'", token.lexeme);
        }

        std.debug.warn(": {}\n", message);
        self.had_error = true;
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

const num_rules = @memberCount(TokenType);
var rules: [num_rules]ParseRule = undefined;

pub const Instance = struct {
    current: *Compiler,
    parser: Parser,
    scanner: Scanner,
    current_chunk: *Chunk,

    pub fn create(compiler: *Compiler) Instance {
        rules[@enumToInt(TokenType.LeftParen)] =    makeRule(.LeftParen,    grouping, null,   Precedence.Call);
        rules[@enumToInt(TokenType.RightParen)] =   makeRule(.RightParen,   null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.LeftBrace)] =    makeRule(.LeftBrace,    null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.RightBrace)] =   makeRule(.RightBrace,   null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Comma)] =        makeRule(.Comma,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Dot)] =          makeRule(.Dot,          null,     null,   Precedence.Call);
        rules[@enumToInt(TokenType.Minus)] =        makeRule(.Minus,        unary,    binary, Precedence.Term);
        rules[@enumToInt(TokenType.Plus)] =         makeRule(.Plus,         null,     binary, Precedence.Term);
        rules[@enumToInt(TokenType.Semicolon)] =    makeRule(.Semicolon,    null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Slash)] =        makeRule(.Slash,        null,     binary, Precedence.Factor);
        rules[@enumToInt(TokenType.Star)] =         makeRule(.Star,         null,     binary, Precedence.Factor);
        rules[@enumToInt(TokenType.Bang)] =         makeRule(.Bang,         unary,    null,   Precedence.None);
        rules[@enumToInt(TokenType.BangEqual)] =    makeRule(.BangEqual,    null,     binary, Precedence.Equality);
        rules[@enumToInt(TokenType.Equal)] =        makeRule(.Equal,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.EqualEqual)] =   makeRule(.EqualEqual,   null,     binary, Precedence.Equality);
        rules[@enumToInt(TokenType.Greater)] =      makeRule(.Greater,      null,     binary, Precedence.Comparison);
        rules[@enumToInt(TokenType.GreaterEqual)] = makeRule(.GreaterEqual, null,     binary, Precedence.Comparison);
        rules[@enumToInt(TokenType.Less)] =         makeRule(.Less,         null,     binary, Precedence.Comparison);
        rules[@enumToInt(TokenType.LessEqual)] =    makeRule(.LessEqual,    null,     binary, Precedence.Comparison);
        rules[@enumToInt(TokenType.Identifier)] =   makeRule(.Identifier,   variable, null,   Precedence.None);
        rules[@enumToInt(TokenType.String)] =       makeRule(.String,       string,   null,   Precedence.None);
        rules[@enumToInt(TokenType.Number)] =       makeRule(.Number,       number,   null,   Precedence.None);
        rules[@enumToInt(TokenType.And)] =          makeRule(.And,          null,     andFn,  Precedence.And);
        rules[@enumToInt(TokenType.Class)] =        makeRule(.Class,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Else)] =         makeRule(.Else,         null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.False)] =        makeRule(.False,        literal,  null,   Precedence.None);
        rules[@enumToInt(TokenType.Fn)] =           makeRule(.Fn,           null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.For)] =          makeRule(.For,          null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.If)] =           makeRule(.If,           null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Nil)] =          makeRule(.Nil,          literal,  null,   Precedence.None);
        rules[@enumToInt(TokenType.Or)] =           makeRule(.Or,           null,     orFn,   Precedence.Or);
        rules[@enumToInt(TokenType.Print)] =        makeRule(.Print,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Return)] =       makeRule(.Return,       null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Super)] =        makeRule(.Super,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.This)] =         makeRule(.This,         null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.True)] =         makeRule(.True,         literal,  null,   Precedence.None);
        rules[@enumToInt(TokenType.Var)] =          makeRule(.Var,          null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.While)] =        makeRule(.While,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.Error)] =        makeRule(.Error,        null,     null,   Precedence.None);
        rules[@enumToInt(TokenType.EOF)] =          makeRule(.EOF,          null,     null,   Precedence.None);

        return Instance {
            .current = compiler,
            .parser = Parser.create(),
            .scanner = Scanner.create(),
            .current_chunk = undefined
        };
    }

    pub fn compile(self: *Instance, source: []const u8, chunk: *Chunk) !void {
        self.scanner.init(source);
        self.current_chunk = chunk;
        self.parser.had_error = false;
        self.parser.had_panic = false;

        self.advance();
        while (!self.match(.EOF)) self.declaration();
        try self.end();
    }

    fn advance(self: *Instance) void {
        self.parser.previous = self.parser.current;

        while (true) {
            self.parser.current = self.scanner.scanToken();
            if (verbose) std.debug.warn("Scanned {}\n", @tagName(self.parser.current.token_type));
            if (self.parser.current.token_type != TokenType.Error) break;
            self.parser.errorAtCurrent(self.parser.current.lexeme);
        }
    }

    fn end(self: *Instance) !void {
        self.emitReturn();

        if(self.parser.had_error)
            return error.ParseError;
        
        if (verbose) self.currentChunk().disassemble("Chunk");
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
        } else if (self.match(.If)) {
            self.ifStatement();
        } else if (self.match(.While)) {
            self.whileStatement();
        } else if (self.match(.LeftBrace)) {
            self.beginScope();
            self.block();
            self.endScope();
        } else {
            self.expressionStatement();
        }
    }

    fn ifStatement(self: *Instance) void {
        self.consume(.LeftParen, "Expect '(' after if.");
        self.expression();
        self.consume(.RightParen, "Expect ')' after condition");

        const thenJump = self.emitJump(OpCode.JumpIfFalse);
        self.emitOpCode(.Pop);
        self.statement();

        const elseJump = self.emitJump(.Jump);

        self.patchJump(thenJump);
        self.emitOpCode(.Pop);

        if (self.match(.Else)) self.statement();
        self.patchJump(elseJump);
    }

    fn patchJump(self: *Instance, offset: usize) void {
        const jump = self.currentChunk().code.len - offset - 2;
        if (jump > std.math.maxInt(u16)) {
            self.parser.errorAtPrevious("Too much code to jump over");
        }
        self.currentChunk().code.items[offset + 0] = @truncate(u8, (jump >> 8) & 0xff);
        self.currentChunk().code.items[offset + 1] = @truncate(u8, jump & 0xff);
    }

    fn whileStatement(self: *Instance) void {
        const loopStart = @intCast(i32, self.currentChunk().code.len);
        self.consume(.LeftParen, "Expect '(' after 'while'.");
        self.expression();
        self.consume(.RightParen, "Expect ')' after condition.");

        const exitJump = self.emitJump(.JumpIfFalse);

        self.emitOpCode(.Pop);
        self.statement();

        self.emitLoop(loopStart);

        self.patchJump(exitJump);
        self.emitOpCode(.Pop);
    }

    fn beginScope(self: *Instance) void {
        self.current.scope_depth += 1;
    }

    fn block(self: *Instance) void {
        while (!(self.check(.RightBrace) or self.check(.EOF))) {
            self.declaration();
        }

        self.consume(.RightBrace, "Expect '}' after block.");
    }

    fn endScope(self: *Instance) void {
        self.current.scope_depth -= 1;
        var next_index = @intCast(u8, self.current.local_count - 1);
        while (self.current.local_count > 0 and self.current.locals[next_index].depth > self.current.scope_depth) {
            self.emitOpCode(.Pop);
            self.current.local_count -= 1;
            next_index = @intCast(u8, self.current.local_count);
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
        if (self.parser.had_panic) self.synchronize();
    }

    fn synchronize(self: *Instance) void {
        self.parser.had_panic = false;

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
        self.declareVariable();
        if (self.current.scope_depth > 0) return 0;
        return self.identifierConstant(self.parser.previous);
    }

    fn declareVariable(self: *Instance) void {
        // Global variables are implicitly declared.
        if (self.current.scope_depth == 0) return;

        const name = self.parser.previous;
        var i = self.current.local_count - 1;
        while (i >= 0) : (i -= 1) {
            const local_index = @intCast(u8, i);
            const local = &self.current.locals[local_index];
            if (local.depth != -1 and local.depth < self.current.scope_depth) break;
            if (identifiersEqual(name, local.name)) {
                self.parser.errorAtPrevious("Variable with this name already declared in this scope.");
            }
        }

        self.addLocal(name);
    }

    fn resolveLocal(self: *Instance, compiler: *Compiler, name: Token) !u8 {
        var i = compiler.local_count - 1;
        while (i >= 0) : (i -= 1) {
            const local_index = @intCast(u8, i);
            const local = &compiler.locals[local_index];
            if (identifiersEqual(name, local.name)) {
                if (local.depth == -1) {
                    self.parser.errorAtPrevious("Cannot read local variable in its own initializer.");
                }
                return @intCast(u8, i);
            }
        }
        return error.NotFound;
    }

    fn identifiersEqual(a: Token, b: Token) bool {
        if (a.lexeme.len != b.lexeme.len) return false;
        return std.mem.eql(u8, a.lexeme, b.lexeme);
    }

    fn addLocal(self: *Instance, name: Token) void {
        if (self.current.local_count == 255) {
            self.parser.errorAtPrevious("Too many local variables in function.");
            return;
        }

        const local_index = @intCast(u8, self.current.local_count);
        var local = &self.current.locals[local_index];
        self.current.local_count += 1;
        local.name = name;
        local.depth = -1;
    }

    fn  identifierConstant(self: *Instance, name: Token) u8 {
        const obj_string = ObjString.copy(name.lexeme);
        return self.makeConstant(obj_string.value());
    }

    fn  defineVariable(self: *Instance, global: u8) void {
        if (self.current.scope_depth > 0) {
            self.markInitialized();
            return;
        }
        self.emitBytes(@enumToInt(OpCode.DefineGlobal), global);
    }

    fn markInitialized(self: *Instance) void {
        if (self.current.scope_depth == 0) return;
        const local_index = @intCast(u8, self.current.local_count - 1);
        self.current.locals[local_index].depth = self.current.scope_depth;
    }

    fn parsePrecedence(self: *Instance, precedence: Precedence) void {
        _ = self.advance();

        const parsePrefix = getRule(self.parser.previous.token_type).prefix;
        if (verbose) std.debug.warn("Parsing Prefix {} (.{})\n", @tagName(self.parser.previous.token_type), @tagName(precedence));

        if (parsePrefix == null) {
            self.parser.errorAtPrevious("Expect expression");
            return;
        }

        const canAssign = precedence.isLowerThan(.Assignment);
        parsePrefix.?(self, canAssign);

        while (precedence.isLowerThan(getRule(self.parser.current.token_type).precedence)) {
            _ = self.advance();
            const parseInfix = getRule(self.parser.previous.token_type).infix.?;
            if (verbose) std.debug.warn("Parsing Infix {} (.{})\n", @tagName(self.parser.previous.token_type), @tagName(precedence));
            parseInfix(self, canAssign);
        }

        if (canAssign and self.match(TokenType.Equal)) {
            self.parser.errorAtPrevious("Invalid assignment target.");
            self.expression();
        }
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
            else => unreachable,
        }
    }

    fn getRule(token_type: TokenType) *const ParseRule {
        const rule = &rules[@enumToInt(token_type)];
        return rule;
    }

    fn literal(self: *Instance, canAssign: bool) void {
        switch (self.parser.previous.token_type) {
            TokenType.False => self.emitOpCode(OpCode.False),
            TokenType.Nil => self.emitOpCode(OpCode.Nil),
            TokenType.True => self.emitOpCode(OpCode.True),
            else => unreachable,
        }
    }

    fn variable(self: *Instance, canAssign: bool) void {
        self.namedVariable(self.parser.previous, canAssign);
    }

    fn namedVariable(self: *Instance, name: Token, canAssign: bool) void {
        var getOp: OpCode = undefined;
        var setOp: OpCode = undefined;
        const arg =  blk: {
            if (self.resolveLocal(self.current, name)) |l| {
                getOp = .GetLocal;
                setOp = .SetLocal;
                break :blk l;
            } else |_| {
                getOp = .GetGlobal;
                setOp = .SetGlobal;
                break :blk self.identifierConstant(name);
            }
        };

        if (canAssign and self.match(TokenType.Equal)) {
            self.expression();
            self.emitBytes(@enumToInt(setOp), arg);
        } else {
            self.emitBytes(@enumToInt(getOp), arg);
        }
    }

    fn string(self: *Instance, canAssign: bool) void {
        const lexeme = self.parser.previous.lexeme;
        self.emitConstant(ObjString.copy(lexeme[0..]).value());
    }

    fn orFn(self: *Instance, canAssign: bool) void {
        const elseJump = self.emitJump(.JumpIfFalse);
        const endJump = self.emitJump(.Jump);

        self.patchJump(elseJump);
        self.emitOpCode(.Pop);

        self.parsePrecedence(.Or);
        self.patchJump(endJump);
    }

    fn andFn(self: *Instance, canAssign: bool) void {
        const endJump = self.emitJump(.JumpIfFalse);

        self.emitOpCode(.Pop);
        self.parsePrecedence(.And);

        self.patchJump(endJump);
    }

    fn emitJump(self: *Instance, op: OpCode) usize {
        self.emitOpCode(op);
        self.emitByte('\xFF');
        self.emitByte('\xFF');

        return self.currentChunk().code.len - 2;
    }

    fn emitLoop(self: *Instance, loopStart: i32) void {
        self.emitOpCode(OpCode.Loop);
        const count = @intCast(i32, self.currentChunk().code.len);
        const offset = @intCast(u16, count - loopStart + 2);
        if (offset > std.math.maxInt(u16)) self.parser.errorAtPrevious("Loop body too large.");

        self.emitByte(@truncate(u8, (offset >> 8) & 0xff));
        self.emitByte(@truncate(u8, offset & 0xff));
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

pub const Compiler = struct {
    locals: [256]Local,
    local_count: i32,
    scope_depth: i32,

    pub fn create() Compiler {
        return Compiler {
            .locals = undefined,
            .local_count = 0,
            .scope_depth = 0,
        };
    }
};

pub const Local = struct {
    name: Token,
    depth: i32,
};
