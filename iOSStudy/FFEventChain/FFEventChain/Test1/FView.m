//
//  FView.m
//  FFEventChain
//
//  Created by 陈晨 on 2021/3/16.
//

#import "FView.h"

@implementation FView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    return [super pointInside:point withEvent:event];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    
    NSLog(@"%@", touches);
    
    UIResponder* nextResponder = self.nextResponder;
    while (nextResponder) {
        NSLog(@"%@", nextResponder);;
        nextResponder = nextResponder.nextResponder;
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    
    NSLog(@"%@", touches);
}

@end
