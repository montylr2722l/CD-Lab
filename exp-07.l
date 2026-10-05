%{
#include <stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%

[aeiouAEIOU]    { vowels++; }

[a-zA-Z]        { consonants++; }

[ \t\n]+        ;

.               ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    FILE *file;

    file = fopen("input.txt", "r");

    if(file == NULL)
    {
        printf("File not found\n");
        return 1;
    }

    yyin = file;

    yylex();

    printf("Number of vowels = %d\n", vowels);
    printf("Number of consonants = %d\n", consonants);

    fclose(file);

    return 0;
}