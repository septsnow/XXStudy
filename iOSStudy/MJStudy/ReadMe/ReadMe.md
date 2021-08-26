##### <font color='pink'>粉色</font>表示问题，提出疑问；<font color='orange'>橘色</font>表示提示，重点提示；<u>下划线</u>表示此问题已解决；

### day1要点

1. `xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main.cpp；`这是`oc`转`c++`转换命令
2. 在64位系统中，指针是8个字节；为什么呢？因为指针指向的是地址，而想要指向所有地址，指针必须是64位；
3. <font color='pink'><u>为什么Student的getInstanceSize和malloc_size会出现差别呢?如果因为最小16个字节的原因，那么大于16的时候应该是相同的，然而并不是</u>。</font><font color='orange'>答案在day2要点->知识点3</font>
4. [苹果开源网站](https://opensource.apple.com/)
5. 大小端模式，iOS属于小端模式。比如数据0x1234存放在地址0x4000和0x4001上，小端模式是```0x4000:0x34, 0x4001:0x12```, 高位数据`0x12`存放在高位地址`0x4001`上；大端则相反。 
6. NSObject alloc的时候系统会分配16个字节的内存，但是isa指针只会占用8个字节。
7. `class_getInstanceSize实际上是data()->ro->instanceSize`，所以这个数据是不一定准确的。



#### 总结

这一天的主要内容是为了验证NSObject是结构体，并且粗略地讲述了结构体的内存布局。



### day2要点

1. libmalloc
2. 操作系统的内存对齐
3. 在iOS系统中，堆空间分配内存都是16的倍数；在libmalloc源码中寻找bucket；<font color='orange'>可以解决要点1中的问题3 第十四、十五节课重点关注</font>
4. <font color='pink'><u>如果是动态添加`property`，那么`class_getInstanceSize`的返回值会是多少？</u></font><font color='orange'>答案在`day2要点`->知识点4</font>
5. sizeof是运算符，不是函数。
6. <font color='pink'>类对象和元类对象都是class，他们的结构是一样的，那么类对象中是否有一个结构是元类方法列表呢？在学习方法列表的时候多注意一下；</font><font color='orange'>并不是，他俩的存储位置应该是一样的，只是一个表示的是对象方法，一个表示的是类方法。</font>
7. `class_isMetaClass`的原理应该是在`isa_t`的结构中存有`metaclass`的`flag`标记；
8. objc_getClass, ojbect_getClass, class可以从源码的角度来看这三者的区别；
9. gnu内存分配，malloc_alignment<font color='orange'>十五节</font>



#### 知识点

1. `__LP64__ `表示`long`和`pointer`都是64位；
2. 求一个数能被8整除的最小数，同理可以推算出被2，4，16，32等整除的最小数

``` objective-c
#   define WORD_MASK 7UL
uint32_t word_align1(uint32_t x) {
    uint32_t t1 = x + WORD_MASK;
    unsigned long t2 = ~WORD_MASK;
    return t1 & t2;
// 精简写法
//    return (x + WORD_MASK) & ~WORD_MASK;
}
```

3. `class_getInstanceSize()`和`malloc_size()`的区别

```objective-c
size_t class_getInstanceSize(Class cls)
{
    if (!cls) return 0;
    return cls->alignedInstanceSize();
}

// Class's ivar size rounded up to a pointer-size boundary.
uint32_t alignedInstanceSize() {
    return word_align(unalignedInstanceSize());
}

static inline uint32_t word_align(uint32_t x) {
    return (x + WORD_MASK) & ~WORD_MASK;
}
    
```

```objective-c
malloc_size(),找了libmalloc和glib，并没有弄清楚。最终通过视频可以知道，在iOS堆中分配内存的最小单位是16；而class_getinstanceSize的最小内存对齐单位是8。
```



4. 如果动态添加`property`，那么`class_getInstanceSize`会发生变化吗？

<font color='orange'>不会发生变化，首先`class_getInstanceSize`他试用的是`data()->ro->instancesize`，而动态添加`property`并不会影响`data()->ro->instancesize`的大小</font>

```objective-c
size_t class_getInstanceSize(Class cls)
{
    if (!cls) return 0;
    return cls->alignedInstanceSize();
}

// Class's ivar size rounded up to a pointer-size boundary.
uint32_t alignedInstanceSize() {
    return word_align(unalignedInstanceSize());
}

// May be unaligned depending on class's ivars.
uint32_t unalignedInstanceSize() {
   assert(isRealized());
   return data()->ro->instanceSize;
}
```



### day3要点--isa和superClass

1. isa和superclass

2. 一般后缀名是_t表示的是table；

3. 想要看清class内部的结构，需要自己手动构建一个和objc_class一样的结构去强制转换；

4. 主要是查看类的内存结构，查看属性的位置，方法列表的位置；

   ```objective-c
   struct objc_class : objc_object {
       // Class ISA;
       Class superclass;
       cache_t cache;             // formerly cache pointer and vtable
       class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
   
       class_rw_t *data() { 
           return bits.data();
       }
    }
   ```

   

5. <font color='orange'>重点查看28节；</font>



### day4要点--KVO

1. 在`addObserver`的时候有个参数`context`，可以用作传值，`context`传什么值，在接收的时候就是什么值；

   ```objective-c
   - (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
   ```

2. 流程addObserver-->替换isa-->重写setter方法
3. 如何验证重写了setter方法？获取IMP实现，查看地址是否一样；
4. 















