
#include "x86.h"
#include "device.h"

//void irqHandle(struct TrapFrame *tf);
void GProtectFaultHandle(struct TrapFrame *tf);
void timerInterruptHandle(struct TrapFrame *tf);
void syscallHandle(struct TrapFrame *tf);

void sys_exit(struct TrapFrame *tf);
void sys_fork(struct TrapFrame *tf);
void sys_write(struct TrapFrame *tf);
void sys_sleep(struct TrapFrame *tf);

#define SYS_exit 1
#define SYS_fork 2
#define SYS_write 4
#define SYS_sleep 162 //self defined

//int i = 0;
void irqHandle(struct TrapFrame *tf)
{
	/*
	 * 中断处理程序
	 */

	/* Reassign segment register */
	asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_KDATA)));
	asm volatile("movw %ax, %ds");
	asm volatile("movw %ax, %fs");
	asm volatile("movw %ax, %es");
	asm volatile("movl %0, %%eax" ::"r"(KSEL(SEG_VIDEO)));
	asm volatile("movw %ax, %gs");

	//video_print(i,0, (uint8_t)(tf->irq>>24)+'0');
	//video_print(i, 1, (uint8_t)((tf->irq >> 16)&0xff)+'0');
	//video_print(i, 2, (uint8_t)((tf->irq >> 24)&0xff)+'0');
	
	//video_print(i, 33, (tf->irq) / 16 + '0');
	//video_print(i, 34, (tf->irq) % 16 + '0');
	
	//i = (i + 1) % 20;
	switch (tf->irq)
	{
	case -1:
		break;
	case 0xd:
		GProtectFaultHandle(tf);
		break;
	case 0x20:
		timerInterruptHandle(tf);
		break;
	case 0x80:
		syscallHandle(tf);
		break;
	default:
		assert(0);
	}
}

void sys_write(struct TrapFrame *tf)
{
	asm volatile("movl %0, %%eax":: "r"(KSEL(SEG_VIDEO)));
	asm volatile("movw %ax, %gs");
	static int row = 7, col = 0; 
	char c = '\0';
	// ebx:file-descriptor, ecx:str, edx:len
	int fDesc = tf->ebx;
	int str = tf->ecx + ((pcb_current - pcb) * USER_MEMSIZE);
	int len = tf->edx;
	if (fDesc == 1 || fDesc == 2) { // stdout & stderr
		for(int i = 0; i < len; i++) {
			c = *(char *)(str + i);
			putChar(c);				//print to Debian terminal
			if (c == '\n') {
				row++; col = 0;
				continue;
			}
			if (col == 80) {
				row++; col = 0;
			}
			video_print(row, col++, c);//print to QEMU
		}
		tf->eax = len; // return value
	}
	else { // other file descriptor
		assert(0);
	}
}

void sys_exit(struct TrapFrame *tf)
{
	pcb_current->state = DEAD;
	pcb_available->next = pcb_current;
	pcb_current = NULL;
	schedule();
}

void sys_fork(struct TrapFrame *tf)
{

	struct ProcessTable *p = newPCB();
	int dst = USER_BASE + (p - pcb) * USER_MEMSIZE;
	int src = USER_BASE + (pcb_current - pcb) * USER_MEMSIZE;

	/*** copy the memory ***/
	for (int i = 0; i < USER_MEMSIZE; i++){
		*((char *)dst + i) = *((char *)src + i);
	}

	/*** copy the kernel stack ***/
	for (int i = 0; i < MAX_STACK_SIZE; i++){
		p->stack[i] = pcb_current->stack[i];
	}

	p->tf.eax = 0;				  //child process
	pcb_current->tf.eax = p->pid; //father process

	schedule();
}

void sys_sleep(struct TrapFrame *tf)
{
	pcb_current->state = BLOCKED;
	pcb_current->sleepTime = tf->ebx; //sleep time
	schedule();
}

void syscallHandle(struct TrapFrame *tf)
{
	/* 实现系统调用*/
	switch (tf->eax)
	{
	case SYS_exit:
		sys_exit(tf);
		break;
	case SYS_write:
		sys_write(tf);
		break;
	case SYS_fork:
		sys_fork(tf);
		break;
	case SYS_sleep:
		sys_sleep(tf);
		break;
	/* To do more syscall */
	default:
		assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf)
{
	assert(0);
	return;
}

void timerInterruptHandle(struct TrapFrame *tf)
{
	struct ProcessTable *p = pcb_header;
	while (p != NULL)
	{
		if (p->state==BLOCKED && p->sleepTime > 0){
			p->sleepTime -=1 ;
			if (p->sleepTime == 0){
				p->state = RUNABLE;
			}
		}
		p = p->next;
	}

	if(pcb_current!=NULL){
		pcb_current->timeCount -= 1;
		if (pcb_current->timeCount == 0)
		{
			pcb_current->state = RUNABLE;
			pcb_current->timeCount = TIMESLICE;
		}
	}
	schedule();

}
