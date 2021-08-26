//
//  Student.h
//  Interview-01
//
//  Created by 陈晨 on 2021/8/19.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : Person

@property (assign, nonatomic) int age;
@property (copy,   nonatomic) NSString* name;

@property (assign, nonatomic) int sex;

@end

NS_ASSUME_NONNULL_END
