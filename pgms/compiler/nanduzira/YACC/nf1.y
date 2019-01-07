%{#include "y.tab.h"
#include "stdlib.h"
#include "stdio.h"
int count=0;
%}
%token IF RELOP S NUMBER ID

%%
stmt : IF'(' cond ')' if_stmt {printf("the no of nested if is:%d\n",count);exit(0);}
;
if_stmt : IF'(' cond ')' if_stmt {count++;}
|
S
;
cond : x RELOP x
;
x : ID
| NUMBER
;
%%
int yyerror(char *msg)
{
printf("Invalid Expression\n");
exit(0);
}

main()
{
printf("Enter the statement\n");
yyparse();
}
