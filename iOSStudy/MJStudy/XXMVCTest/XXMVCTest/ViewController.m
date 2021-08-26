//
//  ViewController.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "ViewController.h"
#import "MVCTableViewController.h"
#import "MVCMutationTableViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
#import "OnlineMVVMViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"MVC" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 130, 100, 30);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"MVC变种" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 180, 100, 30);
    [button addTarget:self action:@selector(buttonClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"MVP" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 230, 100, 30);
    [button addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"MVVM" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 280, 100, 30);
    [button addTarget:self action:@selector(buttonClick3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"OnlineMVVM" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 330, 100, 30);
    [button addTarget:self action:@selector(buttonClick4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}


- (void)buttonClick {
    MVCTableViewController* vc = [[MVCTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonClick1 {
    MVCMutationTableViewController* vc = [[MVCMutationTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonClick2 {
    MVPViewController* vc = [[MVPViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonClick3 {
    MVVMViewController* vc = [[MVVMViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buttonClick4 {
    OnlineMVVMViewController* vc = [[OnlineMVVMViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
