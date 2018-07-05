// const E = enum                {A, B};                                       
// const E = enum(I)             {A = 0, B = 1}                                
// 
// const U = union               {A: T, B: U}        v = V { .A = t }
// const U = union(enum)         {A: T, B: U}        v = V { .A = t }          switch
// const U = union(E)            {A: T, B: U}        v = V { .A = t }          E {A, B}
// 
// const S = struct              {a: T, b: U}        s = S {.a = a, .b = b}
// const S = struct(enum)        {a: T, b: U}        s = S {.a = a, .b = b}    
// const S = struct(E)           {a: T, b: U}        s = S {.a = a, .b = b}    

ArrayList
-   First index
-   Last index
-   Head
-   Tail
-   removeSlice
-   replaceSlice
-   clear
-   rename toOwnedSlice to toSliceOwned?
-   rename append to push?

Buffer
-   Go ahead and remove appendFormat|Byte|ByteNTimes?
-   Replace above with write to stream?
-   add contains()
-   probably some of the above too

cstr
-   Add standard c function equivalents?

unicode
- add decode(bytes, length)?

NEW
===

terminal
dynlib
