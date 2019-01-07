%{
#include"lex.yy.c"
%}

%token A B

%%
E : S '\n'	{
				printf("STRING IS VALID\n");
				return 0;
			}
S : A A B
	| A S	;
%%

main() {
	printf("ENTER THE STRING : ");
	yyparse();
}

int yyerror(char *s) {
	printf("STRING IS NOT VALID\n");
	return 0;
}
