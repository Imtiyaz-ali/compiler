%{
int vow_count=0;
int const_count =0;
%}
%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
%%

int yywrap(){
	return 1;
}

int main(int argc,char *argv[]) {
	if (argc==2){ 
		yyin=fopen(argv[1],"r"); 
	} else {
		printf("Enter the string of vowels and consonents:");
	}
	yylex();
	printf("Number of vowels are: %d\n", vow_count);
	printf("Number of consonants are: %d\n", const_count);
	return 0;
}
