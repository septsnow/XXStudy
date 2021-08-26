//
//  KVOCellViewModel.m
//  XXMVCTest
//
//  Created by 陈晨 on 2021/7/29.
//

#import "KVOCellViewModel.h"
#import "MVVMModel.h"
#import "KVOController.h"

@interface KVOCellViewModel ()

@property (copy,   nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;

@end

@implementation KVOCellViewModel
- (instancetype)initWithMVVMModel:(MVVMModel *)model {
    self = [super init];
    if (self) {
        [self.KVOController observe:self keyPath:@"name" options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
                    
        }];;
    }
    return self;
}



@end
