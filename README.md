# Tick

Tick is a small game engine built using the Zig programming language.

## Features
- 2D Immediate Mode Renderer
- Generic linear math library, quaternion library.
- Hot reload game code
- Platform: Linux/GLFW

### Zig

Zig is a systems programming language built on the LLVM compiler toolchain. It allows easy interfacing
with C libraries by directly including their header files. It has a clear syntax with simple yet
powerful concepts, allows compile time evaluation and generation of code, and provides convenient error
handling and nullable-type semantics. For more information, check out http://ziglang.org/

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

### Limitations

Changing the definition of the State struct may require a rebuild of the live environment. I'm working on this.

You cannot change the function signatures of the API without a recompile. I probably won't work on this, as it
is but a minor inconvenience.

## In Development
- Audio
- Platform API
- Graphics API
- Immediate Mode GUI
- Scene Manager
- 2D Batched Renderer
- Sprite Animations
- Resource Manager / Virtual filesystem
- Robust memory management
- 2D Physics 

## Planned Features
- 3D Physics
- 3D Deferred Renderer
- 3D Forward Renderer
- Skeleton Animations
- Integrated debugger
- Networking
- Platforms: SDL, Win32, X11, OSX, Android, iOS, Raspberry Pi
- Graphics: OpenGLES, DX12, Vulkan

