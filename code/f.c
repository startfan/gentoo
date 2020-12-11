#include<stdio.h>
int ab(int a,int b)
{
	if(a==0)return 1;
	printf("a=%d,b=%d\n",a,b);
	if(a==1)return b;
	printf("~%d\n",b);
	ab(a-1,a*b);
}
int main(void)
{
	printf("@%d\n",ab(4,1));
	return 0;
}
