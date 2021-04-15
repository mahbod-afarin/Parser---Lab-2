%{
 #include <stdio.h>
 #include <stdlib.h>
 extern int currLine;
 extern int currPos;
%}

%union{
  double dval;
  int ival;
}

%error-verbose
%start input
%token MULT DIV PLUS MINUS EQUAL L_PAREN R_PAREN END
%token <dval> NUMBER
%type <dval> exp
%left PLUS MINUS
%left MULT DIV


%% 
input:	
			| input line
			;

line:		exp EQUAL END         { printf("\t%f\n", $1);}
			;

exp:		NUMBER                { $$ = $1; }
			| exp PLUS exp        { $$ = $1 + $3; }
			| exp MINUS exp       { $$ = $1 - $3; }
			| exp MULT exp        { $$ = $1 * $3; }
			| exp DIV exp         { $$ = $1 / $3; }
			| MINUS exp { $$ = -$2; }
			| L_PAREN exp R_PAREN { $$ = $2; }
			;
%%

int main(int argc, char **argv) {
   yyparse(); 
   return 0;
}

