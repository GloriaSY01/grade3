#include<iostream>
using namespace std;

double adder(double a, double b)
{
	double m;
	m = a + b;
	return m;
}
int main()
{
	double a = 1.1;
	double b = 2.2;
	double result;
	result = adder(a, b);
	cout << result;
	return 0;
}