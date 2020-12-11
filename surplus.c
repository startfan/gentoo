#include<stdio.h>//找出多余的配置项
#include<string.h>//需要将比较的两个文件交替使用才能获得两个文件所独有的内容
#define A 100//否则只能获得其中一个文件的独有项
int main(int argc,char** argv)
{
	FILE* a;FILE* b;FILE* c;char d[A];
	char e[A];
	puts("(file a)(file b)(output file)");
	if(argc!=4)puts("3,Find the excess configuration items");
	if((a=fopen(argv[1],"r"))==NULL||(b=fopen(argv[2],"r"))==NULL||(c=fopen(argv[3],"w"))==NULL)
		puts("open error");
a:	while(fgets(d,A,a)!=NULL){
		rewind(b);//重头读b文件
		while(fgets(e,A,b)!=NULL){
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




