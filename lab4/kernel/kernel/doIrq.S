.code32

#-----|----entry---|-errorcode-|-----id-----|---handler---|
.global vec0;  vec0:  pushl $0;  pushl  $0;  jmp asmDoIrq
.global vec1;  vec1:  pushl $0;  pushl  $1;  jmp asmDoIrq
.global vec2;  vec2:  pushl $0;  pushl  $2;  jmp asmDoIrq
.global vec3;  vec3:  pushl $0;  pushl  $3;  jmp asmDoIrq
.global vec4;  vec4:  pushl $0;  pushl  $4;  jmp asmDoIrq
.global vec5;  vec5:  pushl $0;  pushl  $5;  jmp asmDoIrq
.global vec6;  vec6:  pushl $0;  pushl  $6;  jmp asmDoIrq
.global vec7;  vec7:  pushl $0;  pushl  $7;  jmp asmDoIrq
.global vec8;  vec8:             pushl  $8;  jmp asmDoIrq
.global vec9;  vec9:  pushl $0;  pushl  $9;  jmp asmDoIrq
.global vec10; vec10: 			 pushl $10;  jmp asmDoIrq
.global vec11; vec11: 			 pushl $11;  jmp asmDoIrq
.global vec12; vec12: 			 pushl $12;  jmp asmDoIrq
.global vec13; vec13: 			 pushl $13;  jmp asmDoIrq
.global vec14; vec14: 			 pushl $14;  jmp asmDoIrq

.global irqEmpty
irqEmpty:
	pushl $0 // push dummy error code
	pushl $-1 // push interrupt vector into kernel
	jmp asmDoIrq

.global irqGProtectFault
irqGProtectFault:
	pushl $0xd
	jmp asmDoIrq

.global timerInterrupt
timerInterrupt:
	pushl $0 // push dummy error code
	pushl $0x20
	jmp asmDoIrq

.global irqSyscall
irqSyscall:
	pushl $0 // push dummy error code
	pushl $0x80 // push interrupt vector into kernel stack
	jmp asmDoIrq

.global asmDoIrq
asmDoIrq:
	pushal // push process state into kernel stack
	pushl %ds
	pushl %es
	pushl %fs
	pushl %gs
	pushl %esp
	call irqHandle
	addl $4, %esp
	popl %gs
	popl %fs
	popl %es
	popl %ds
	popal
	addl $4, %esp //interrupt vector is on top of kernel stack
	addl $4, %esp //error code is on top of kernel stack
	iret
