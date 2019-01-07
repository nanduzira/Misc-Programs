%{
#include "y.tab.h"
%}
%%
"if" return IF;
"else" return ELSE;
" " return SP;
"(" return LB;
")" return RB;
[a-zA-Z][0-9a-zA-Z]* return ID;
[0-9]+ return NUM;
"++"|"--" return INSU;
"=="|"!="|"<="|">="|">"|"<" return RELOP;
"="|"+"|"-"|"*"|"/" return AOP;
\n|. return *yytext;
%%

int yywrap() {
	return 1;
}
