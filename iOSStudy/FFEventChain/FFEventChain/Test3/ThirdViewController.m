//
//  ThirdViewController.m
//  FFEventChain
//
//  Created by humour on 2021/3/18.
//

#import "ThirdViewController.h"
#import "FFTableView.h"
#import "FFTableViewCell.h"
#import "FFTapOne.h"
#import "FFTapTwo.h"
#import "YellowView.h"
#import "FFTapThree.h"

@interface ThirdViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) FFTableView* tableView;
@property (nonatomic, strong) NSMutableArray* dataSourceArray;

@property (nonatomic, strong) YellowView* yellowView;


@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.dataSourceArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 30; i ++) {
        [_dataSourceArray addObject:[NSString stringWithFormat:@"%i", i]];
    }
    
    [self.view addSubview:self.tableView];
    
//    UIView* view = [[UIView alloc] initWithFrame:self.view.bounds];
//    [view addSubview:self.yellowView];
//    
//    
//    
//    UIView* twoView = [[UIView alloc] initWithFrame:self.view.bounds];
//    [twoView addSubview:view];
//    [self.view addSubview:twoView];
//    
//    FFTapOne* tap = [[FFTapOne alloc] initWithTarget:self action:@selector(tapClick)];
//    [view addGestureRecognizer:tap];
//    
//    
//    FFTapTwo* tapTwo = [[FFTapTwo alloc] initWithTarget:self action:@selector(tapClickTwo)];
//    [twoView addGestureRecognizer:tapTwo];
//    
//    
//    FFTapThree* tapThrr = [[FFTapThree alloc] initWithTarget:self action:@selector(tapClickTwo)];
//    [self.view addGestureRecognizer:tapThrr];
    
}

- (void)tapClick {
    NSLog(@"view view view!!!...");
}

- (void)tapClickTwo {
    NSLog(@"self.view view view!!!...");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FFTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"index_"];
    if (!cell) {
        cell = [[FFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"index_"];
    }
    cell.textLabel.text = _dataSourceArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%@", [NSString stringWithFormat:@"%ld", indexPath.row]);
}


- (FFTableView *)tableView {
    if (!_tableView) {
        self.tableView = [[FFTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        
    }
    return _tableView;
}


- (YellowView *)yellowView {
    if (!_yellowView) {
        self.yellowView = [[YellowView alloc] initWithFrame:self.view.bounds];
    }
    return _yellowView;
}

@end
