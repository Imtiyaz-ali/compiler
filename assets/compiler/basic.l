/* program name is lexp.l */ 
%{
  /* program to recognize a c program */
  int COMMENT = 0;
  int cnt = 0; 
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%
#.* {
printf("\n%s is a PREPROCESSOR DIRECTIVE", yytext);
}
int|float|char|double|while|for|do|if|break|continue|void|switch|case|long|struct|const|typedef|return|else|goto { printf("%s is a KEYWORD\n", yytext); }
"/*" {
  COMMENT = 1;
}
"*/" {
  COMMENT = 0;
  cnt++;
}
{identifier}\( { if (!COMMENT) printf("FUNCTION\t%s\n", yytext); }

\{ { if (!COMMENT) printf("BLOCK BEGINS\n"); }

\} { if (!COMMENT) printf("BLOCK ENDS\n"); }
{identifier}(\[[0-9]*\])? { if (!COMMENT) printf("%s IDENTIFIER\n",yytext); }
\".*\" {
	if(!COMMENT) printf("%s is a STRING\n",yytext);
}
[0-9]+ {
     if (!COMMENT) printf("%s is a NUMBER\n", yytext);
}
\)(\;)? {
    if (!COMMENT) printf("\n");ECHO;printf("\n");
}
\(ECHO ; 
= {
	if (!COMMENT) printf("%s is an ASSIGNMENT OPERATOR\n", yytext);
}
\<=|\>=|\<|==|\> {
      if (!COMMENT) printf("%s is a RELATIONAL OPERATOR\n", yytext);
}
%%
int main(int argc, char ** argv) {
  if (argc > 1) {
    FILE * file;
    file = fopen(argv[1], "r");
    if (!file) {
      printf("could not open %s \n", argv[1]);
      exit(0);
    }
    yyin = file;
  }
  yylex();
  printf("Total No.Of comments are %d\n", cnt);
  return 0;
}
int yywrap() {
  return 1;
}
