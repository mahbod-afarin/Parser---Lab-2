%{
	include "y.tab.h"
	int currLine = 1, currPos = 1;
	int numInt = 0;
	int numOp = 0;
	int numPa = 0;
	int numEq = 0;
%}

DIGIT [0-9]

%%

"-" {currPos += yyleng; numOp++; return MINUS;}
"+" {currPos += yyleng; numOp++; return PLUS;}
"*" {currPos += yyleng; numOp++; return MULT;}
"/" {currPos += yyleng; numOp++; return DIV;}
"(" {currPos += yyleng; numPa++; return L_PAREN;}
")" {currPos += yyleng; numPa++; return R_PAREN;}
"=" {currPos += yyleng; numEq++; return EQUAL;}

(\.[0-9]+)|([0-9]+(\.[0-9]*)?([eE][+-]?[0-9]+)?)   {currPos += yyleng; numInt++; yylval.dval = atof(yytext); return NUMBER;}

[\t]+ {/* ignore spaces */ currPos += yyleng;}

"\n" {currLine++; currPos = 1; return END;}

. {printf("Error st Line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);}

%%