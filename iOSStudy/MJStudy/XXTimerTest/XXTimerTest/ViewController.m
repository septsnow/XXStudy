//
//  ViewController.m
//  XXTimerTest
//
//  Created by 陈晨 on 2021/7/27.
//

#import "ViewController.h"
#import "TimerViewController.h"
#import "DisplayLinkViewController.h"
#import "DispatchTimerViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"timer" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 200, 30);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"displayLink" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 200, 30);
    [button addTarget:self action:@selector(buttonClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"dispatchTimer" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 300, 200, 30);
    [button addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)buttonClick {
    TimerViewController* timerVc = [[TimerViewController alloc] init];
    [self.navigationController pushViewController:timerVc animated:YES];
}

- (void)buttonClick1 {
    DisplayLinkViewController* timerVc = [[DisplayLinkViewController alloc] init];
    [self.navigationController pushViewController:timerVc animated:YES];
}

- (void)buttonClick2 {
    DispatchTimerViewController* timerVc = [[DispatchTimerViewController alloc] init];
    [self.navigationController pushViewController:timerVc animated:YES];
    
}


@end
