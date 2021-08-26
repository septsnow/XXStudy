//
//  MVPTableViewCell.h
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import <UIKit/UIKit.h>
@class MVPModel;

NS_ASSUME_NONNULL_BEGIN

@protocol MVPDelegate <NSObject>

@optional
- (void)didClick;

@end

@interface MVPTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (strong, nonatomic) MVPModel* model;
@property (weak,   nonatomic) id <MVPDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
