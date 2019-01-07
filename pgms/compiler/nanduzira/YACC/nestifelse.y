%{
#include "lex.yy.c"
int count = 0;
%}

%token IF ID NUM ELSE RELOP LB RB INSU AOP SP

%%
stmt: S'\n'{printf("VALID STRING WITH NESTED IF LEVEL :%d\n", count);
					return 0;}
S: if_stmt SP else_stmt	{ count++; }
	|if_stmt { count++; }
if_stmt: IF LB cond RB SP sel
cond: ide RELOP ide
else_stmt: ELSE SP sel
sel: '{'S'}'|exp
exp: ide AOP ide AOP ide';'|INSU ide';'|ide INSU';'
ide: ID | NUM;
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
