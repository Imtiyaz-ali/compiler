#include <stdio.h>
#include <string.h>
#include <ctype.h>

int mp[128] = {0};
char string_storage[100][100];
char keywords[32][10] = {"auto", "break", "case", "char", "const", "continue", "default",
                         "do", "double", "else", "enum", "extern", "float", "for", "goto",
                         "if", "int", "long", "register", "return", "short", "signed",
                         "sizeof", "static", "struct", "switch", "typedef", "union",
                         "unsigned", "void", "volatile", "while"};

void keyword(char str[10])
{
    int isKeyword = 0;
    for (int i = 0; i < 32; i++)
    {
        if (strcmp(keywords[i], str) == 0)
        {
            isKeyword = 1;
            break;
        }
    }
    if (isKeyword)
        printf("%s ", str);
    else
        printf("%s ", str);
}
int need_to_print(char str[10], int j)
{
    int f = 1;
    for (int i = 0; i < j; i++)
    {
        if (strcmp(string_storage[i], str) == 0)
        {
            f = 0;
            break;
        }
    }
    if (f)
    {
        strcpy(string_storage[j], str);
    }
    return f;
}
void main()
{
    FILE *f1, *f2, *f3;
    char c, str[10], st1[10];
    int num[100], lineno = 0, tokenvalue = 0, i = 0, j = 0, k = 0;
    printf("\nEnter the c program (end with $) \n");
    f1 = fopen("code.c", "w");
    while ((c = getchar()) != '$')
        putc(c, f1);
    fclose(f1);
    
    f1 = fopen("code.c", "r");
    f2 = fopen("identifier", "w");
    f3 = fopen("specialchar", "w");
    while ((c = getc(f1)) != EOF)
    {
        if (isdigit(c))
        {
            tokenvalue = c - '0';
            c = getc(f1);
            while (isdigit(c))
            {
                tokenvalue = tokenvalue * 10 + c - '0';
                c = getc(f1);
            }
            num[i++] = tokenvalue;
            ungetc(c, f1);
        }
        else if (isalpha(c))
        {
            putc(c, f2);
            c = getc(f1);
            while (isdigit(c) || isalpha(c) || c == '_' || c == '$')
            {
                putc(c, f2);
                c = getc(f1);
            }
            putc(' ', f2);
            ungetc(c, f1);
        }
        else if (c == ' ' || c == '\t')
            printf(" ");
        else if (c == '\n')
            lineno++;
        else
            putc(c, f3);
    }
    fclose(f2);
    fclose(f3);
    fclose(f1);

    printf("\nThe no's in the program are: ");
    for (j = 0; j < i; j++)
        printf("%d ", num[j]);

    f2 = fopen("identifier", "r");
    k = 0;
    printf("\nThe keywords and Idenfiers are: ");
    j = 0;
    while ((c = getc(f2)) != EOF)
    {
        if (c != ' ')
            str[k++] = c;
        else
        {
            str[k] = '\0';

            if (need_to_print(str, j) == 1)
            {
                keyword(str);
                j++;
            }
            k = 0;
        }
    }
    fclose(f2);
    f3 = fopen("specialchar", "r");
    printf("\nSpecial characters are: ");
    while ((c = getc(f3)) != EOF)
    {
        if (mp[c] == 0)
            printf("%c ", c);
        mp[c]++;
    }
    fclose(f3);
    printf("\nTotal no. of lines are: %d", lineno);
}
