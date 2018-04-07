#include "boot.h"

#define SECTSIZE 512

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	
	char* buf = (char*)0x400000;
	// loading kMain.elf to memory 
	for(int i=0; i<200; i++){
		readSect((void*)(buf+i*SECTSIZE),i+1);
	}
	
	struct ELFHeader *elf = (struct ELFHeader*) buf;
	struct ProgramHeader *ph,*eph;
	
	ph = (struct ProgramHeader *)((char*)elf + elf->phoff);
	eph = ph + elf->phnum;
	for(; ph < eph; ph++){
		if(ph->type == 1){	//PT_LOAD
			// buf+ph->off: the offset of this section in the ELF file
			// ph->vaddr  : the vaddr of the first byte of this section		
			for(int i=0; i< ph->filesz; i++)
				*((char*)ph->vaddr+i) = *((char*)buf + ph->off + i);

			if(ph->filesz < ph->memsz){
				for(int i = ph->filesz; i < ph->memsz; i++)
					*((char*)ph->vaddr+i) = 0;
			}
			
		}
	}
	
	void (*entry)(void);
	entry = (void*)elf->entry;
	entry();
}/*
int loader(char* buf){
	struct ELFHeader *elf = (void*) buf;
	struct ProgramHeader *ph,*eph;
	
	ph = (void*)elf + elf->phoff;
	eph = ph + elf->phnum;
	for(; ph < eph; ph++){
		if(ph->type == 1){	//PT_LOAD
			
			for(int i=0; i< ph->filesz; i++)
				*((char*)ph->vaddr+i)=*((char*)ph->off+i);

			if(ph->filesz < ph->memsz){
				for(int i= ph->filesz; i<ph->memsz; i++)
					*((char*)ph->vaddr+i) = 0;
			}
			
		}
	}
	int entry = elf->entry;
	return entry;
}*/
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
