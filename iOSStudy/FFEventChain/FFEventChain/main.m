//
//  main.m
//  FFEventChain
//
//  Created by 陈晨 on 2021/3/15.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FFApplication.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
//    return FFApplicationMain(argc, argv, nil, appDelegateClassName);
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
