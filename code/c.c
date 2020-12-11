#include<stdio.h>
#include<setjmp.h>
#include<stdio.h>
#include<unistd.h>
static jmp_buf B;
static int A;
static void f2(void);
static void f1(int i,int j,int k,int l)
{
	printf("in f1():\n");
	printf("globval=%d,autoval=%d,regival=%d,"
			"volaval=%d,statval=%d\n",A,i,j,k,l);
	f2();
}
static void f2(void)
{
	longjmp(B,1);
}
int main(void)
{
	int a;
	register int b;
	volatile int c;
	static int d;
	A=1; a=2;b=3;c=4;d=5;
	if(setjmp(B)!=0){
		printf("after longjmp:\n");
		printf("globval=%d,autoval=%d,regival=%d,"
				"volaval=%d,statval=%d\n",
				A,a,b,c,d);
		return 0;
	}
	A=95;a=96;b=97;c=98;d=99;
	f1(a,b,c,d);
	return 0;
}
