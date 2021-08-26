//
//  FFTapThree.m
//  FFEventChain
//
//  Created by humour on 2021/3/18.
//

#import "FFTapThree.h"

@implementation FFTapThree

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch three begin");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch three end");
    [super touchesEnded:touches withEvent:event];
}


@end
