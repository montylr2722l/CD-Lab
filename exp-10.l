%{
#include "exp-10.tab.h"
%}

%%

a       { return A; }
b       { return B; }
c       { return C; }
d       { return D; }

\n      { return '\n'; }
[ \t]   ;

.       { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}
