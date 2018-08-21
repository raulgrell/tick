const TokenType = @import("./scanner.zig").TokenType;
const Compiler = @import("./compiler.zig").Compiler;

const ParseRule = Compiler.ParseRule;
const Precedence = Compiler.Precedence;
const ParseFn = Compiler.ParseFn;

const TokenRule = struct {
    token_type: TokenType,
    name: []const u8,
    rule: ParseRule,
};

fn Symbol() ParseRule {
    return makeParseRule(null, null, Precedence.None);
}

fn Prefix(func: ParseFn) ParseRule {
    return makeParseRule(func, null, Precedence.None);
}

fn Infix(func: ParseFn, prec: Precedence) ParseRule {
    return makeParseRule(null, func, prec);
}

fn Mixed(prefix_func: ParseFn, infix_func: ParseFn, prec: Precedence) ParseRule {
    return makeParseRule(null, func, prec);
}

fn makeTokenRule(token_type: TokenType, name: []const u8, rule: ParseRule) TokenRule {
    return TokenRule { .token_type = token_type, .name = name, .rule = rule };
}

fn makeParseRule(prefix: ?ParseFn, infix: ?ParseFn, precedence: Precedence) ParseRule {
    return ParseRule {
        .prefix = prefix,
        .infix = infix,
        .precedence = precedence
    };
}

pub const keywords = []TokenRule {
    makeTokenRule(TokenType.And,          "and",    Symbol()),
    makeTokenRule(TokenType.Class,        "class",  Symbol()),
    makeTokenRule(TokenType.Else,         "else",   Symbol()),
    makeTokenRule(TokenType.False,        "false",  Prefix(Compiler.literal)),
    makeTokenRule(TokenType.Fn,           "fn",     Symbol()),
    makeTokenRule(TokenType.For,          "for",    Symbol()),
    makeTokenRule(TokenType.If,           "if",     Symbol()),
    makeTokenRule(TokenType.Nil,          "nil",    Prefix(Compiler.literal)),
    makeTokenRule(TokenType.Or,           "or",     Symbol()),
    makeTokenRule(TokenType.Print,        "print",  Symbol()),
    makeTokenRule(TokenType.Return,       "return", Symbol()),
    makeTokenRule(TokenType.Super,        "super",  Symbol()),
    makeTokenRule(TokenType.This,         "this",   Symbol()),
    makeTokenRule(TokenType.True,         "true",   Prefix(Compiler.literal)),
    makeTokenRule(TokenType.Var,          "var",    Symbol()),
    makeTokenRule(TokenType.While,        "while",  Symbol())
};

const operators = []TokenRule {
    makeTokenRule(TokenType.LeftParen,    "(",      makeParseRule(grouping, null, Precedence.Call)),
    makeTokenRule(TokenType.RightParen,   ")",      Symbol()),
    makeTokenRule(TokenType.LeftBrace,    "{",      Symbol()),
    makeTokenRule(TokenType.RightBrace,   "}",      Symbol()),
    makeTokenRule(TokenType.Comma,        ",",      Symbol()),
    makeTokenRule(TokenType.Dot,          ".",      Symbol()),
    makeTokenRule(TokenType.Minus,        "-",      Mixed(Compiler.unary, Compiler.binary, Precedence.Term)),
    makeTokenRule(TokenType.Plus,         "+",      Infix(Compiler.binary, Precedence.Term)),
    makeTokenRule(TokenType.Semicolon,    ";",      Symbol()),
    makeTokenRule(TokenType.Slash,        "*",      Infix(Compiler.binary, Precedence.Factor)),
    makeTokenRule(TokenType.Star,         "/",      Infix(Compiler.binary, Precedence.Factor)),
    makeTokenRule(TokenType.Bang,         "!",      Prefix(Compiler.unary)),
    makeTokenRule(TokenType.BangEqual,    "!=",     Infix(Compiler.binary, Precedence.Equality)),
    makeTokenRule(TokenType.Equal,        "=",      Symbol()),
    makeTokenRule(TokenType.EqualEqual,   "==",     Infix(Compiler.binary, Precedence.Equality)),
    makeTokenRule(TokenType.Greater,      ">",      Infix(Compiler.binary, Precedence.Comparison)),
    makeTokenRule(TokenType.GreaterEqual, ">=",     Infix(Compiler.binary, Precedence.Comparison)),
    makeTokenRule(TokenType.Less,         "<",      Infix(Compiler.binary, Precedence.Comparison)),
    makeTokenRule(TokenType.LessEqual,    "<=",     Infix(Compiler.binary, Precedence.Comparison))
};

const literals = []TokenRule {
    makeTokenRule(TokenType.Identifier,   "",       Symbol()),
    makeTokenRule(TokenType.String,       "",       Symbol()),
    makeTokenRule(TokenType.Number,       "",       Prefix(Compiler.number))
};

const state = []TokenRule {
    makeTokenRule(TokenType.Error,        "error",  Symbol()),
    makeTokenRule(TokenType.EOF,          "EOF",    Symbol())
};

const rules = keywords ++ operators ++ literals ++ state;