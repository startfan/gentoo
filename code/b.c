#include<unistd.h>
#include<stdio.h>
#include<string.h>
int main(void)
{
	FILE* b;
	char c[100];
	int d,e;
	puts("hello");
	while(1){
		if(execl("/bin/ping","ping","-c","3","192.168.1.1",(char*)0)<0)
		puts("error");
	}
	puts("hello");
	return 0;
}
