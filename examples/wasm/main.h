#ifndef MAIN_H
#define MAIN_H


#ifdef __cplusplus
#define MAIN_EXTERN_C extern "C"
#else
#define MAIN_EXTERN_C
#endif

#if defined(_WIN32)
#define MAIN_EXPORT MAIN_EXTERN_C __declspec(dllimport)
#else
#define MAIN_EXPORT MAIN_EXTERN_C __attribute__((visibility ("default")))
#endif

MAIN_EXPORT void onInit(void);
MAIN_EXPORT void onAnimationFrame(int timestamp);

#endif
