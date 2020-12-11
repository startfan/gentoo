#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
int main(void)
{
    char* ch="adb shell input tap 381 687";
    char* cx="adb shell input tap 381 566";
	puts("hello");
    while(1)
    {
		puts("ssss");
		system(ch);
		usleep(200000);
		system(cx);
	}
   	printf("End!\n");
   	return 0;
}
