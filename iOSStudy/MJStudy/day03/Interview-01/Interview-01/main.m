//
//  main.m
//  Interview-01
//
//  Created by 陈晨 on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSObject+Extension.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        [Person run];
        NSLog(@"person class is %p", [Person class]);
        
    }
    return 0;
}
