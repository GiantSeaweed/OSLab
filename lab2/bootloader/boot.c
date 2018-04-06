#include "boot.h"

#define SECTSIZE 512

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	void (*elf)(void);
	// loading sector 1-200 to memory (kMain.elf)
	for(int i=0;i<200;i++){
		readSect((void*)(0x100000+i*SECTSIZE),1);
	}
	readSect((void*)(0x100000+200*SECTSIZE),1);//(uMain.elf)
	elf=(void*)0x100000;
	elf();
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
	int i;
	waitDisk();
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}
