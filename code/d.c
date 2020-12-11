#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main(void)
{
	FILE* b;
	char c[100];
	int d,e;
	pid_t pid;
	if((b=fopen("/home/tracker","r"))==NULL){
		puts("无法打开tracker");
	};
	while(fgets(c,100,b)==c){
		fputs(c,stdout);
		d=strlen(c);
		e=d-1;
		if(c[e]='\n')
			c[e]='\0';
		if(pid=fork()==0){
			if(execl("/usr/bin/transmission-remote","transmission-remote",
						"-t","all","-td",c,(char*)0)<0)
			puts("error");
			exit(0);
		}
	};
	return 0;
}
