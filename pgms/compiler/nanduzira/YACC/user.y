%{
#include "lex.yy.c"
%}
%token DT OP CP NL SC NUM ID RELOP OPE SP OB CB
%%
s:ST NL{printf("valid function");exit(0);}
;
ST:DT SP ID OP G CP NL OB NL F SC NL CB
;
G:DT SP ID |DT SP ID ',' G
;
F: ID RELOP ID RELOP NUM|ID RELOP ID RELOP ID|ID RELOP ID OPE NUM|ID RELOP ID OPE ID
;
%%
int yyerror(char *a)
{
	printf("invalid function");
}
main()
{
	printf("Enter input");
	yyparse();
}
