#include <sys/ioctl.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

void np_init()
{
	memset(&np_state, 0, sizeof(np_state));

	struct winsize w;
	ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);

	// Get the relevant information out
	np_state.width = w.ws_row;
	np_state.height = w.ws_col;

	// Clear the whole terminal
	printf("%c[2J", 0x1B);

	np_shared_init();
}

void np_uninit()
{
	np_shared_uninit();
}

void np_draw(unsigned x, unsigned y, char c)
{
	assert(x <= np_width());
	assert(y <= np_height());

	// check cache
	struct s_np_tile_state *tile = &np_state.buffer[np_state.width * y + x];

	if (c == tile->c && np_state.bg_color == tile->bg_color && np_state.fg_color == tile->fg_color)
		return; // Nothing changed!

	np_set_cursor_pos(x, y);
	printf("%c", c);

	// Update cache
	tile->c = c;
	tile->fg_color = np_state.fg_color;
	tile->bg_color = np_state.bg_color;
}

void np_update()
{
	np_set_cursor_pos(np_width(), np_height());
	printf("\n");
}

void np_set_cursor_pos(unsigned x, unsigned y)
{
	printf("%c[%d;%df", 0x1B , y, x);
}

void np_fg_color(enum np_color color)
{
	printf("%c[%dm", 0x1B, 30 + color);
}

void np_bg_color(enum np_color color)
{
	printf("%c[%dm", 0x1B, 40 + color);
}