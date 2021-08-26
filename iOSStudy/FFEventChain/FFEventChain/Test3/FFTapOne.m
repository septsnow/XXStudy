//
//  FFTapOne.m
//  FFEventChain
//
//  Created by humour on 2021/3/18.
//

#import "FFTapOne.h"

@implementation FFTapOne

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch one begin");
    [super touchesBegan:touches withEvent:event];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch one end");
    [super touchesEnded:touches withEvent:event];
}

@end
