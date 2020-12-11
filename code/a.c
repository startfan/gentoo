#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<sys/wait.h>
int a=6;
char buf[]="a write to stdout\n";
int main(void)
{
	int b;
	pid_t c;
	b=88;
	if(write(STDOUT_FILENO,buf,sizeof(buf)-1)!=sizeof(buf)-1)
			puts("write error");
			printf("before fork\n");
			if((c=fork())<0){
				puts("fork error");
			}else if(c==0){
				a++;
				b++;
				exit(0);
			}else{
				sleep(2);
			}
			printf("pid=%ld,glob=%d,var=%d\n",(long)getpid(),a,b);
			printf("hello\n");
	return 0;
}
