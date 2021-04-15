parse: calc.lex calc.y
	bison -v -d --file-prefix=y calc.y
	flex calc.lex
	gcc -o calc y.tab.c lex.yy.c -lfl

clean:
	rm -f lex.yy.c y.tab.* y.output *.o calc
