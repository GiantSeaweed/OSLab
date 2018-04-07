#include "lib.h"
#include "types.h"
#include <stdarg.h>
/*
 * io lib here
 * 库函数写在这
 */
#define SYS_write 4
#define STDOUT 1

int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
	int32_t ret = 0;

	// 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器
	
	asm volatile("int $0x80"
				 :"=a"(ret)
				 :"a"(num),"b"(a1),"c"(a2),"d"(a3),"S"(a4),"D"(a5)
				);//eax ebx ecx edx esi edi
		
	return ret;
}
/* print a char */
void printc(char c) {
    syscall(SYS_write, 1, (uint32_t)&c, 1,0,0);
    return;
}

/* print string */
void prints(const char* str) {
    int strlen = 0;
    while (str[strlen] != '\0')
        strlen++;
    syscall(SYS_write, 1, (uint32_t)str, strlen,0,0);
}

/* print decimal */
void printd(int d) {
    char buf[100];
    int strlen = 0;
    if (d == 0) {
        prints("0");
        return;
    }
    if (d == 0x80000000) {
        prints("-2147483648");
        return;
    }
    if (d < 0) {
        prints("-");
        d = -d;
    }
    while (d) {
        buf[strlen++] = d % 10 + '0';
        d /= 10;
    }
    for (int i = 0, j = strlen - 1; i < j; i++, j--) {
        char tmp = buf[i];
        buf[i] = buf[j];
        buf[j] = tmp;
    }
	buf[strlen] = '\0';
	prints(buf);
}

/* print hexadecimal */
void printx(unsigned int d) {
    char buf[100];
    int strlen = 0;
    if (d == 0) {
        prints("0");
        return;
    }
    while (d) {
        if (d % 16 >= 10) {
            buf[strlen] = d % 16 - 10 + 'a';
        }
        else {
            buf[strlen] = d % 16 + '0';
        }
        d /= 16;
        strlen++;
    }
    for (int i = 0, j = strlen - 1; i < j; i++, j--) {
        char tmp = buf[i];
        buf[i] = buf[j];
        buf[j] = tmp;
    }
	buf[strlen] = '\0';
	prints(buf);
}

void printf(const char *format,...){
	va_list ap;
	va_start(ap,format);
	char token;

	if(format == 0)
		return;

	while(*format != '\0'){
		if(*format == '%'){
			format++;//%d %c %x etc have two bytes
			token = *format;
			switch(token){
				case 'd': printd(va_arg(ap, int));break;
				case 'x': printx(va_arg(ap, int));break;
				case 'c': printc(va_arg(ap, int));break;//‘char’ is promoted to ‘int’ when passed
 				case 's': prints(va_arg(ap, char*));break;//through ‘...’ 
				default:break;
			}
		}
		else{
			printc(*format);
		}
		format++;
	}

	va_end(ap);
}
