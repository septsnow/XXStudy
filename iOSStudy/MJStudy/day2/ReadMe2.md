### 要点

1. libmalloc
2. 操作系统的内存对齐
3. 在iOS系统中，堆空间分配内存都是16的倍数；在libmalloc源码中寻找bucket；<font color='orange'>可以解决要点1中的问题3 第十四、十五节课重点关注</font>
4. <font color='pink'>如果是动态添加`property`，那么`class_getInstanceSize`的返回值会是多少？</font>
5. sizeof是运算符，不是函数。
6. <font color='pink'>类对象和元类对象都是class，他们的结构是一样的，那么类对象中是否有一个结构是元类方法列表呢？在学习方法列表的时候多注意一下；</font>
7. `class_isMetaClass`的原理应该是在`isa_t`的结构中存有`metaclass`的`flag`标记；
8. objc_getClass, ojbect_getClass, class可以从源码的角度来看这三者的区别；
9. gnu内存分配，malloc_alignment<font color='orange'>十五节</font>



### 知识点

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
malloc_size(),找了libmalloc和glib，并没有弄清楚。最终通过视频可以知道，在iOS堆中分配内存的最小单位是16；
```



