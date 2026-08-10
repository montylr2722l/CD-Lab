%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>

void check_vowel(char *word) {
    char firstChar = tolower(word[0]);
    
    if (firstChar == 'a' || firstChar == 'e' || firstChar == 'i' || 
        firstChar == 'o' || firstChar == 'u') {
        printf("'%s' starts with a Vowel.\n", word);
    } else {
        printf("'%s' does NOT start with a Vowel.\n", word);
    }
}
%}

%%

[aeiouAEIOU][a-zA-Z]* {
    check_vowel(yytext);
}

[^aeiouAEIOU\s][a-zA-Z]* {
    check_vowel(yytext);
}

[\t\n ] ; 

%%

int main() {
    printf("Enter words (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}   
