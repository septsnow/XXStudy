//
//  Model.h
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import <Foundation/Foundation.h>


typedef void(^SuccessBlock)(NSDictionary*, NSError*);
typedef void(^FailBlock)(NSDictionary*, NSError*);

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic, copy) NSString *col;

@property (nonatomic, copy) NSString *sort;

@property (nonatomic, copy) NSString *tag3;

@property (nonatomic, assign) NSInteger startIndex;

@property (nonatomic, assign) NSInteger returnNumber;

@property (nonatomic, strong) NSArray *imgs;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, assign) NSInteger totalNum;

+ (void)getImagesListWithPage: (NSInteger)aPage SuccessBlock :(SuccessBlock)success FailBlock :(FailBlock)fail;
NS_ASSUME_NONNULL_END
@end
