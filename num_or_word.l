%{
#include<stdio.h>
%}

%%

[0-9]+      { printf("'%s' is a NUMBER\n", yytext); }
[a-zA-Z]+   { printf("'%s' is a WORD\n", yytext); }
[\t\n ]     ; 

%%

int main() {
    printf("Enter something: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}   
