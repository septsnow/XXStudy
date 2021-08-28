//
//  Person.m
//  Interview-01
//
//  Created by 陈晨 on 2021/8/27.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age {
    _age = age;
    NSLog(@"%@ 调用了setAge方法", self);
}

@end
