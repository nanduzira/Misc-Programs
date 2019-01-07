%{
#include "lex.yy.c"
int i=0, a[20];
%}

%token NUM
%left '+' '-'
%left '*' '/'
%%
stmt: E'\n'{return;}
E: E '+' {push();} T {pop();}
	|E '-' {push();} T {pop();}
	|T
T: T '*' {push();} F {pop();}
	|T '/' {push();} F {pop();}
	|F
F: NUM {display();}
%%
main() 
{
	printf("ENTER THE STRING : ");
	yyparse();
}

push() {
	a[i++] = yytext[0];
}

pop() {
	printf("%c", a[--i]);
}

display() {
	printf("%c", yytext[0]);
}

int yyerror(char *s) {
	printf("error\n");
	return 0;
}
