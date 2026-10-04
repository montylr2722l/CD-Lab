%{
#include <stdio.h>

char ch;
int count = 0;
%}

%%

. {
    if(yytext[0] == ch)
        count++;
}

\n ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    FILE *file;

    printf("Enter character: ");
    scanf("%c", &ch);

    file = fopen("input.txt", "r");

    if(file == NULL)
    {
        printf("File not found\n");
        return 1;
    }

    yyin = file;

    yylex();

    printf("Occurrence of '%c' = %d\n", ch, count);

    fclose(file);

    return 0;
}