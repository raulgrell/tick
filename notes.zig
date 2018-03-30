

const E = enum                {A, B};                                       
const E = enum(I)             {A = 0, B = 1}                                

const U = union               {A: T, B: U}        v = V { .A = t }
const U = union(enum)         {A: T, B: U}        v = V { .A = t }          switch
const U = union(E)            {A: T, B: U}        v = V { .A = t }          E {A, B}

const S = struct              {a: T, b: U}        s = S {.a = a, .b = b}
const S = struct(enum)        {a: T, b: U}        s = S {.a = a, .b = b}    
const S = struct(E)           {a: T, b: U}        s = S {.a = a, .b = b}    
