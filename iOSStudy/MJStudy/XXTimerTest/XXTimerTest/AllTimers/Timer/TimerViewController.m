//
//  TimerViewController.m
//  XXTimerTest
//
//  Created by 陈晨 on 2021/7/27.
//

#import "TimerViewController.h"
#import "XXProxy.h"

typedef void(^Block)(id);

@interface TimerViewController ()
@property (strong, nonatomic) NSTimer* timer;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
/// !!!: 这里是关于内存管理
    // 方案1
//    [self test1];
    
    // 方案2
//    [self test2];
    
    // 方案3
    [self test3];

}


- (void)test1 {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[XXProxy proxyWithTarget:self] selector:@selector(tikTok1) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)test2 {
    __weak typeof(self) weakSelf = self;
    Block block = ^(id param) {
        __strong typeof(weakSelf) self = weakSelf;
        [self tikTok2:param];
    };
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[self class] selector:@selector(tikTok:) userInfo:@{@"block":block, @"param":@"参数..."} repeats:YES];
}


- (void)test3 {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"tiktok3...");
    }];
}

- (void)tikTok1 {
    NSLog(@"tiktok1...");
}

- (void)tikTok2:(id)param {
    NSLog(@"tiktok2...%@", param);
}

+ (void)tikTok:(NSTimer *)timer {
    NSDictionary* dic = timer.userInfo;
    Block block = dic[@"block"];
    id param = dic[@"param"];
    if (block) {
        block(param);
    }
}

- (void)dealloc
{
    [self.timer invalidate];
    NSLog(@"%@ dealloc!!!", self);
}


@end
