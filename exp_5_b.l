%{
#include <stdio.h>

int lines = 0;
int words = 0;
int tabs = 0;
int characters = 0;
%}

%%

\n              { lines++; }
\t              { tabs++; }
[a-zA-Z0-9]+    { words++; characters += yyleng; }
.               { characters++; }

%%

int main()
{
    FILE *fp;
    fp = fopen("vishnu.txt", "r");
    
    if(fp == NULL)
    {
      printf("file can not be opened. \n");
      return 1;
    }
    yyin = fp;

    yylex();

   fclose(fp);

    printf("\nLines      = %d", lines);
    printf("\nWords      = %d", words);
    printf("\nTabs       = %d", tabs);
    printf("\nCharacters = %d\n", characters);

    return 0;
}
