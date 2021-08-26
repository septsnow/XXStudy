### day1要点

1. `xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main.cpp；`这是`oc`转`c++`转换命令
2. 在64位系统中，指针是8个字节；为什么呢？因为指针指向的是地址，而想要指向所有地址，指针必须是64位；
3. <font color='pink'>为什么Student的getInstanceSize和malloc_size会出现差别呢?如果因为最小16个字节的原因，那么大于16的时候应该是相同的，然而并不是。</font>
4. [苹果开源网站](https://opensource.apple.com/)
5. 大小端模式，iOS属于小端模式。比如数据0x1234存放在地址0x4000和0x4001上，小端模式是```0x4000:0x34, 0x4001:0x12```, 高位数据`0x12`存放在高位地址`0x4001`上；大端则相反。 
6. NSObject alloc的时候系统会分配16个字节的内存，但是isa指针只会占用8个字节。
7. `class_getInstanceSize实际上是data()->ro->instanceSize`，所以这个数据是不一定准确的。



### 总结

这一天的主要内容是为了验证NSObject是结构体，并且粗略地讲述了结构体的内存布局。

