%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%token A B

%%

input:
    S '\n'
    {
        printf("Valid string\n");
        return 0;
    }
    ;

S:
    A S B
    |
    /* empty */
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid string\n");
}

int main()
{
    printf("Enter a string: ");
    yyparse();

    return 0;
}
