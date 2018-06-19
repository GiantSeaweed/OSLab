#ifndef __lib_h__
#define __lib_h__

void printf(const char *format,...);

#define SYS_exit 1
#define SYS_fork 2
#define SYS_write 4
#define SYS_sleep 162 //self defined

int fork();
void sleep(int time);
void exit();

#endif
