%{
#include "lex.yy.c"
%}

%token IF ID NUM ELSE RELOP LB RB INSU AOP SP

%%
stmt: S'\n'{printf("VALID STRING\n");
					return 0;}
S: if_stmt SP else_stmt|if_stmt
if_stmt: IF LB cond RB SP exp
cond: ide RELOP ide
else_stmt: ELSE SP exp
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
