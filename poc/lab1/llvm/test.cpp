
//1) 数据类型：int
//2) 变量声明、常量声明，常量、变量的初始化
//3) 语句：赋值（=）、表达式语句、语句块、if、while、return
//4) 表达式：算术运算（+、-、*、/、%，其中+、-都可以是单目运算符）、关系运算（==，>，<，>=，<=，!=）和逻辑运算（&&（与）、||（或）、!（非））
//5) 注释
//6) 输入输出（实现连接SysY运行时库，参见文档《SysY运行时库》）
//函数:函数声明、函数调用
//break、continue语句
//数组
//浮点数
#include<iostream>
using namespace std;
const int N = 20;
double matrix[N];
double max_num = -100000000;
double calculate_max(double x1,double x2)
{
	if(x1>x2)
		return x1;
	else
		return x2;
}

int main()
{
	//zhushi for test
	int i,flag;
	i = 0;
	flag=1;
	while (i < N && flag==1)
	{
		cin >> matrix[i];
		i++;
	}

	int j;
	j = 0;
	while (j < N)
	{
		max_num = calculate_max(max_num, matrix[j]);
		j++;
	}

	cout << max_num << endl;
	return 0;

}
