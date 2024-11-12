%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int lineno;
%}

num [0-9]+
letter [a-zA-Z]
digit {num}(\.{num})?([eE][+-]?{num})?
newline \n
id {letter}({letter}|{num})*

%%
"if"|"else"|"printf"|"while"|"for" {printf("\nKeyword: %s\n", yytext);}
"<"|"="|"=="|"<="|">=" {printf("\nRelational operator: %s\n", yytext);}
"*"|"/"|"%"|"-"|"+" {printf("\nMathematical operator: %s\n", yytext);}
{num} {printf("\nNumber: %s\n", yytext);}
{id} {printf("\nIdentifier: %s\n", yytext);}
{newline} {printf("New line: %d\n", ++lineno);}
. {printf("Unknown token: %s\n", yytext);}  // To handle unknown tokens

%%

int main() {
    lineno = 1;
    printf("Enter expression:\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
