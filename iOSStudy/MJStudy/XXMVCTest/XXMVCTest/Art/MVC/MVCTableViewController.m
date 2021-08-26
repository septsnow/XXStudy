//
//  MVCTableViewController.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "MVCTableViewController.h"
#import "MVCModel.h"

@interface MVCTableViewController ()

@property (strong, nonatomic) NSMutableArray* datasourceArray;

@end

@implementation MVCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datasourceArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 10; i ++) {
        MVCModel* model = [[MVCModel alloc] init];
        model.name = [NSString stringWithFormat:@"名称_%d", i];
        model.age = i + 15;
        [_datasourceArray addObject:model];
    }
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"index"];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"index" forIndexPath:indexPath];
    
    MVCModel* model = _datasourceArray[indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = model.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了事件...");
}

@end
