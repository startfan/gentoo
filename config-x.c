#include<stdio.h>//�������໻�з���ֻ������������
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
	b=ftell(a);//ȷ���ļ�����
	rewind(a);
	do
		{
			d=fgetc(a);
			if(d!='\n')c=0;//������'\n'�ַ�������'\n'����
			else c++;//����ַ�Ϊ��\n���ͼ���ȷ��'\n'����
			if(feof(a))break;
			if(d>='A'&&d<='Z'||d=='_'||d=='\n'){
				if(c>1)continue;//�������һ�����з���ֱ�Ӷ�ȡ�¸��ַ�
				fputc(d,e);
			}
		}while(1);
	fclose(a);
	fclose(e);
	return 0;
}
