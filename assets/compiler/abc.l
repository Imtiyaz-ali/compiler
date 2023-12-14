%{
#include <stdio.h>
#include <ctype.h>
int i;
%}

%%
[a-zA-Z]+ {
    for (i = 0; i <= yyleng - 3; i++) {
        if ((yytext[i] == 'a') && (yytext[i + 1] == 'b') && (yytext[i + 2] == 'c')) {
            yytext[i] = 'A';
            yytext[i + 1] = 'B';
            yytext[i + 2] = 'C';
        }
    }
    printf("%s", yytext);
}

[\t ]+ {
    printf("%s", yytext);
}

return; {
    printf("return;");
}

. {
    printf("%s", yytext);
}

\n {
    printf("\n");
}

%%

int main() {
    yylex();
}

int yywrap() {
    return 1;
}

