%{
#include <stdio.h>

int arithmetic = 0;
int relational = 0;
int logical = 0;
int assignment = 0;
%}

%%

"++"|"--"|"+"|"-"|"*"|"/"|"%"    { arithmetic++; }

"=="|"!="|"<="|">="|"<"|">"      { relational++; }

"&&"|"||"|"!"                    { logical++; }

"+="|"-="|"*="|"/="|"%="|"="     { assignment++; }

[ \t\n]+ ;

. ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter an expression:\n");

    yylex();

    printf("\nArithmetic Operators = %d", arithmetic);
    printf("\nRelational Operators = %d", relational);
    printf("\nLogical Operators    = %d", logical);
    printf("\nAssignment Operators = %d\n", assignment);

    return 0;
}