#include "x86.h"
#include "device.h"

void initSerial(void) {
	outByte(SERIAL_PORT + 1, 0x00);
	outByte(SERIAL_PORT + 3, 0x80);
	outByte(SERIAL_PORT + 0, 0x01);
	outByte(SERIAL_PORT + 1, 0x00);
	outByte(SERIAL_PORT + 3, 0x03);
	outByte(SERIAL_PORT + 2, 0xC7);
	outByte(SERIAL_PORT + 4, 0x0B);
}

static inline int serialIdle(void) {
	return (inByte(SERIAL_PORT + 5) & 0x20) != 0;
}

void putChar(char ch) {
	while (serialIdle() != TRUE);
	outByte(SERIAL_PORT, ch);
}

/* print to video segment */
void video_print(int row, int col, char c) {
	asm ("movl %0, %%edi;"			: :"r"(((80 * row + col) * 2))  :"%edi");
	asm ("movb %0, %%ah;"			: :"i"(0x0c) 				:"%eax");
	asm ("movb %0, %%al;"			: :"r"(c) 				    :"%eax"); // 0x0黑底,0xc红字, 字母ASCII码
	asm ("movw %%ax, %%gs:(%%edi);" : : 						:"%edi"); // 写入显存
}
