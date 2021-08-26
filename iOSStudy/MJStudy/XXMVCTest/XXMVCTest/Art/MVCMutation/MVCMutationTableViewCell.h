//
//  MVCMutationTableViewCell.h
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import <UIKit/UIKit.h>
@class MVCMutationModel;

@protocol MVCMutationDelegate <NSObject>

@optional
- (void)didClick;

@end

NS_ASSUME_NONNULL_BEGIN

@interface MVCMutationTableViewCell : UITableViewCell

@property (strong, nonatomic) MVCMutationModel* model;
@property (weak,   nonatomic) id <MVCMutationDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
