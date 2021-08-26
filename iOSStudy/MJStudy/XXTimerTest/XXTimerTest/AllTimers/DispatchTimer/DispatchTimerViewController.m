//
//  DispatchTimerViewController.m
//  XXTimerTest
//
//  Created by 陈晨 on 2021/7/27.
//

#import "DispatchTimerViewController.h"
#import <objc/runtime.h>

@interface DispatchTimerViewController ()

@property (strong, nonatomic) dispatch_source_t timer;

@end

@implementation DispatchTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t queue = dispatch_queue_create("myTimerQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), 0.5 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        NSLog(@"我曹...%@", [NSThread currentThread]);
    });
    dispatch_resume(timer);
    self.timer = timer;
    
}

- (void)dealloc
{
    dispatch_source_cancel(self.timer);
    NSLog(@"%@ dealloc!!!", self);
}


@end
