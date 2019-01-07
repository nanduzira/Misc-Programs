%{
#include "lex.yy.c"
%}

%token ID NUM US

%%
stmt: s'\n'{printf("VALID IDENTIFIER\n");
					return 0;}
s: ID r|US r|ID
r: ID r|NUM r|US r|ID|NUM|US;
%%
main() 
{
	printf("ENTER THE STRING : ");
	yyparse();
}

int yyerror(char *s) {
	printf("INVALID IDENTIFIER\n");
	return 0;
}
