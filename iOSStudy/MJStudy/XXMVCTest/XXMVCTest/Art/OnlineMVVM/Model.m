//
//  Model.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "Model.h"

@implementation Model

+ (void)getImagesListWithPage: (NSInteger)aPage SuccessBlock:(SuccessBlock)success FailBlock:(FailBlock)fail {

    NSString *urlString = [NSString stringWithFormat:@"%@%ld%@",
    @"http://image.baidu.com/data/imgs?col=%e7%be%8e%e5%a5%b3&tag=%e5%b0%8f%e6%b8%85%e6%96%b0&sort=0&pn=1",
    aPage,@"&rn=1&p=channel&from=1"];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                NSLog(@"数据回调了...");
                success(@{@"name":@"xx"}, nil);
            }
        });
        
    });
    
    
    
//    AFHTTPRequestOperationManager *managere = [AFHTTPRequestOperationManager manager];
//    [managere GET:urlString parameters:nil
//    success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        success(responseObject,nil);
//        NSLog(@"success");
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        fail(nil,error);
//        NSLog(@"fail");
//    }];
}

@end
