//
//  GView.m
//  FFEventChain
//
//  Created by humour on 2021/3/17.
//

#import "GView.h"
#import "HView.h"

@interface GView ()

@property (nonatomic, strong) UIButton* button;

@end

@implementation GView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(150, 150, 150, 150);
        [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.button = button;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGPoint p = [self convertPoint:point toView:_button];
    if ([_button pointInside:p withEvent:event]) {
        return YES;
    }
    
    
    return [super pointInside:point withEvent:event];
}

- (void)click {
    NSLog(@"点击了... ");
}

@end
