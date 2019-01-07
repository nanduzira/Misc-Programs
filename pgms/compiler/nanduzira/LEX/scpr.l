%{
#include<stdio.h>
int scount = 0, pcount = 0;
%}

%%
"scanf"		{	scount++;
				fprintf(yyout, "%s", "readf");
			}
"printf"	{	pcount++;
				fprintf(yyout, "%s", "writef");
			}
.			fprintf(yyout, "%s", yytext);
%%

main() {
	yyin = fopen("in.c","r");
	yyout = fopen("in.c","r+");
	yylex();
	printf("\nSCANF COUNT :%d \nPRINTF COUNT :%d\n", scount, pcount);
}

int yywrap() {
	return 1;
}
