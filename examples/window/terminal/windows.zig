#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <Wincon.h>

void np_init()
{
	// reset everything
	memset(&np_state, 0, sizeof(np_state));

	CONSOLE_SCREEN_BUFFER_INFO bufferInfo;
	np_state.consoleHandle = GetStdHandle(STD_OUTPUT_HANDLE);

	GetConsoleScreenBufferInfo(np_state.consoleHandle, &bufferInfo);

	// Get the relevant information out
	np_state.width = bufferInfo.dwSize.X;
	np_state.height = bufferInfo.srWindow.Bottom - bufferInfo.srWindow.Top + 1;

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

	unsigned written;
	WriteConsole(np_state.consoleHandle, &c, 1, &written, NULL);

	assert(written == 1);

	// Update cache
	tile->c = c;
	tile->fg_color = np_state.fg_color;
	tile->bg_color = np_state.bg_color;
}

void np_update()
{
	/* stub */
}

void np_internal_set_color()
{
	WORD value = 0;

	//TODO: add intensity for extra effect

	switch (np_state.fg_color)
	{
	default:
		break;
	case NP_BLACK:
		// not set
		break;
	case NP_RED:
		value += FOREGROUND_RED;
		break;
	case NP_GREEN:
		value += FOREGROUND_GREEN;
		break;
	case NP_YELLOW:
		value += FOREGROUND_RED | FOREGROUND_GREEN;
		break;
	case NP_BLUE:
		value += FOREGROUND_BLUE;
		break;
	case NP_MAGENTA:
		value += FOREGROUND_RED | FOREGROUND_BLUE;
		break;
	case NP_CYAN:
		value += FOREGROUND_GREEN | FOREGROUND_BLUE;
		break;
	case NP_WHITE:
		value += FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE;
		break;
	}

	switch (np_state.bg_color)
	{
	default:
		break;
	case NP_BLACK:
		// not set
		break;
	case NP_RED:
		value += BACKGROUND_RED;
		break;
	case NP_GREEN:
		value += BACKGROUND_GREEN;
		break;
	case NP_YELLOW:
		value += BACKGROUND_RED | BACKGROUND_GREEN;
		break;
	case NP_BLUE:
		value += BACKGROUND_BLUE;
		break;
	case NP_MAGENTA:
		value += BACKGROUND_RED | BACKGROUND_BLUE;
		break;
	case NP_CYAN:
		value += BACKGROUND_GREEN | BACKGROUND_BLUE;
		break;
	case NP_WHITE:
		value += BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE;
		break;
	}

	SetConsoleTextAttribute(np_state.consoleHandle, value);
}

void np_fg_color(enum np_color color)
{
	np_state.fg_color = color;

	np_internal_set_color();
}

void np_bg_color(enum np_color color)
{
	np_state.bg_color = color;

	np_internal_set_color();
}

void np_set_cursor_pos(unsigned x, unsigned y)
{
	if (np_state.cursor_pos_x == x && np_state.cursor_pos_y == y)
		return; // Already in position

	COORD pos;

	pos.X = x;
	pos.Y = y;

	SetConsoleCursorPosition(np_state.consoleHandle, pos);
}