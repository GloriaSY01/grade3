%{
//处理好空格，制表符，回车，数字
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
//为了调用isdigit
#ifndef YYSTYPE
#define YYSTYPE char*
//类型改称char*
#endif
char idStr[50];
char numStr[50];
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char*s);
%}

%token NUMBER
%token ADD SUB
%token MUL DIV
%token L_PAR R_PAR
%token ID //ident

//声明运算符的左右结合性及优先级
%right L_PAR
%left  ADD SUB
%left  MUL DIV
%right UMINUS
%left R_PAR

%%
lines : lines expr ';' {printf("%s\n",$2);}//使用分号替换lines产生式中的\n
      | lines ';'
      |
      ;
      //a operator b -> a
expr  : expr ADD expr {$$=(char*)malloc(50*sizeof(char));
                        strcpy($$,$1); strcat($$,$3); strcat($$,"+ ");}
      | expr SUB expr {$$=(char *)malloc(50*sizeof(char));
                        strcpy($$,$1);strcat($$,$3);strcat($$,"- ");}
      | expr MUL expr {$$=(char *)malloc(50*sizeof(char));
                        strcpy($$,$1);strcat($$,$3);strcat($$,"* ");}
      | expr DIV expr {$$=(char *)malloc(50*sizeof(char));
                        strcpy($$,$1);strcat($$,$3);strcat($$,"/ ");}
      | L_PAR expr R_PAR {$$=(char *)malloc(50*sizeof(char));
                            strcpy($$,$2);}
        //(a)->a()->a
      | SUB expr %prec UMINUS { $$ = (char *)malloc(50*sizeof(char)); 
                                strcpy($$,$2);strcat($$,"- ");}
        //-a->a-
      | NUMBER {$$=(char *)malloc(50*sizeof(char));
                strcpy($$,$1);strcat($$," ");}
      | ID {$$=(char *)malloc(50*sizeof(char));
                strcpy($$,$1);strcat($$," ");}
      ;
%%


int yylex()
{
    int t;
    while(1)
    {
        t=getchar();
        if(t==' '||t=='\t'||t=='\n')
        {
            //do nothing
        }
        //number
        else if(isdigit(t))
        {
            int ti=0;
            while(isdigit(t))
            {
                numStr[ti]=t;
                ti++;
                t=getchar();
            }
            numStr[ti]='\0';
            yylval=numStr;
            ungetc(t,stdin);
            return NUMBER;
        }
        //ident
        else if((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_'))
        {
            int ti=0;
            while((t>='a'&&t<='z')||(t>='A'&&t<='Z')||(t=='_')||(isdigit(t)))
            {
                idStr[ti]=t;
                ti++;
                t=getchar();
            }
            idStr[ti]='\0';
            yylval=idStr;
            ungetc(t,stdin);
            return ID;
        }
        // operator
        else if(t=='+') return ADD;
        else if(t=='-') return SUB;
        else if(t=='*') return MUL;
        else if(t=='/') return DIV;
        else if(t=='(') return L_PAR;
        else if(t==')') return R_PAR;
        else return t;

    }
}
int main(void)
{
    yyin=stdin;
    do{
        yyparse();
    }
    while(!feof(yyin));
    return 0;
}
void yyerror(const char* s)
{
    fprintf(stderr,"Parse error:%s\n",s);
    exit(1);
}



