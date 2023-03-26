%{
	#include<stdio.h>
%}
%option noyywrap
%option yylineno
%%
(a|b)*bb {printf("\nPalabra valida: %s", yytext);}
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
