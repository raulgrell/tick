#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <X11/Xlib.h>
#include <X11/XKBlib.h>
#include <GL/glx.h>
#include <GL/glext.h>
#include <GL/glu.h>

Display                 *dpy;
Window                  root, win;
GLint                   att[]   = { GLX_RGBA, GLX_DEPTH_SIZE, 24, GLX_DOUBLEBUFFER, None };
XVisualInfo             *vi;
GLXContext              glc;
Colormap                cmap;
XSetWindowAttributes    swa;
XWindowAttributes       wa;
XEvent                  xev;


GLfloat                 rotation_matrix[16];

void ExposeFunc() {
    float  aspect_ratio;
    char   info_string[256];

    XGetWindowAttributes(dpy, win, &wa);
    glViewport(0, 0, wa.width, wa.height);
    aspect_ratio = (float)(wa.width) / (float)(wa.height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-2.50*aspect_ratio, 2.50*aspect_ratio, -2.50, 2.50, 1., 100.);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(10., 0., 0., 0., 0., 0., 0., 0., 1.);
    glMultMatrixf(rotation_matrix);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, (float)wa.width, 0, (float)wa.height, -1., 1.);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    glColor3f(1.0, 1.0, 1.0);

    glXSwapBuffers(dpy, win);
}

void CreateWindow() {
    if ((dpy = XOpenDisplay(NULL)) == NULL) {
        printf("\n\tcannot connect to x server\n\n");
        exit(0);
    }

    root = DefaultRootWindow(dpy);

    if ((vi = glXChooseVisual(dpy, 0, att)) == NULL) {
        printf("\n\tno matching visual\n\n");
        exit(0);
    }

    if ((cmap = XCreateColormap(dpy, root, vi->visual, AllocNone)) == 0) {
        printf("\n\tcannot create colormap\n\n");
        exit(0);
    }

    swa.event_mask = KeyPressMask;
    swa.colormap   = cmap;
    win = XCreateWindow(dpy, root, 0, 0, 700, 700, 0, vi->depth, InputOutput, vi->visual, CWColormap | CWEventMask, &swa);
    XStoreName(dpy, win, "OpenGL Animation");
    XMapWindow(dpy, win);
}

void SetupGL() {
    char           font_string[128];
    XFontStruct    *font_struct;
    if ((glc = glXCreateContext(dpy, vi, NULL, GL_TRUE)) == NULL) {
        printf("\n\tcannot create gl context\n\n");
        exit(0);
    }

    glXMakeCurrent(dpy, win, glc);
    glEnable(GL_DEPTH_TEST);
    glClearColor(0.00, 0.00, 0.40, 1.00);
    for(int font_size = 14; font_size < 32; font_size += 2) {
        sprintf(font_string, "-adobe-courier-*-r-normal--%i-*", font_size);
        font_struct = XLoadQueryFont(dpy, font_string);

        if (font_struct != NULL) {
            glXUseXFont(font_struct->fid, 32, 192, 32);
            break;
        }
    }
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glGetFloatv(GL_MODELVIEW_MATRIX, rotation_matrix);
}

void ExitProgram() {
    glXMakeCurrent(dpy, None, NULL);
    glXDestroyContext(dpy, glc);
    XDestroyWindow(dpy, win);
    XCloseDisplay(dpy);
    exit(0);
}

void CheckKeyboard() {
    if (XCheckWindowEvent(dpy, win, KeyPressMask, &xev)) {
        const key_string = XKeysymToString(XkbKeycodeToKeysym(dpy, xev.xkey.keycode, 0, 0));
        if (mem.eql(u8, key_string, "Escape")) {
            ExitProgram();
        }
    }
}

int main(int argc, char *argv[]){
    CreateWindow();
    SetupGL();

    while(true) {
        CheckKeyboard();
        ExposeFunc();
        usleep(1000);
    }
}
