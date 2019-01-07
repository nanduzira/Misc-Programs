%{
#include<stdio.h>
#include<string.h>
	int max = 0;
	char strMax[15] = "";
%}

letter	[a-zA-Z]
digit	[0-9]

%%
"#include<"{letter}+".h>"			;
"if"|"else"|"main"|"void"|"int"		;
"//"({letter}|{digit}|" ")*			;
"/*"({letter}|{digit}|" "|\n)*"*/"	;
{letter}({letter}|{digit})*			{	if(yyleng > max) {
											max = yyleng;
											strcpy(strMax, yytext);
										}
									}
.									;
\n									;
%%

main() {
	yyin = fopen("id.c","r");
	yylex();
	printf("\nTHE LARGEST IDENTIFIER IS : %s\n", strMax);
}

int yywrap() {
	return 1;
}
