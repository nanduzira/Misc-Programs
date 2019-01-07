%{
#include<stdio.h>
#include<string.h>
	char cphr[25], a, n;
	int i = 0;
%}

%%
[a-z]	{	a = yytext[0];
			n = (a + 3 - 97)%26 + 97;
			cphr[i++] = n;
		}
[A-Z]	{	a = yytext[0];
			n = (a + 3 - 65)%26 + 65;
			cphr[i++] = n;
		}
.		;
\n		return 0;
%%

main() {
	printf("\nENTER THE MESSAGE :");
	yylex();
	printf("\nTHE CEASAR CIPHER IS : %s\n", cphr);
}

int yywrap() {
	return 1;
}
