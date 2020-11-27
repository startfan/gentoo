#include<stdio.h>//消除多余换行符，只保留配置名称
int main(int argc,char* argv[])
{
	FILE* a;
	FILE* e;
	int d,b;
	int c=0;
	if(argc<4)puts("Eliminate Config redundant newline characters, leaving only the configuration name.");
	if((a=fopen(argv[1],"r"))==NULL){
		puts("read error");
		return 1;
	};
	if((e=fopen(argv[2],"w"))==NULL){
		puts("write error");
		return 2;
	};
	fseek(a,0,SEEK_END);
	b=ftell(a);
	rewind(a);
	do
		{
			d=fgetc(a);
			if(d!='\n')c=0;
			else c++;
			if(feof(a))break;
			if(d>='A'&&d<='Z'||d=='_'||d=='\n'){
				if(c>1)continue;
				fputc(d,e);
			}
		}while(1);
	fclose(a);
	fclose(e);
	return 0;
}
