#ifndef __lib_h__
#define __lib_h__

#include "types.h"

void printf(const char *format,...);

#define SYS_exit    1
#define SYS_fork    2
#define SYS_write   4
#define SYS_sleep   162 //self defined
#define SYS_createSem   6
#define SYS_destroySem  7
#define SYS_lockSem     8
#define SYS_unlockSem   9

int fork();
void sleep(int time);
void exit();

int createSem(sem_t *sem, int value);
int destroySem(sem_t *sem);
int lockSem(sem_t *sem);
int unlockSem(sem_t *sem);

#endif
