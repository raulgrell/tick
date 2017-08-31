
ZIG = /home/raulgrell/Dev/zig/build/bin/zig
DZIG = /home/raulgrell/Projects/Zig/zig/build/bin/zig

debug:
	$(ZIG) build_exe dev.zig --library c --library dl
	$(ZIG) build_lib game.zig --output ./game
	./dev

dev:
	$(ZIG) build_exe dev.zig --library c --library dl

game: game.zig
	$(ZIG) build_lib game.zig --output ./game
