%{
	#include<stdio.h>
%}
digito [0-9]
signos [+-]
%option noyywrap
%option yylineno
%%
{signos}?{digito}+ {printf("\nNumero entero: %s", yytext);}
{signos}?{digito}*\.{digito}+ {printf("\nNumero real: %s", yytext);}
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
