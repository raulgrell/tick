# Tick

Tick is a small game engine built using the Zig programming language. It is meant as
an educational tool and showcase of some of the capabilities of Zig.

### Current Direction

This is a port of an old C++ amalgam of several tutorials and miscellaneous projects. I am currently
separating out the platform and graphics layers into reusable interfaces. Then the scene and layer 
management layers need to be cleaned up so that it can handle spatial partitioning,
physics and lighting in a sensible way.

Eventually, I want to have a way of creating 'virtual consoles' where memory resources are fully defined at
compile-time.

## Current Features
- 2D Immediate Mode Renderer
- 2D Batched Renderer
- Basic Immediate Mode GUI
- Generic linear math and quaternion library.
- Hot reloading of game code
- Easy integration with C Libraries
- Platform: Linux/GLFW

### Zig

Zig is a systems programming language built on the LLVM compiler toolchain. It allows easy interfacing
with C libraries by directly including their header files. It has a clear syntax with simple yet
powerful concepts, allows compile time evaluation and generation of code, and provides convenient error
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

Zig will create an executable called 'dev', and a shared library 'libgame.so' that contains your game and
engine code. Both of these files will be inside the zig-cache directory. In order to update your game code, run:

```
$ zig build update
```

The hot-reload code is based on Chris Wellon's post http://nullprogram.com/blog/2014/12/23/, and there is a
port to zig in `./platform/live`. Just adjust the makefile.

The rest of the project was inspired by 

### Limitations

Changing the definition of the State struct may require a rebuild of the live environment. I'm working on this.

You cannot change the function signatures of the API without a recompile of the live executable. 
I probably won't work on this, as it is but a minor inconvenience, and a major technical hurdle.

## In Development
- Audio
- Background recompiler - recompile on save
- Platform API
- Graphics API
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
- Platforms: SDL, Win32, X11, OSX, Android, iOS, Raspberry Pi
- Graphics: OpenGLES, DX12, Vulkan

