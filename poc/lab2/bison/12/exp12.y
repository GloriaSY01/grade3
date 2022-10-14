%{
//处理好空格，制表符，回车，数字
#include<stdio.h>
#include<stdlib.h>
// bool
#include<ctype.h>
#ifndef YYSTYPE
#define YYSTYPE double
//我们要翻译的结果是表达式值,所以类型是double
#endif
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char*s);
%}

%token NUMBER
%token ADD SUB
%token MUL DIV
%token L_PAR R_PAR

%left  ADD SUB
%left  MUL DIV
%right UMINUS

%%
lines : lines expr ';' {printf("%f\n",$2);}//使用分号替换lines产生式中的\n
      | lines '\n'
      |
      ;
// 
expr  : expr ADD expr {$$=$1+$3;}
      | expr SUB expr {$$=$1-$3;}
      | expr MUL expr {$$=$1*$3;}
      | expr DIV expr {$$=$1/$3;}
      | L_PAR expr R_PAR {$$=$2;}
      | SUB expr %prec UMINUS { $$ = -$2; }
      | NUMBER {$$=$1;}
      ;
/*
NUMBER : '0' {$$=0.0;}
       | '1' {$$=1.0;}  
       | '2' {$$=2.0;}
       | '3' {$$=3.0;}
       | '4' {$$=4.0;}
       | '5' {$$=5.0;}
       | '6' {$$=6.0;}
       | '7' {$$=7.0;}
       | '8' {$$=8.0;}
       | '9' {$$=9.0;}    
*/
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
        else if(isdigit(t))
        {
            yylval=0;
            while(isdigit(t))
            {
                yylval=yylval*10+t-'0'; 
                t=getchar();
            }
            ungetc(t,stdin);
            return NUMBER;
        }
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



