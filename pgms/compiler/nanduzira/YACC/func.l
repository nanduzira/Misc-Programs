%{
#include "y.tab.h"
%}
%%
"int"|"float"|"void" return TYPE;
" " return SP;
";" return SC;
"(" return LB;
")" return RB;
"=" return EQ;
[a-zA-Z][0-9a-zA-Z]* return ID;
[0-9]+ return NUM;
"++"|"--" return INSU;
"="|"+"|"-"|"*"|"/" return AOP;
\n|. return *yytext;
%%

int yywrap() {
	return 1;
}
