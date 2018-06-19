#ifndef __X86_PCB_H__
#define __X86_PCB_H__

#include <common.h>
#include "memory.h"

#define MAX_STACK_SIZE (1 << 10)  // kernel stack size (16KB)

#define USER_MEMSIZE (1 << 12)
#define USER_BASE 0X200000

#define MAX_PCB_NUM 30  // PCB size

#define TIMESLICE 10
                    
#define PID_START 1000

#define IDLE_STACK 0x200000

// process state
enum { BLOCKED, DEAD, RUNNING, RUNABLE };



struct ProcessTable {
    union {
        uint8_t stack[MAX_STACK_SIZE];  // kernel stack
        struct {
            uint8_t pad[MAX_STACK_SIZE - sizeof(struct TrapFrame)];
            struct TrapFrame tf;
        };
    };
    int state;
    int timeCount;
    int sleepTime;
    uint32_t pid;
    struct Semaphore    *semaphore;
    struct ProcessTable *next;
};

struct ProcessTable pcb[MAX_PCB_NUM];

struct ProcessTable * pcb_header;  // allocated pcb list head
struct ProcessTable * pcb_available;  // free pcb list head
struct ProcessTable * pcb_current;   // current runnning process

//#define NR_PCB(p) (p - pcb)

void initPCB();
void enterMainprocess(uint32_t entry);
void schedule();
struct ProcessTable * newPCB();
struct ProcessTable *findRunable();
void moveCurProToTail();
#endif
