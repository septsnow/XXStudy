//
//  YellowView.m
//  FFEventChain
//
//  Created by humour on 2021/3/18.
//

#import "YellowView.h"

@implementation YellowView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"yellow hit  test");
    
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"yellow point...");
    return [super pointInside:point withEvent:event];
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yellow touch end");
    
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yellow touch begin");
    
    [super touchesBegan:touches withEvent:event];
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yellow touch cancel");
    [super touchesCancelled:touches withEvent:event];
}


@end
