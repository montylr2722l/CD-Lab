%{
#include<stdio.h>
void print_name(char *name){
printf("My name is %s\n", name);
}
%}
%%

[a-zA-Z]+ {
print_name(yytext);
}
[\t\n];
%%
int main(){
printf("enter name: ");
yylex();
return 0;
}
int yywrap(){
return 1;
}
