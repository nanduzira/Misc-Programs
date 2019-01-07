%{
#include<stdio.h>
	int flag = 0, op = 0;
	float res = 0, var = 0;
%}

%%
[0-9]+	{	var = atoi(yytext);
			if (flag == 0) {
				res = var;
				flag = 1;
			} else
				switch(op) {
					case 1 : res *= var;
						break;
					case 2 : res /= var;
						break;
					case 3 : res += var;
						break;
					case 4 : res -= var;
						break;
					default :
						printf("\nENTER A VALID OPERAND.....!!!");
				}
		}
"*"		op = 1;
"/"		op = 2;
"+"		op = 3;
"-"		op = 4;
\n		return 0;
%%

main() {
	printf("\nENTER THE EXPRESSION :");
	yylex();
	printf("\nTHE RESULT IS : %f\n", res);
}

int yywrap() {
	return 1;
}
