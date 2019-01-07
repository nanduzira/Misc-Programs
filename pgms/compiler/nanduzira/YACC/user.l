%{
#include "y.tab.h"
%}
alpha [a-zA-Z]
digit [0-9]
%%
"int"|"float"|"char"|"void" return DT;
"(" {return OP;}
")" {return CP;}
"{" {return OB;}
"}" {return CB;}
"\n" {return NL;}
";" {return SC;}
" " {return SP;}
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return ID;
"<"|">"|"=="|"!="|"<="|">="|"=" return RELOP;
"+"|"-"|"/"|"*" return OPE;
. return yytext[0];
%%
int yywrap()
{
 return 1;
}
