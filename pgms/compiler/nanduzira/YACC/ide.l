%{
#include "y.tab.h"
%}
%%
[a-zA-Z] return ID;
[0-9] return NUM;
"_"	return US;
\n|. return *yytext;
%%

int yywrap() {
	return 1;
}
