const warn = @import("std").debug.warn;
const debug = @import("std").debug;
const mem = @import("std").mem;
const BufMap = @import("std").BufMap;
const ArrayList = @import("std").ArrayList;

pub const Section = struct
{
    name: []const u8,
    vars: BufMap,
    
    fn new(self: *Section, name: []const u8, val: []const u8) !void
    {
        if(self.vars.get(name)) |_| return error.VariableRedefinition;
        try self.vars.set(name, val);
    }
};

pub const SectionList = struct
{
    alloc: *mem.Allocator,
    strs: ArrayList([]const u8),
    sections: ArrayList(Section),
    
    fn new(self: *SectionList, name: []const u8) !usize
    {
        if(self.get(name)) |_| return error.SectionRedefinition;
        
        var sec = Section
        {
            .name = try self.addStr(name),
            .vars = BufMap.init(self.alloc),
        };
        
        try self.sections.append(sec);
        return self.sections.len - 1;
    }
    
    fn addStr(self: *SectionList, str: []const u8) ![]const u8
    {
       const copy = try self.alloc.alloc(u8, str.len);
       mem.copy(u8, copy, str);
       try self.strs.append(copy);
       return copy;
    }
    
    pub fn get(self: *SectionList, sec: []const u8) ?*const BufMap
    {
        for(self.sections.toSliceConst()) |*s|
        {
            if(mem.eql(u8, s.name, sec)) return &s.vars;
        }
        return null;
    }
    
    pub fn free(self: *SectionList) void
    {
        var slice = self.sections.toSlice();
        for(slice) |*s| s.vars.deinit();
        for(self.strs.toSliceConst()) |str| self.alloc.free(str);
        self.strs.deinit();
        self.sections.deinit();
    }
};



fn getSectionNameEnd(bytes: []const u8) !usize
{
    var i = usize(0);
    while(i < bytes.len):(i += 1)
    {
        switch(bytes[i])
        {
            ']' => return i,
            '\n' => return error.IncompleteSectionDef,
            else => {},
        }
    }
    return error.IncompleteSectionDef;
}

fn getVarEnd(bytes: []const u8) usize
{
    var i = usize(0);
    while(i < bytes.len):(i += 1)
    {
        switch(bytes[i])
        {
            '=','\n' => return i,
            else => {},
        }
    }
    return i;
}

fn getValEnd(bytes: []const u8) !usize
{
    var i = usize(0);
    while(i < bytes.len):(i += 1)
    {
        switch(bytes[i])
        {
            '=' => return error.InvalidAssignment,
            '\n' => return i,
            else => {},
        }
    }
    return i;
}

fn skipComment(bytes: []const u8) usize
{
    var i = usize(0);
    while(i < bytes.len):(i += 1)
    {
        switch(bytes[i])
        {
            '\n' => return i,
            else => {},
        }
    }
    return i;
}



const _read_Chk = struct
{   
    fn noSectionsDefined(list: *SectionList) !void
    {
        if(list.sections.len == 0)
        {
            _ = try list.new("");
        }
    }
    
    fn endSectionDef(bytes: []const u8) !void
    {
        if(bytes.len == 0) return;
        if(bytes[0] != '\n') return error.ExcessDataInSectionDef;
    }
    
    fn decodeHexByte(hex: []const u8) !u8
    {
        debug.assert(hex.len >= 2);
        
        var b = u8(0);
        
        comptime var i = 0;
        inline while(i < 2):( i += 1)
        {
            var c = hex[i];
            comptime var factor = switch(i)
            {
                //this is easier since math.pow unsupported for int types
                0 => 16,
                1 => 1,
                else => unreachable,
            };
            switch(c)
            {
                '0' ... '9' => b += (c - 48) * factor,
                'a' ... 'f' => b += (c - (97 - 10)) * factor,
                'A' ... 'F' => b += (c - (65 - 10)) * factor,
                else => return error.InvalidHexSequence,
            }
        }
        return b;
    }
    
    // \n, \\, \xNN
    fn escapeStr(str: []const u8, buf: *ArrayList(u8)) ![]const u8
    {
        var saved_len = buf.len;
        var i = usize(0);
        while(i < str.len):(i += 1)
        {
            var c = str[i];
            if(c != '\\') continue;
            break;
        }
        if(i == str.len) return str;
        
        try buf.ensureCapacity(str.len + buf.len);
        errdefer buf.shrink(buf.len);
        
        var copy_start_pos = usize(0);
        i = 0;
        while(i < str.len):(i += 1)
        {
            var c = str[i];
            if(c != '\\') continue;
            
            try buf.appendSlice(str[copy_start_pos..i]);
            i += 1;
            if(str.len < i) return error.InvalidEscapeSequence;
            switch(str[i])
            {
                '\\' => try buf.append('\\'),
                'n' => try buf.append('\n'),
                'x' =>
                {
                    if(str.len < i + 3) return error.InvalidEscapeSequence;
                    var hex = str[i + 1..i + 3];
                    var b = try decodeHexByte(hex);
                    try buf.append(b);
                    i += 2;
                },
                else => return error.InvalidEscapeSequence,
            }
            copy_start_pos = i + 1;
        }
        return buf.toSliceConst()[saved_len..];
    }
};

pub fn read(alloc: *mem.Allocator, bytes: []const u8) !SectionList
{
    var tmp_buf = ArrayList(u8).init(alloc);
    defer tmp_buf.deinit();
    
    var section_list = SectionList
    {
        .alloc = alloc,
        .strs = ArrayList([]const u8).init(alloc),
        .sections = ArrayList(Section).init(alloc),
    };
    
    errdefer section_list.free();
    
    var i = usize(0);
    while(i < bytes.len):(i += 1)
    {
        
        switch(bytes[i])
        {
            '#' => i += skipComment(bytes[i..]),
            '\n' => {},
            '[' =>
            {
                i += 1;
                var s = i;
                i += try getSectionNameEnd(bytes[i..]);
                var name = bytes[s..i];
                name = try _read_Chk.escapeStr(name, &tmp_buf);
                _ = try section_list.new(name);
                tmp_buf.shrink(0);
                i += 1; //eat the ']'
                try _read_Chk.endSectionDef(bytes[i..]);
            },
            else =>
            {
                try _read_Chk.noSectionsDefined(&section_list);
                
                var var_s = i;
                i += getVarEnd(bytes[i..]);
                var var_e = i;
                var var_name = bytes[var_s..var_e];
                var_name = try _read_Chk.escapeStr(var_name, &tmp_buf);
                
                var sec = section_list.sections.pop();
                
                if(bytes.len <= i or bytes[i] == '\n')
                {
                    try sec.new(var_name, "");
                    tmp_buf.shrink(0);
                    try section_list.sections.append(sec);
                    continue;
                }
                
                if(bytes[i] == '=') i += 1 else unreachable;
                
                var val_s = i;
                i += try getValEnd(bytes[i..]);
                var val_e = i;
                
                var val = bytes[val_s..val_e];
                val = try _read_Chk.escapeStr(val, &tmp_buf);

                try sec.new(var_name, val);
                tmp_buf.shrink(0);

                try section_list.sections.append(sec);
            },
        }
    }
    return section_list;
}