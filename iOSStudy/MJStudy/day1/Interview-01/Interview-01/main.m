//
//  main.m
//  Interview-01
//
//  Created by humour on 2021/8/18.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import "Person.h"
#import "Student.h"


struct NSObject_IMPL {
    Class isa;
};




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person* obj = [[Person alloc] init];
       
        struct NSObject_IMPL* p = (__bridge struct NSObject_IMPL *)(obj);
        
        NSLog(@"地址是%p", [obj class]);
        // 0x00007ffffffffff8
        // 打印Person实例对象的所占内存大小
        NSLog(@"person instancesize is %zd", class_getInstanceSize([obj class])); // 8
        
        // 打印obj所指向的对象的所分配内存空间大小
        NSLog(@"person malloc_size is %zd", malloc_size((__bridge void *)obj)); // 16
        
        
        Student* student = [[Student alloc] init];
        student.age = 18;
        // 打印Student实例对象的所占内存大小
        NSLog(@"Student instancesize is %zd", class_getInstanceSize([student class])); // 12
        
        // 打印obj所指向的对象的所分配内存空间大小
        NSLog(@"Student malloc_size is %zd", malloc_size((__bridge void *)student)); // 16
        
        
        
        // xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main.cpp
        
//        NSObject* obj = (objc_msgSend)((objc_msgSend)(objc_getClass("NSObject"), sel_registerName("alloc")), sel_registerName("init"));
        
    }
    return 0;
}
