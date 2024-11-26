## cpu

#### /proc/stat

---
cpu  38082 627 27594 893908 12256 581 895 0 0

- user        (38082)  从系统启动开始累计到当前时刻，处于用户态的运行时间，不包含 nice值为负进程。
- nice        (627)    从系统启动开始累计到当前时刻，nice值为负的进程所占用的CPU时间
- system      (27594)  从系统启动开始累计到当前时刻，处于核心态的运行时间
- idle        (893908) 从系统启动开始累计到当前时刻，除IO等待时间以外的其它等待时间
- iowait      (12256)  从系统启动开始累计到当前时刻，IO等待时间(since 2.5.41)
- irq         (581)    从系统启动开始累计到当前时刻，硬中断时间(since 2.6.0-test4)
- softirq     (895)    从系统启动开始累计到当前时刻，软中断时间(since 2.6.0-test4)
- stealstolen (0)      which is the time spent in other operating systems when running in a virtualized environment(since 2.6.11)
- guest       (0)      which is the time spent running a virtual  CPU  for  guest operating systems under the control of the Linux kernel(since 2.6.24)

---
总的Cpu使用率计算
计算方法：

1. 采样两个足够短的时间间隔的Cpu快照，分别记作t1,t2，其中t1、t2的结构均为：
    - (user、nice、system、idle、iowait、irq、softirq、stealstolen、guest)的9元组;
    -

2. 计算总的Cpu时间片totalCpuTime
    - 把第一次的所有cpu使用情况求和，得到s1;
    - 把第二次的所有cpu使用情况求和，得到s2;
    - s2 - s1得到这个时间间隔内的所有时间片，即totalCpuTime = j2 - j1 ;
    -

3. 计算空闲时间idle
    - idle对应第四列的数据，用第二次的第四列 - 第一次的第四列即可
    - idle=第二次的第四列 - 第一次的第四列
    -

6. 计算cpu使用率
    - pcpu =100* (total-idle)/total
    -

---


