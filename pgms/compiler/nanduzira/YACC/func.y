%{
#include "lex.yy.c"
%}

%token TYPE ID NUM LB RB INSU AOP SP SC EQ

%%
stmt: S'\n'{printf("VALID FUNCTION\n");
					return 0;}
S: TYPE SP ID LB arg RB SP '{'exp SC'}'
arg: TYPE SP ID','SP arg|TYPE SP ID
exp: ide EQ ide AOP ide|INSU ide|ide INSU
ide: ID|NUM;
%%
main() 
{
	printf("ENTER THE STRING : ");
	yyparse();
}

int yyerror(char *s) {
	printf("error\n");
	return 0;
}
