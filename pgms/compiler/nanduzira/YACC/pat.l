%{
#include"y.tab.h"
%}

%%
[0-9]+	return NUM;
"+"		return ADD;
"-"		return SUB;
"*"		return MUL;
"/"		return DIV;
"("		return *yytext;
")"		return *yytext;
\n	return *yytext;
%%

int yywrap() {
	return ;
}
