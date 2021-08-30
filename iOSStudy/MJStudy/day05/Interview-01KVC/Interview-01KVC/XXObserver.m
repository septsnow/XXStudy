//
//  XXObserver.m
//  Interview-01KVC
//
//  Created by 陈晨 on 2021/8/28.
//

#import "XXObserver.h"

@implementation XXObserver


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"监听到对象%@值%@改变, 改变了%@", object, keyPath, change);
    
}

@end
