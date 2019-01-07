%{
#include<stdio.h>
int pre = 0, key = 0, id = 0, op = 0, num = 0, sep = 0, com = 0;
%}

letter	[a-zA-Z]
digit	[0-9]

%%
"#include<"{letter}+".h>"			{	pre++;
										fprintf(yyout, "%s", yytext);
									}
"if"|"else"|"main"|"void"|"int"		{	key++;
										fprintf(yyout, "%s", yytext);
									}
{letter}({letter}|{digit})*			{	id++;
										fprintf(yyout, "%s", yytext);
									}
"//"({letter}|{digit}|" ")*			com++;
"/*"({letter}|{digit}|" "|\n)*"*/"	com++;
["+"-"*"/<>="!"]+					{	op++;
										fprintf(yyout, "%s", yytext);
									}
{digit}+|({digit}*"."{digit}*)		{	num++;
										fprintf(yyout, "%s", yytext);
									}
[\{\}\[\]\(\)""'';,]				{	sep++;
										fprintf(yyout, "%s", yytext);
									}
.									{	fprintf(yyout, "%s", yytext); }
%%

main() {
	yyin = fopen("token.c","r");
	yyout = fopen("token_new.c","w");
	yylex();
	printf("\nPREPROCESSORS :%d \nKEYWORDS :%d \nIDENTIFIERS :%d \nOPERATORS :%d \nNUMBERS :%d \nSEPERATORS :%d \nCOMMENTS :%d\n", pre, key, id, op, num, sep, com);
}

int yywrap() {
	return 1;
}
