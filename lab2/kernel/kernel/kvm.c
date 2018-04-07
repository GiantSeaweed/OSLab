#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
TSS tss;

#define SECTSIZE 512
uint32_t loader(char* buf);

void waitDisk(void) {
	while((inByte(0x1F7) & 0xC0) != 0x40); 
}

void readSect(void *dst, int offset) {
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

void initSeg() {
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	gdt[SEG_VIDEO] = SEG(STA_W,  0x0b8000,       0xffffffff, DPL_KERN);
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	/*设置正确的段寄存器*/
	tss.ss0 = KSEL(SEG_KDATA);
	tss.esp0 = 0x200000;//set kernel esp0; where app(user) starts

	lLdt(0);
	
}

void enterUserSpace(uint32_t entry) {
	/*
	 * Before enter user space 
	 * you should set the right segment registers here
	 * and use 'iret' to jump to ring3
	 */
	asm volatile("push %0"::"r"(USEL(SEG_UDATA)));//%ss
	asm volatile("push %0"::"i"(128<<20));	  //%esp 128M
	asm volatile("pushfl");					  //push eflags
	asm volatile("push %0"::"r"(USEL(SEG_UCODE)));//%cs			
	asm volatile("push %0"::"r"(entry));	  //%eip
	
	asm volatile("iret");
}

void loadUMain(void) {

	/*加载用户程序至内存*/
	char* buf = (char*)0x500000;
	for(int i=0;i<100;i++){
		readSect((void*)(buf+i*512),i+201);
	}

	struct ELFHeader *elf =(struct ELFHeader*)buf;
	uint32_t entry = loader((char*)elf);
	enterUserSpace(entry);

	
}

uint32_t loader(char* buf){
	struct ELFHeader *elf = (struct ELFHeader*) buf;
	struct ProgramHeader *ph,*eph;
	
	ph = (struct ProgramHeader *)((char*)elf + elf->phoff);
	eph = ph + elf->phnum;
	for(; ph < eph; ph++){
		if(ph->type == 1){	//PT_LOAD
			
			for(int i=0; i< ph->filesz; i++)
				*((char*)ph->vaddr+i)=*((char*)buf+ph->off+i);

			if(ph->filesz < ph->memsz){
				for(int i= ph->filesz; i<ph->memsz; i++)
					*((char*)ph->vaddr+i) = 0;
			}
			
		}
	}
	uint32_t entry = elf->entry;
	return entry;
}

