#  说明
### NSTimer, displayLink, dispatch_timer
NSTimer和displayLink(以下都简写成timer)会强持有target, runloop->timer,  timer->target, target->timer, 虽然表面看起来target->timer似乎构成了循环引用, 但这不是主因, 我们把timer设置成weak也是一样的结果, timer不会释放.
所以我们要解决的问题是两个:
1. target->timer, timer->target构成的循环引用问题;
2. runloop->timer, timer->target构成的target无法释放的问题.

我们之前在解决block循环引用的时候, 会使用__weak来解决, 但是这次不行. 因为在block中, 我们使用__weak会使block底层代码生成对应的weak属性的变量, 但是在timer中是强指针直接指向我们的target.

从上面两个问题我们可以看出, 不论是问题1还是问题2, 如果timer不是强持有target, 那我们的target就可以正常释放, 然后在target的delloc中销毁timer就可以完美结果这两个问题了.

所以这次的思路应该是加入一个第三方C, 由timer->C, 同时C->(弱引用)target. 所以最终的结构是runloop->timer, timer->C, C->(弱引用)target. 
这里的C我选择了两种, 
1是NSProxy;
2是[target class].
