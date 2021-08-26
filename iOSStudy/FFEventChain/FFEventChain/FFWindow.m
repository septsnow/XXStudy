//
//  FFWindow.m
//  FFEventChain
//
//  Created by humour on 2021/3/17.
//

#import "FFWindow.h"

@implementation FFWindow

- (void)sendEvent:(UIEvent *)event {
    NSLog(@"event is %@", event);
    [super sendEvent:event];
}

@end
