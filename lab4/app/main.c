#include "lib.h"
#include "types.h"
/*
int data = 0;

int uEntry(void) {
	
	int ret =  fork();
	//ret = fork();
	int i = 3;
	if (ret == 0){
		
		data = 2;
        while( i != 0) {
            i --;
            printf("Child Process: Pong %d, %d;\n", data, i);
            sleep(1);
        }
        exit();
    }
    else if (ret != -1) {
        data = 1;
        while( i != 0) {
            i --;
            printf("Father Process: Ping %d, %d;\n", data, i);
            sleep(1);
        }
        exit();
    }
    while(1);
    return 0;
}*/

int uEntry(void){
	int i = 4;
	int ret = 0;
	int value = 2;
	sem_t sem;
	printf("Father Process: Semaphore Initializing.\n");
	ret = createSem(&sem, value);
	//printf("sem.value=%d ret=%d\n",sem.value,ret);
	
	if (ret == -1){
		printf("Father Process: Semaphore Initializing Failed.\n");
		exit();
	}

	ret = fork();
	if (ret == 0)
	{
		while (i != 0)
		{
			i--;
			printf("Child Process: Semaphore Waiting.\n");
			lockSem(&sem);
			printf("Child Process: In Critical Area.\n");
		}
		printf("Child Process: Semaphore Destroying.\n");
		destroySem(&sem);
		exit();
	}
	else if (ret != -1)
	{
		while (i != 0)
		{
			i--;
			printf("Father Process: Sleeping.\n");
			sleep(2);
			printf("Father Process: Semaphore Posting.\n");
			unlockSem(&sem);
		}
		printf("Father Process: Semaphore Destroying.\n");
		destroySem(&sem);
		exit();
	}
	// should not reach here
	return 0;
}

/*
int uEntry(void) {

	printf("printf test begin...\n");
	printf("the answer should be:\n");
	printf("#######################################################\n");
	printf("Hello, welcome to OSlab! I'm the body of the game. ");
	printf("Bootblock loads me to the memory position of 0x100000, and Makefile also tells me that I'm at the location of 0x100000. ");
	printf("~!@#/(^&*()_+`1234567890-=...... ");
	printf("Now I will test your printf: ");
	printf("1 + 1 = 2, 123 * 456 = 56088\n0, -1, -2147483648, -1412505855, -32768, 102030\n0, ffffffff, 80000000, abcdef01, ffff8000, 18e8e\n");
	printf("#######################################################\n");
	printf("your answer:\n");
	printf("=======================================================\n");
	printf("%s %s%scome %co%s", "Hello,", "", "wel", 't', " ");
	printf("%c%c%c%c%c! ", 'O', 'S', 'l', 'a', 'b');
	printf("I'm the %s of %s. %s 0x%x, %s 0x%x. ", "body", "the game", "Bootblock loads me to the memory position of", 0x100000, "and Makefile also tells me that I'm at the location of", 0x100000);
	printf("~!@#/(^&*()_+`1234567890-=...... ");
	printf("Now I will test your printf: ");
	printf("%d + %d = %d, %d * %d = %d\n", 1, 1, 1 + 1, 123, 456, 123 * 456);
	printf("%d, %d, %d, %d, %d, %d\n", 0, 0xffffffff, 0x80000000, 0xabcedf01, -32768, 102030);
	printf("%x, %x, %x, %x, %x, %x\n", 0, 0xffffffff, 0x80000000, 0xabcedf01, -32768, 102030);
	printf("=======================================================\n");
	printf("Test end!!! Good luck!!!\n");
	
	while(1);
	return 0;
}*/
