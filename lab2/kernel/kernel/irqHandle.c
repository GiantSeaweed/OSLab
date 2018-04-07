#include "x86.h"
#include "device.h"

#define SYS_write 4

void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */

	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
	}
}

void sys_write(struct TrapFrame *tf) {
	asm volatile("movl %0, %%eax":: "r"(KSEL(SEG_VIDEO)));
	asm volatile("movw %ax, %gs");
	static int row = 5, col = 0; 
	char c = '\0';
	// ebx:file-descriptor, ecx:str, edx:len
	int fDesc = tf->ebx, str = tf->ecx, len = tf->edx;
	if (fDesc == 1 || fDesc == 2) { // stdout & stderr
		for(int i = 0; i < len; i++) {
			c = *(char *)(str + i);
			putChar(c);
			if (c == '\n') {
				row++; col = 0;
				continue;
			}
			if (col == 80) {
				row++; col = 0;
			}
			video_print(row, col++, c);
		}
		tf->eax = len; // return value
	}
	else { // other file descriptor
		assert(0);
	}
}
void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	switch(tf->eax){
		case SYS_write: sys_write(tf); break;
		/* To do more syscall */
		default: assert(0);
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}
