//
//  MVPViewController.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "MVPViewController.h"
#import "Presenter.h"


@interface MVPViewController ()
@property (strong, nonatomic) Presenter* presenter;
@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.presenter = [[Presenter alloc] initWithController:self];
    
}



@end
