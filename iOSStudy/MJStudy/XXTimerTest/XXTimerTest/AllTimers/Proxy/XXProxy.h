//
//  XXProxy.h
//  XXTimerTest
//
//  Created by 陈晨 on 2021/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XXProxy : NSProxy

+ (instancetype)proxyWithTarget:(id)target;


@end

NS_ASSUME_NONNULL_END
