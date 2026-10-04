%{
#include <stdio.h>
#include <string.h>

int count = 0;

char keywords[][10] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do",
    "double", "else", "enum", "extern", "float", "for", "goto", "if",
    "int", "long", "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"
};

int n = sizeof(keywords) / sizeof(keywords[0]);
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    for(int i = 0; i < n; i++) {
        if(strcmp(yytext, keywords[i]) == 0) {
            count++;
            break;
        }
    }
}

[ \t\n]+ ;

. ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("input.txt", "r");

    if(yyin == NULL)
    {
        printf("File not found\n");
        return 1;
    }

    yylex();

    printf("Number of keywords = %d\n", count);

    fclose(yyin);

    return 0;
}