#include<stdio.h>//消除多余换行符，只保留配置名称
int main(int argc,char* argv[])
{
	FILE* a;
	FILE* e;
	int d,b;
	int c=0;
	puts("(file a)(output file)");
	if(argc!=3)puts("Eliminate Config redundant newline characters, leaving only the configuration name.");
	if((a=fopen(argv[1],"r"))==NULL){
		puts("read error");
		return 1;
	};
	if((e=fopen(argv[2],"w"))==NULL){
		puts("write error");
		return 2;
	};
	fseek(a,0,SEEK_END);
	b=ftell(a);//确定文件长度
	rewind(a);
	do
		{
			d=fgetc(a);
			if(d!='\n')c=0;//读到非'\n'字符就清零'\n'数量
			else c++;//如果字符为‘\n’就计数确定'\n'数量
			if(feof(a))break;
			if(d>='A'&&d<='Z'||d=='_'||d=='\n'){
				if(c>1)continue;//如果超过一个换行符就直接读取下个字符
				fputc(d,e);
			}
		}while(1);
	fclose(a);
	fclose(e);
	return 0;
}
