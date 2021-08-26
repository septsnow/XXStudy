//
//  SecondViewController.m
//  FFEventChain
//
//  Created by humour on 2021/3/17.
//

#import "SecondViewController.h"
#import "GView.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    GView* gView = [[GView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    [self.view addSubview:gView];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 400, 100, 30);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)buttonAction:(UIButton *)sender {
    ThirdViewController* sVc = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:sVc animated:YES];
}


@end
