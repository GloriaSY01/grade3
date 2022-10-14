#include<iostream>
using namespace std;
int main()
{
	int a = 10,i=0,flag=1;
    while(i<10)
	{
		if (a < 15 && flag==1)
			cout << a << endl;
		a++;
        i++;
		if (a > 15)
			break;
	}

	return 0;
}