#include<stdio.h>
#include<string.h>


void main() {
	char buf[100], op, var1, var2, var3;
	FILE* f = fopen("input","r");
	if (!f)
		return;
	while (!feof(f)) {
		fscanf(f,"%c\t=\t%c\t%c\t%c\n",&var1,&var2,&op,&var3);
		switch(op) {
		case '+': {
			printf("MOV AX,  %c\n", var2);
			printf("ADD AX,  %c\n", var3);
			printf("MOV  %c, AX\n", var1);
			break;
		}
		case '-': {
			printf("MOV AX,  %c\n", var2);
			printf("SUB AX,  %c\n", var3);
			printf("MOV  %c, AX\n", var1);
			break;
		}
		case '*': {
			printf("MOV AX,  %c\n", var2);
			printf("MUL AX,  %c\n", var3);
			printf("MOV  %c, AX\n", var1);
			break;
		}
		case '/': {
			printf("MOV AX,  %c\n", var2);
			printf("DIV AX,  %c\n", var3);
			printf("MOV  %c, AX\n", var1);
			break;
		}
		case '=': {
			printf("MOV AX,  %c\n", var3);
			printf("MOV  %c, AX\n", var2);
			break;
		}
		}
	}
}
