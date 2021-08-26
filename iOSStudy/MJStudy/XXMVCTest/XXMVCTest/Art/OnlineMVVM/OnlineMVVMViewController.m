//
//  OnlineMVVMViewController.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "OnlineMVVMViewController.h"
#import "ViewModel.h"

@interface OnlineMVVMViewController ()


@property (strong,nonatomic) ViewModel *viewModel;

@property (strong,nonatomic) UITextView *showTextView;

@end


@implementation OnlineMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.viewModel = [[ViewModel alloc] init];
    
    // requestData
    [self _initViews];
    [self setupKVO];
    [self.viewModel getImagesList];

}
#pragma mark - KVO
- (void)setupKVO {
    [self.viewModel addObserver:self
    forKeyPath:@"racMsg" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
}

- (void)removeKVO {
    [self.viewModel removeObserver:self forKeyPath:@"racMsg"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
         change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"racMsg"]) {
        if ([_viewModel.racMsg isEqualToString:@"success"]) {
            _showTextView.text = [NSString stringWithFormat:@"%@",_viewModel.data];
        }
        else {
            _showTextView.text = @"error";
        }
    }
}

#pragma mark - Event Response
- (void)getPre {
    [self.viewModel getPreImagesList];
}

- (void)getNext {
    [self.viewModel getNextImagesList];
}

#pragma mark - Private
- (void)_initViews {
    UIButton *preBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 50, 200, 40)];
    [preBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [preBtn setTitle:@"Pre" forState:UIControlStateNormal];
    [preBtn addTarget:self action:@selector(getPre) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:preBtn];

    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 150, 200, 40)];
    [nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [nextBtn setTitle:@"nextBtn" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(getNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];

    _showTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 200, 320, 200)];
    _showTextView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_showTextView];

}


- (void)dealloc {
    [self removeKVO];
}

@end
