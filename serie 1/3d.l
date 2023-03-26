%{
	#include<stdio.h>
%}
num1[0-9]
num2[0-3]
num3[0-5]
%option noyywrap
%option yylineno
%%
(0{num1}|1{num1}|2{num2})":"{num3}{num1} {printf("\nPalabra valida: %s", yytext);}
.* {printf("\nPalabra no reconocida: %s", yytext);}
%%

int main (int argc, char *argv[]){
	if (argc>1)
		yyin=fopen(argv[1],"r");
	else {
		printf("No se pudo abrir el archivo");
		exit(0);
	}
	yylex();
}
