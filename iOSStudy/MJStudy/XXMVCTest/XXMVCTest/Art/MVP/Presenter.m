//
//  Presenter.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "Presenter.h"
#import "MVPTableViewCell.h"
#import "MVPModel.h"

@interface Presenter () <UITableViewDelegate, UITableViewDataSource, MVPDelegate>

@property (weak,   nonatomic) UIViewController* controller;

@property (strong, nonatomic) UITableView* tableView;
@property (strong, nonatomic) NSMutableArray* datasourceArray;

@end

@implementation Presenter

- (instancetype)initWithController:(UIViewController *)vc {
    self = [super init];
    if (self) {
        self.controller = vc;
        // 加载数据
        [self setupDatas];
        // 创建视图
        [self setupViews];
    }
    return self;
}

#pragma mark - setups
- (void)setupViews {
    [self.controller.view addSubview:self.tableView];
    
}

- (void)setupDatas {
    self.datasourceArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 30; i > 0; i --) {
        MVPModel* model = [[MVPModel alloc] init];
        model.name = [NSString stringWithFormat:@"小丽啊_%i", i];
        [_datasourceArray addObject:model];
    }
}



#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVPTableViewCell* cell = [MVPTableViewCell cellWithTableView:tableView];
    cell.delegate = self;
    MVPModel* model = _datasourceArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - MVPDelegate
- (void)didClick {
    NSLog(@"接收到点击事件...");
}


#pragma mark - views
- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:self.controller.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
