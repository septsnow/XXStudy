//
//  Person.m
//  Interview-01KVC
//
//  Created by 陈晨 on 2021/8/28.
//

#import "Person.h"

@implementation Person

- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"willChangeValueForKey 前");
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey  后");
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"didChangeValueForKey  前");
    [super didChangeValueForKey:key];
    NSLog(@"didChangeValueForKey  后");
}

@end
