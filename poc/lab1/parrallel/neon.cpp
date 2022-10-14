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


//并行
void parallel_solve(float** m, int n)
{
    for (int k = 0; k < n; k++)
    {
        //1、先是第k行除以m[k][k]
        float32x4_t vt = vdupq_n_f32(m[k][k]);
        int j;
        for (j = k + 1; j + 4 <= n; j = j + 4)
        {
            //非对齐模式
            float32x4_t va = vld1q_f32(&m[k][j]);
            va = vdivq_f32(va, vt);
            vst1q_f32(&m[k][j], va);
        }
        //处理剩余的
        if (j < n)
        {
            for (; j < n; j++)
                m[k][j] = m[k][j] / m[k][k];
        }


        //1、处理m[k][k]
        m[k][k] = 1.0;

        //消除第k列行下标大于k的元素
        for (int i = k + 1; i < n; i++)
        {
            float32x4_t vaik = vdupq_n_f32(m[i][k]);
            for (int j = k + 1; j + 4 <= n; j = j + 4)
            {
                float32x4_t vakj = vld1q_f32(&m[k][j]);
                float32x4_t vaij = vld1q_f32(&m[i][j]);
                float32x4_t vx = vmulq_f32(vakj, vaik);
                vaij = vsubq_f32(vaij, vx);
                vst1q_f32(&m[i][j], vaij);
            }
            //处理剩余的
            if (j < n)
            {
                for (; j < n; j++)
                    m[i][j] = m[i][j] - m[k][j] * m[i][k];
            }
            m[i][k] = 0;
        }

    }
}

int main()
{
    int N = 2000;
    float** matrix_parallel;
    matrix_parallel = new float* [N];
    for (int i = 0; i < N; i++)
    {
        matrix_parallel[i] = new float[N];
    }

    int size = N-1;//数据集增长速度
    struct timeval start2, end2;//记录并行时间
    for (int n = size; n < N; n += size)
    {
        m_reset(matrix_parallel,n);

        //并行
        gettimeofday(&start2, NULL);
        int count2 = 0;
        parallel_solve(matrix_parallel, n);
        gettimeofday(&end2, NULL);
        count2++;
        float time2 = ((end2.tv_sec - start2.tv_sec) * 1000 + float((end2.tv_usec - start2.tv_usec)) / 1000) / count2;


        cout << "问题规模:" << n << endl;
        cout << "并行平均时间" << time2 << "ms";
        cout << endl;

        if (n > 320) size = 100;

    }

}


