//
//  ViewModel.h
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject

@property (strong,nonatomic) NSDictionary *data;
@property (strong,nonatomic) NSString *racMsg;


- (void)getImagesList;
- (void)getNextImagesList;
- (void)getPreImagesList;

@end
NS_ASSUME_NONNULL_END
