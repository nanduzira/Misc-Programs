%{
#include "lex.yy.c"
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
S :E '\n'	{
			printf("RESULT = %d\n", $1);
			return 0;
		}
E :E '+' E {$$ = $1 + $3;}
	| E '-' E {$$ = $1 - $3;}
	| E '*' E {$$ = $1 * $3;}
	| E '/' E {
			if($3 == 0) {
				printf("CANNNOT DIVIDE BY '0'");
				return 0;
			} else
				$$ = $1 / $3;
		}
	| '(' E ')' {$$ = $2;}
	| NUM { $$ = $1;};
%%

main() {
	printf("ENTER THE EXPRESSION : ");
	yyparse();
}

int yyerror(char *s) {
	printf("STRING IS NOT VALID\n");
	return 0;
}
