%{
#include "lex.yy.c"
%}

%token FOR DO WHILE ID NUM RELOP LB RB INSU AOP SP SC EQ

%%
stmt: S'\n'{printf("VALID LOOP\n");
					return 0;}
S: for|while|do
for: FOR SP LB init SC SP rel SC SP inc RB SP '{'exp SC'}'
while: WHILE LB rel RB SP '{'exp SC'}'
do: DO SP '{'exp SC'}' SP WHILE LB rel RB SC
init: ide EQ ide
rel: ide RELOP ide
inc: INSU ide|ide INSU
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
