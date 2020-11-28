#include<stdio.h>//找出多余的配置项
#include<string.h>
int main(int argc,char** argv)
{
	FILE* a;FILE* b;FILE* c;char d[50];
	char e[50];
	if(argc!=4)puts("3,Find the excess configuration items");
	if((a=fopen(argv[1],"r"))==NULL||(b=fopen(argv[2],"r"))==NULL||(c=fopen(argv[3],"w"))==NULL)
		puts("open error");
a:	while(fgets(d,50,a)!=NULL){
		rewind(b);//重头读b文件
		while(fgets(e,50,b)!=NULL){
			if(strcmp(d,e)==0)goto a;//找到相同内容就读a文件的下一行，否则就读b文件的下一行
		}
		fputs(d,c);	
//如果把a文件的其中一行与b文件的每行内容做比较都没有发现相同内容就把它写入c文件
        }
	fclose(a);
	fclose(b);
	fclose(c);
	return 0;
}




