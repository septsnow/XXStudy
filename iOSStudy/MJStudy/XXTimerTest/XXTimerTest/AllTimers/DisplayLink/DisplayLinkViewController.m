//
//  DisplayLinkViewController.m
//  XXTimerTest
//
//  Created by 陈晨 on 2021/7/27.
//

#import "DisplayLinkViewController.h"
#import "XXProxy.h"
#import <objc/runtime.h>

typedef void(^Block)(id);

@interface DisplayLinkViewController ()
@property (strong, nonatomic) CADisplayLink* displayLink;

@end

@implementation DisplayLinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
/// !!!: 这里是关于内存管理
    // 方案1
//    [self test1];
    
    // 方案2
    [self test2];

}


- (void)test1 {
    self.displayLink = [CADisplayLink displayLinkWithTarget:[XXProxy proxyWithTarget:self] selector:@selector(tikTok1)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)test2 {
        __weak typeof(self) weakSelf = self;
        Block block = ^(id param) {
            __strong typeof(weakSelf) self = weakSelf;
            [self tikTok2:param];
        };
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:[self class] selector:@selector(tikTok:)];
    objc_setAssociatedObject(self.displayLink, "link", @{@"block":block, @"param":@"参数..."}, OBJC_ASSOCIATION_RETAIN);
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)tikTok1 {
    NSLog(@"tiktok1...");
}

- (void)tikTok2:(id)param {
    NSLog(@"tiktok2...%@", param);
}

+ (void)tikTok:(CADisplayLink *)link {
    
    NSDictionary* dic = objc_getAssociatedObject(link, "link");
    Block block = dic[@"block"];
    id param = dic[@"param"];
    if (block) {
        block(param);
    }
}

- (void)dealloc
{
    [self.displayLink invalidate];
    NSLog(@"%@ dealloc!!!", self);
}


@end
