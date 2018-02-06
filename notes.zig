// Generator functions
// - Generalization of the keyword ( object ) | view, index | { block } syntax

fn for(slice: []var) :: slice.child_type {
    var i = usize(0);
    while (i < slice.len) {
        yield slice[i];
    }
}

fn linked_list_for(head: ?&var) :: head.ref_type {
    var node = head ?? return;
    while (node) | n | : (node = n.next()) {
        yield node;
    }
}

// Function Decorator

pub fn timeIt() | fn, args | {
    print("before");
    fn(args);
    print("after")
}

// Loops

for (int i = 0; i < n; n++) { }

var i: u8 = 0;
while(i < n; n += 1) { }

while ( maybe ) | value | 
        forward: {  i += 1 },
        back: { i -= 1 },
        restart: { i = 0 }, {
    switch(value) {
        0 => {
            continue :forward;
        },
        1 => {
            continue :restart;
        },
        2 => {
            continue :back;    
        },
    }
}

// Default field initializer

const Foo = struct {
    a: u8,
    b: u8 = 0
}

const foo_default_b = Foo {.a = 0};
const foo_defined_b = Foo {.a = 0, .b = 1};
const foo_skipped_b = Foo {.a = 0, .b = undefined};


// There are a few absractions that are somewhat already possible in Zig:

// **Subtyping** - Include the parent struct within the child struct
// **Inheritance** - Access parent struct using @fieldParentPtr
// **Polymorphism** - Like inheritance or with enums
// **Interfaces** - Include a struct consisting of function pointers
// **Traits** - An instance of an interface struct

/// 
// Subtyping
///

const Parent = struct {
    a: u8,
};
const Child = struct {
    parent: Parent,
    b: u8
};

// Instance
const child = Child {
    .parent = Parent {
        .a = 0,
    }
    .b = 0
}

///
// Interfaces
///

// Interface
const IFoo = struct {
    bar: fn(a: u8) -> u8
}

// Implementation
fn action_bar(a: u8) -> u8 { a }

// Instance
const Foo = struct {
    actions: IFoo
}

const foo = Foo {
    .actions = IFoo {
        .bar = action_bar
    } 
}


///
// Traits
///

const BarTrait = IFoo {
    .bar = action_bar
}


///
// Proposal - Bound structs
///



Following recent discussions on default parameters, I'll share my thoughts where anonymous functions are concerned.

Proposal: Make all functions anonymous

- Where can functions be declared: Anywhere that other identifiers can be declared. In the top-level, declarations are order independent. Anywhere else, they follow execution order. Declaring an anonymous function creates a new function, scoped to the block it is declared in.

- What implicit parameters get passed to a function when you call it? None, except what is allowed by UFCS. Everything except the parameters must be known at comptime.

- If there is some type like bound fn, what is it bound to? At this point, anonymous functions don't have any context. If we want some kind of implicit binding/parameters, we do it via generics/UFCS. This sounds like a kind of static context that could be stored on the stack, or something like binding a namespace to the function.

- Returning functions should also be possible - If the functions don't have any bound context, this is trivial.

Notes:

- structs and enums are anonymous.
- One way of doing things.