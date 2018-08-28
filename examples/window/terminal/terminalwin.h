#include <conio.h>
#include <windows.h>

typedef enum{tBlack,tBlue,tGreen,tCyan,tRed,tMagenta,tYellow,
	tGray,tLightGray,tLightBlue,tLightGreen,tLightCyan,tLightRed,tLightMagenta,tLightYellow,tWhite}tColor;


int ForeGound[]={
0,
FOREGROUND_BLUE,
FOREGROUND_GREEN,
FOREGROUND_GREEN | FOREGROUND_BLUE,
FOREGROUND_RED,
FOREGROUND_RED | FOREGROUND_BLUE,
FOREGROUND_RED | FOREGROUND_GREEN,
FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE,
FOREGROUND_INTENSITY,
FOREGROUND_INTENSITY | FOREGROUND_BLUE,
FOREGROUND_INTENSITY | FOREGROUND_GREEN,
FOREGROUND_INTENSITY | FOREGROUND_GREEN | FOREGROUND_BLUE,
FOREGROUND_INTENSITY | FOREGROUND_RED,
FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_BLUE,
FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN,
FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE
  }; 

int BackGound[]={
0,
BACKGROUND_BLUE,
BACKGROUND_GREEN,
BACKGROUND_GREEN | BACKGROUND_BLUE,
BACKGROUND_RED,
BACKGROUND_RED | BACKGROUND_BLUE,
BACKGROUND_RED | BACKGROUND_GREEN,
BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE,
BACKGROUND_INTENSITY,
BACKGROUND_INTENSITY | BACKGROUND_BLUE,
BACKGROUND_INTENSITY | BACKGROUND_GREEN,
BACKGROUND_INTENSITY | BACKGROUND_GREEN | BACKGROUND_BLUE,
BACKGROUND_INTENSITY | BACKGROUND_RED,
BACKGROUND_INTENSITY | BACKGROUND_RED | BACKGROUND_BLUE,
BACKGROUND_INTENSITY | BACKGROUND_RED | BACKGROUND_GREEN,
BACKGROUND_INTENSITY | BACKGROUND_RED | BACKGROUND_GREEN | BACKGROUND_BLUE
  };
    
int Last_foreg = FOREGROUND_INTENSITY | FOREGROUND_RED | FOREGROUND_GREEN | FOREGROUND_BLUE;
int Last_backg = 0;



void t_setforeground(int color){	
	 Last_foreg = ForeGound[color];
	 SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),ForeGound[color] | Last_backg);
}

//set title for terminal
void t_settitle(const char* title){
	SetConsoleTitle(title);
}
//terminal volta ao padrao;
void t_setdefault(){
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
}

void t_setbackground(int color){	
	 Last_backg = BackGound[color];
	 SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),BackGound[color] | Last_foreg);
}



void t_cls()
{
   HANDLE hConsole;
   hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
   
   COORD coordScreen = { 0, 0 };    // home for the cursor 
   DWORD cCharsWritten;
   CONSOLE_SCREEN_BUFFER_INFO csbi; 
   DWORD dwConSize;

// Get the number of character cells in the current buffer. 

   if( !GetConsoleScreenBufferInfo( hConsole, &csbi ))
   {
      return;
   }

   dwConSize = csbi.dwSize.X * csbi.dwSize.Y;

   // Fill the entire screen with blanks.

   if( !FillConsoleOutputCharacter( hConsole,        // Handle to console screen buffer 
                                    (TCHAR) ' ',     // Character to write to the buffer
                                    dwConSize,       // Number of cells to write 
                                    coordScreen,     // Coordinates of first cell 
                                    &cCharsWritten ))// Receive number of characters written
   {
      return;
   }

   // Get the current text attribute.

   if( !GetConsoleScreenBufferInfo( hConsole, &csbi ))
   {
      return;
   }

   // Set the buffer's attributes accordingly.

   if( !FillConsoleOutputAttribute( hConsole,         // Handle to console screen buffer 
                                    csbi.wAttributes, // Character attributes to use
                                    dwConSize,        // Number of cells to set attribute 
                                    coordScreen,      // Coordinates of first cell 
                                    &cCharsWritten )) // Receive number of characters written
   {
      return;
   }

   // Put the cursor at its home coordinates.

   SetConsoleCursorPosition( hConsole, coordScreen );
}



void t_gotoxy(int x, int y)
{
  COORD coord;
  coord.X = y;
  coord.Y = x;
  SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}


int t_kbhit() /*testa tecla*/
{ return _kbhit();}

int t_getch() //obtem a tecla digitada sem precisar pressionar enter:
{
   int c=0;
	while(1){
	  if(_kbhit()){
	     c = _getch();
	     break;
	  }	    
    }
    return c;   
}

int t_getche() //o mesmo que a anterior, mas imprime a tecla no terminal:
{
   int c=0;
	while(1){
	  if(_kbhit()){
	     c = _getche();
	     break;
	  }	    
    }
    return c;
}


void t_getsize(int*lines,int*cols){ /*windows.h*/
	CONSOLE_SCREEN_BUFFER_INFO csbi;
    GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &csbi);
    *cols = csbi.srWindow.Right - csbi.srWindow.Left + 1;
    *lines = csbi.srWindow.Bottom - csbi.srWindow.Top + 1;
}
