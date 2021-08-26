//
//  FFTapTwo.m
//  FFEventChain
//
//  Created by humour on 2021/3/18.
//

#import "FFTapTwo.h"

@implementation FFTapTwo

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch two begin");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch two end");
    [super touchesEnded:touches withEvent:event];
}

@end
