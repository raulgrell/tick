#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>  //termios, TCSANOW, ECHO, ICANON
#include <unistd.h>  
#include <fcntl.h>
#include <sys/ioctl.h>

#ifndef _NO_READLINE
#include <readline/readline.h>
#include <readline/history.h>
#endif

typedef enum {tNormal=0,tBold,tUnderLine=4} tForegMode;
typedef enum { 
	tBlack = 30,tRed,tGreen,
	tYellow,tBlue,tMagenta,tCyan,tGray,tDefault=39,
	tLightRed = tRed+60,tLightGreen,tLightYellow,tLightBlue,tLightMagenta,tLightCyan,tWhite,
	tLightGray = tGray
	}tColor;

//set foreground color:  mode:Normal|Bold|UnderLine; color: Black, Red etc.
void t_setforeground(tColor color){
	fprintf(stdout,"\033[%dm",color);
	
}
//set title for terminal
void t_settitle(const char* title){
	fprintf(stdout, "\033]0;%s\007",title);	
}
//reset defaut color
void t_setdefault(void){ fprintf(stdout, "\033[0m"); }

void t_setbackground(tColor color){
	fprintf(stdout,"\033[%dm",color + 10);
}

void t_cls(){//clear the terminal screen
	t_setdefault();
	fprintf(stdout,"\e[1;1H\e[2J");
}

void t_gotoxy(int x,int y){ //set cursor position x,y
 fprintf(stdout,"\033[%d;%dH",x,y);
}

int t_kbhit() /*testa tecla para linux*/
{
  struct termios oldt, newt;
  int ch;
  int oldf;
 
  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
  fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);
 
  ch = getchar();
 
  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  fcntl(STDIN_FILENO, F_SETFL, oldf);
 
  if(ch != EOF)
  {
    ungetc(ch, stdin);
    return 1;
  }
 
  return 0;
}

/* reads from keypress, doesn't echo */

int t_getch()
{
    struct termios oldattr, newattr;
    int ch;
    tcgetattr( STDIN_FILENO, &oldattr );
    newattr = oldattr;
    newattr.c_lflag &= ~(ICANON | ECHO ); 
    tcsetattr( STDIN_FILENO, TCSANOW, &newattr );
    ch = getchar();
    tcsetattr( STDIN_FILENO, TCSANOW, &oldattr );
    return ch;
}


int t_getche()
{
    struct termios oldattr, newattr;
    int ch;
    tcgetattr( STDIN_FILENO, &oldattr );
    newattr = oldattr;
    newattr.c_lflag &= ~(ICANON);
    tcsetattr( STDIN_FILENO, TCSANOW, &newattr );
    ch = getchar();
    tcsetattr( STDIN_FILENO, TCSANOW, &oldattr );
    return ch;
}

#ifndef _NO_READLINE

char *t_readline(const char *str){	
   char *ret = NULL;
   ret = readline(str);
   return ret; //need free ret after
}

void t_add_history(const char *str){
	add_history(str);
}

#endif

void t_getsize(int*lines,int*cols){
    *cols = 80;
    *lines = 24;
#ifdef TIOCGSIZE
    struct ttysize ts;
    ioctl(STDIN_FILENO, TIOCGSIZE, &ts);
    *cols = ts.ts_cols;
    *lines = ts.ts_lines;
#elif defined(TIOCGWINSZ)
    struct winsize ts;
    ioctl(STDIN_FILENO, TIOCGWINSZ, &ts);
    *cols = ts.ws_col;
    *lines = ts.ws_row;
#endif /* TIOCGSIZE */
}


