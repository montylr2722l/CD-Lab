%{
#include <stdio.h>
#include <string.h>

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
    int found = 0;

    for(int i = 0; i < n; i++) {
        if(strcmp(yytext, keywords[i]) == 0) {
            found = 1;
            break;
        }
    }

    if(found)
        printf("%s is a keyword\n", yytext);
    else
        printf("%s is not a keyword\n", yytext);
}

[ \t\n] ;

. ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a string: ");
    yylex();

    return 0;
}