%{
#include<stdio.h>
int cCount = 0, wCount = 0, sCount = 0, lCount = 0, seCount = 0;
%}

%%
[a-zA-Z]+	{
			wCount++;
			cCount += yyleng;
		}
[ \t]		sCount++;
[.]		seCount++;
\n		lCount++;
.		;
%%

main() {
	yyin = fopen("count.txt", "r");
	yylex();
	printf("CHARACTER :%d \nWORD :%d \nSPACE :%d \nSENTENCE :%d\nLINE :%d\n", cCount, wCount, sCount, seCount, lCount);
}

int yywrap() {
	return 1;
}
