%{
#include<stdio.h>
%}
%%
\n {printf("my name is vishnu\n");}
%%
int main(){
yylex();
return 0;
}
