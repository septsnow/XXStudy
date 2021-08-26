//
//  ViewController.m
//  FFEventChain
//
//  Created by 陈晨 on 2021/3/15.
//

#import "ViewController.h"
#import "AView.h"
#import "BView.h"
#import "CView.h"
#import "DView.h"
#import "EView.h"
#import "FView.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    AView* aView = [[AView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    BView* bView = [[BView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    CView* cView = [[CView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    DView* dView = [[DView alloc] initWithFrame:CGRectMake(70, 70, 200, 200)];
    EView* eView = [[EView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    FView* fView = [[FView alloc] initWithFrame:CGRectMake(150, 150, 50, 50)];
    
    [self.view addSubview:aView];
    [aView addSubview:bView];
    [bView addSubview:cView];
    
    [aView addSubview:dView];
    [dView addSubview:eView];
    [dView addSubview:fView];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 400, 100, 30);
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)buttonAction:(UIButton *)sender {
    SecondViewController* sVc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:sVc animated:YES];
}


@end
