%{
#include "y.tab.h"
%}
%%
"do" return DO;
"for" return FOR;
"while" return WHILE;
" " return SP;
";" return SC;
"(" return LB;
")" return RB;
"=" return EQ;
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
