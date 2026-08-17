%{
#include <stdio.h>

int lines = 0;
int words = 0;
int tabs = 0;
int characters = 0;
%}

%%

\n              { lines++; }
\t              { tabs++; }
[a-zA-Z0-9]+    { words++; characters += yyleng; }
.               { characters++; }

%%

int main()
{
    printf("Enter text :\n");

    yylex();

    printf("\nLines      = %d", lines);
    printf("\nWords      = %d", words);
    printf("\nTabs       = %d", tabs);
    printf("\nCharacters = %d\n", characters);

    return 0;
}
