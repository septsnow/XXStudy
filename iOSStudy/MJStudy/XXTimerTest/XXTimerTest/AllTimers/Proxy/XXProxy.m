//
//  XXProxy.m
//  XXTimerTest
//
//  Created by 陈晨 on 2021/7/27.
//

#import "XXProxy.h"

@interface XXProxy ()

@property (weak,   nonatomic) id target;

@end

@implementation XXProxy

+ (instancetype)proxyWithTarget:(id)target {
    XXProxy* proxy = [self alloc];
    proxy.target = target;
    return proxy;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:_target];
}


@end
