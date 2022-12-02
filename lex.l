%option noyywrap

%{
    //#include "lex.tab.h"
%}

digit [0-9]
number ({digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
undr [_]
quote ["]
alnum {alpha}|{digit}
colon [:]
float {digit}*"."{digit}+
id {alpha}{alnum}*
str {quote}({id}|{ws}|{colon})*{quote}

%%
{ws} {}
"ForL" {printf("%s -> FORL\n", yytext);}
"float" {printf("%s -> FLOAT_TYPE\n", yytext);}
"input" {printf("%s -> INPUT\n", yytext);}
"print" {printf("%s -> PRINT\n", yytext);}
"var" {printf("%s -> VAR\n", yytext);}
"index" {printf("%s -> INDEX\n", yytext);}
"INT" {printf("%s -> INT\n", yytext);}
"To" {printf("%s -> TO\n", yytext);}
"Next" {printf("%s -> NEXT\n", yytext);}
"(" {printf("%s -> LEFT_BRACKET\n", yytext);}
")" {printf("%s -> RIGHT_BRACKET\n", yytext);}
{colon} {printf("%s -> COLON\n", yytext);}
{float} {printf("%s -> FLOAT\n", yytext);}
{number} {printf("%s -> INT_NUM\n", yytext);}
{id} {printf("%s -> ID\n", yytext);}
{str} {printf("%s -> STRING\n", yytext);}
%%

int main(){
    yylex();
}






// q1a: Q1.  Consider the following code snippet: var index : INT;  ForL ( index : 1.0 : 10);  a) Perform Lexical Analysis on the given code snippet. b) Perform Syntax Analysis on the given code snippet. c) Perform Semantic Analysis on the given code snippet.