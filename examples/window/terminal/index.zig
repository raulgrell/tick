#include <stdlib.h>
#include <assert.h>

enum np_color
{
	NP_BLACK = 0,
	NP_RED,
	NP_GREEN,
	NP_YELLOW,
	NP_BLUE,
	NP_MAGENTA,
	NP_CYAN,
	NP_WHITE
};

// State for a single tile
struct s_np_tile_state
{
	char c;
	enum np_color fg_color;
	enum np_color bg_color;
};

// State for the whole nPrkl
struct s_np_state 
{
	unsigned width;
	unsigned height;
	unsigned cursor_pos_x;
	unsigned cursor_pos_y;

	enum np_color fg_color;
	enum np_color bg_color;

#ifdef _WIN32
	HANDLE consoleHandle;
#endif

	struct s_np_tile_state *buffer;
};

static struct s_np_state np_state;

void np_init();                                             // Initialize the nPrkl library, should always be called first
void np_uninit();                                           // Release memory allocated by nPrkl
void np_update();                                           // Call once per frame
void np_draw(unsigned x, unsigned y, char c);               // Write a single char into a certain position
void np_fg_color(enum np_color color);                      // Set the foreground color
void np_bg_color(enum np_color color);                      // Set the background color
void np_set_cursor_pos(unsigned x, unsigned y);             // Set cursor position, used internally

void np_draw_string(unsigned x, unsigned y, char *s);       // Draw string to a certain position
unsigned np_width();                                        // Get console width in characters
unsigned np_height();                                       // Get console height in rows


void np_shared_init()
{
	// Allocate a buffer
	np_state.buffer = (struct s_np_tile_state*)malloc(sizeof(struct s_np_tile_state) * np_state.width * np_state.height);

	assert(np_state.buffer != NULL);

	for (unsigned x = 0; x < np_state.width; ++x)
	{
		for (unsigned y = 0 ; y < np_state.height; ++y)
		{
			struct s_np_tile_state *tile = &np_state.buffer[np_state.width * y + x];

			// set the default colors
			tile->c = ' ';
			tile->fg_color = NP_WHITE;
			tile->bg_color = NP_BLACK;
		}
	}

}

void np_shared_uninit()
{
	free(np_state.buffer);
}

unsigned np_width() { return np_state.width; }

unsigned np_height() { return np_state.height; }

void np_draw_string(unsigned x, unsigned y, char *s)
{
	unsigned len = strlen(s);
	unsigned i = 0;

	while (i < len)
	{
		np_set_cursor_pos(x, y);

		// draw one by one to make sure caching is working
		np_draw(x, y, s[i]);

		++x;
		++i;
	}
}
