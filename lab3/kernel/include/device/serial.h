#ifndef __SERIAL_H__
#define __SERIAL_H__

void initSerial(void);
void putChar(char);
void video_print(int row, int col, char c);
void video_print2(int row, int col, char c);

void init_vga(); // clear screen

#define SERIAL_PORT  0x3F8

#endif
