# CA NOTES

## 01 Introduction

课程**主要讲授**处理器**微体系结构(micro-architecture)**

***思考***

​	点击电源开关至显示屏亮起，电脑都发生了些什么？

```
① 加电––––打开电源开关，给主板和内部风扇供电。 
② 启动引导程序––––CPU开始执行存储在ROM BIOS中的指令。 
③ 开机自检––––计算机对系统的主要部件进行诊断测试。 
④ 加载操作系统––––计算机将操作系统文件从磁盘读到内存中。 
⑤ 检查配置文件，定制操作系统的运行环境––––读取配置文件，根据用户的设置对操作系统进行定制。 
⑥ 准备读取命令和数据––––计算机等待用户输入命令和数据。
```

**为什么学习体系结构？**

(1)发展趋势

(2)理解顶层设计理念

(3)理解计算机性能

(4)了解前沿领域的研究



**驱动技术**

basic element：固态晶体管、集成电路(ICs)

集成电路的优点：高性能、可靠性、成本低、能耗低；大规模生产

集成电路典型：SRAM、DRAM、Flash



▲Dennard Scaling & Moore‘s Law 时代的终结



关键技术：**并行**和**高速缓存**



## 02 Performance&Benchmarking

#### **性能指标**

1、延迟（即完成一个任务所需要的时间）

2、吞吐量



#### **CPU performance**

课堂主要关注**CPI**（caches，parallelism）

CPI=cycles/instructions

IPC=1/CPI

如何衡量CPI？相关概念了解

​	硬件计数器

​	simulation(gem5)：性能问题

​	emulator：速度快，将指令直接翻译，不进行详细解读，只进行功能的仿真



#### **Comparing Performance**

主语为分子,注意speedup需要**-1**



**Latency**

A is Latency(A)/Latency(B) times faster than B

A is (Latency(A)/Latency(B) - 1) faster than B

**Throughput**

B is Throughput(B)/Throughput(A) times faster than A

B is (Throughput(B)/Throughput(A) - 1) faster than A



“平均数“衡量性能

可加性？延迟√，吞吐量№

#### 

#### 测试性能时的挑战

(1)其他程序干扰（同时运行的其他程序）

(2)多次测量（测试次数不够）

(3)高精度计时器

(4)冷启动（缓存与否？如何清除缓存？working set）

(5)管理的语言(即时编译？GC？虚拟机启动？)



测试：减少误差，可用置信区间确定测试次数



#### Benchmarking 测试标杆





