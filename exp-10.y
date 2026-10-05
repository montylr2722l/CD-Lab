%{
#include <stdio.h>

int yylex();
void yyerror(const char *s);
%}

%token A B C D

%%

input:
    S '\n'
    {
        printf("Valid string\n");
        return 0;
    }
    ;

S:
    AB CD
    ;

AB:
    A AB B
    |
    A B
    ;

CD:
    C CD D
    |
    C D
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