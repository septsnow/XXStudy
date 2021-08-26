//
//  MVCMutationTableViewController.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "MVCMutationTableViewController.h"
#import "MVCMutationModel.h"
#import "MVCMutationTableViewCell.h"

@interface MVCMutationTableViewController () <MVCMutationDelegate>
@property (strong, nonatomic) NSMutableArray* datasourceArray;

@end

@implementation MVCMutationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasourceArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 10; i ++) {
        MVCMutationModel* model = [[MVCMutationModel alloc] init];
        model.name = [NSString stringWithFormat:@"名称_%d", i];
        model.age = i + 15;
        [_datasourceArray addObject:model];
    }
    
    [self.tableView registerClass:[MVCMutationTableViewCell class] forCellReuseIdentifier:@"index"];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVCMutationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"index" forIndexPath:indexPath];
    cell.delegate = self;
    MVCMutationModel* model = _datasourceArray[indexPath.row];
    
    // Configure the cell...
    cell.model = model;
    return cell;
}

#pragma mark - MVCMutationDelegate
- (void)didClick {
    NSLog(@"接收到点击事件...");
}


@end
