#include<iostream>
#include<iomanip>
#include<arm_neon.h>
#include <sys/time.h>
using namespace std;

//生成不会出错的测试用例
void m_reset(float** m, int n)
{
    for (int i = 0; i < n; i++)
    {
        // 下三角全部设置为0
        for (int j = 0; j < i; j++)
            m[i][j] = 0;
        //对角线设置为1.0
        m[i][i] = 1.0;
        //上三角设置为随机数
        for (int j = i + 1; j < n; j++)
            m[i][j] = rand() % 100;
    }

    //每一行加上比自己下标小的行
    for (int k = 0; k < n; k++)
        for (int i = k + 1; i < n; i++)
            for (int j = 0; j < n; j++)
                m[i][j] += m[k][j];
}

//平凡
void normal_solve(float** m, int n)
{
    for (int k = 0; k < n; k++)
    {
        //处理第k行
        //均除以对应行位于对角线上的元素
        for (int j = k + 1; j < n; j++)
            m[k][j] = m[k][j] / m[k][k];

        //对角线元素变为1.0
        m[k][k] = 1.0;


        for (int i = k + 1; i < n; i++)
        {
            //串行原理的理解，m[k][k]变成了1，则第i行减去的次数为
            //m[i][k]/m[k][k]=m[i][k]
            for (int j = k + 1; j < n; j++)
                m[i][j] = m[i][j] - m[i][k] * m[k][j];

            m[i][k] = 0;
        }
    }
}



int main()
{
    int N = 2000;
    float** matrix_normal;
    matrix_normal = new float* [N];
    for (int i = 0; i < N; i++)
    {
        matrix_normal[i] = new float[N];
    }

    int size = N-1;//数据集增长速度
    struct timeval start1,end1;//记录串行时间
    struct timeval start2, end2;//记录并行时间
    for (int n = size; n < N; n += size)
    {
        m_reset(matrix_normal,n);

        //串行
        gettimeofday(&start1, NULL);
        int count1 = 0;
        normal_solve(matrix_normal, n);
        gettimeofday(&end1, NULL);
        count1++;

        float time1 = ((end1.tv_sec - start1.tv_sec) * 1000 + float((end1.tv_usec - start1.tv_usec)) / 1000) / count1;

        cout << "问题规模:" << n << endl;
        cout << "串行平均时间" << "ms";
        cout << endl;

        if (n > 320) size = 100;

    }

}


