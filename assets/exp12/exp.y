%{

#include"y.tab.h"

#include<stdio.h>

char addtotable(char,char,char);

int index1=0;

char temp = 'A'-1;

struct expr{
    printf("%c:=\t",arr[i].result);

printf("%c\t",arr[i].operand1);

printf("%c\t",arr[i].operator);

printf("%c\t", arr[i].operand2); i++; printf("\n");

temp++;

}

}

void fouradd() {

int i=0;

char temp='A';

while(i<index1){ printf("%c\t",arr[i].operator); printf("%c\t",arr[i].operand1); printf("%c\t",arr[i].operand2); printf("%c",arr[i].result); i++; printf("\n");

temp++;

}

}

int find(char 1) {

int i;

for(i=0;i<index1;i++) if(arr[i].result-l) break; return i;

}

void triple() {

int i=0;

char temp='A';

if(!isupper(arr[i].operand1)) printf("%c\t",arr[i].operand1);

while(i<index1){ printf("%c\t",arr[i].operator); else { printf("pointer"); } else { }

printf("%d\t",find(arr[i].operand1));

if(!isupper(arr[i].operand2))

printf("%c\t",arr[i].operand2);

printf("pointer");

printf("%d\t",find(arr[i].operand2));

i++;
temp++;

printf("\n");

}

}

int yywrap(){

return 1;

}

int main() {

printf("Enter the expression: ");

yyparse();

threeAdd();

printf("\n");

fouradd();

printf("\n");

triple();
return 0;
}