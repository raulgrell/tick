# Tick

Tick is a small game engine built using the Zig programming language. It is meant as
an learning tool and showcase of some of the capabilities of Zig.

## Current Features
- 2D Immediate Mode Renderer
- 2D Batched Renderer
- Immediate Mode GUI
- Generic linear math and quaternion library.
- Hot code reloading
- Easy integration with C Libraries
- Platform: Linux/GLFW

### Zig

Zig is a systems programming language built on the LLVM compiler toolchain. It allows easy interfacing
with C libraries by directly including their header files. It has an expressive but simple syntax,
facilitates compile time evaluation of code, coroutines, and provides convenient error
handling and nullable-type semantics. For more information, check out http://ziglang.org/

### Dependencies

As well as the requirements for a Zig development environment, you will need:
- libc
- GLFW
- libsoundio

## Usage

Set up your Zig development environment and run the following commands on your shell:

```
$ git clone https://github.com/raulgrell/tick.git
$ cd tick
$ zig build live
```

This will clone tick and cd into its directory. ´zig build live´ will build and run the live environment.

Zig will create an executable called 'dev', and a shared library 'libgame.so' that contains your game and the
engine code. Both of these files will be inside the zig-cache directory. In order to update your game code, run:

```
$ zig build update
```

The hot-reload code is based on Chris Wellon's post http://nullprogram.com/blog/2014/12/23/, and there is a
port to zig in `./examples/live`. Just adjust the makefile.

### Limitations

Changing the definition of the State struct may require a rebuild of the live environment.

You cannot change the function signatures of the API without a recompile of the live executable. 
I probably won't work on this, as it is but a minor inconvenience, and a major technical hurdle.

## In Development
- Audio
- Background recompiler - recompile on save
- Platform API
- Graphics API
- Software Renderer API
- Scene Manager
- Sprite Animations
- Resource Manager / Virtual Filesystem
- Robust memory management
- 2D Physics 

## Planned Features
- 3D Rendering
- Skeleton Animations
- Integrated debugger
- Networking
- Platforms: SDL, Win32, X11, OSX, Raspberry Pi
- Graphics: OpenGLES, Vulkan

