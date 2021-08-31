//
//  main.m
//  Interview-01KVC
//
//  Created by 陈晨 on 2021/8/28.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "XXObserver.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        XXObserver* observe = [XXObserver new];
        Person* p = [Person new];
        
        [p addObserver:observe forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:NULL];
        
        [p setValue:@(10) forKey:@"age"];
        
        
    }
    return 0;
}
