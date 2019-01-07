%{
#include"lex.yy.c"
%}

%token ADD SUB MUL DIV NUM
%left ADD SUB
%left MUL DIV

%%
S : E '\n'	{
				printf("STRING IS VALID\n");
				return 0;
			}
E : E ADD E | E SUB E | E MUL E | E DIV E |'(' E ')' | NUM	;
%%

main() {
	printf("ENTER THE STRING : ");
	yyparse();
}

int yyerror(char *s) {
	printf("STRING IS NOT VALID\n");
	return 0;
}
