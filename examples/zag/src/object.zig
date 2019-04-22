
const ObjType = enum {
    String
};

const ObjString = struct {
    obj: Obj,
    bytes: []const u8,
};

const Obj = union(ObjType) {
    String: *Obj,

    fn isObjType(value: Value, obj_type: ObjType) {
        return value.isObj() and ObjType(obj) == obj_type;
    }
};


ObjString* copyString(const char* chars, int length) {
  char* heapChars = ALLOCATE(char, length + 1);       
  memcpy(heapChars, chars, length);                   
  heapChars[length] = '\0';                           

  return allocateString(heapChars, length);           
}       