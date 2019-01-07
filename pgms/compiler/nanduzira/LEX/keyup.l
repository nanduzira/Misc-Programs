%{
#include<stdio.h>
	int i = 0;
%}

%%
"if"|"else"|"main"|"void"|"int"		{	for(i = 0; yytext[i] != '\0'; i++)
											yytext[i] -= 32;
										fprintf(yyout, "%s", yytext);
									}
.									{	fprintf(yyout, "%s", yytext); }
%%

main() {
	yyin = fopen("key.c","r");
	yyout = fopen("key_new.c","w");
	yylex();
}

int yywrap() {
	return 1;
}
