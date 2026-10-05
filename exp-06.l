%{
#include <stdio.h>

int spaces = 0;
int words = 0;
int lines = 0;
%}

%%

[ ]+       {
              spaces += yyleng;
           }

\n         {
              lines++;
           }

[a-zA-Z0-9_]+ {
              words++;
           }

. ;

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

    printf("Number of spaces = %d\n", spaces);
    printf("Number of words  = %d\n", words);
    printf("Number of lines  = %d\n", lines);

    fclose(file);

    return 0;
}