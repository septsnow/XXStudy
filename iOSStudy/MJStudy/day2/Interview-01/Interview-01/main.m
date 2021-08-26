//
//  main.m
//  Interview-01
//
//  Created by 陈晨 on 2021/8/20.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>


@interface Person : NSObject
//@property (assign, nonatomic) NSInteger age;
//@property (strong, nonatomic) Person* son;
//@property (copy,   nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger height;

@end

@implementation Person



@end

// 自己实现同样的功能
uint32_t word_align2(uint32_t x) {
    uint32_t t = x % 8;
    if (t > 0) {
        return (x+8)/8*8;
    } else {
        return x/8*8;
    }
}

#   define WORD_MASK 7UL
uint32_t word_align1(uint32_t x) {
    uint32_t t1 = x + WORD_MASK;
    unsigned long t2 = ~WORD_MASK;
    return t1 & t2;
//    return (x + WORD_MASK) & ~WORD_MASK;
}

void word_align_test() {
    for (int i = 1; i <= 10000; i ++) {
        printf("%u -- %u\n", word_align1(i), word_align2(i));
    }
    NSObject* ob = [[NSObject alloc] init];
    malloc_size((__bridge void*)ob);
}


void class_test() {
    NSObject* obj = [[NSObject alloc] init];
    
    NSLog(@"class方法 %p", [obj class]);
    NSLog(@"objc_getClass方法 %p", objc_getClass("NSObject"));
    NSLog(@"object_getClass方法 %p", object_getClass(obj));
    NSLog(@"object_getClass方法 %p", object_getClass(object_getClass(obj)));

    
    NSLog(@"objc_getClass student 方法 %p", objc_getClass("Student"));
    
}

id getter(id object,SEL _cmd1){
    NSString *key = NSStringFromSelector(_cmd1);
    return objc_getAssociatedObject(object, (__bridge const void * _Nonnull)(key));
}
void setter(id object,SEL _cmd1,id newValue){
    NSString *key = NSStringFromSelector(_cmd1);
    key = [[key substringWithRange:NSMakeRange(3, key.length-4)] lowercaseString];
    objc_setAssociatedObject(object, (__bridge const void * _Nonnull)(key), newValue, OBJC_ASSOCIATION_RETAIN);
}

void addPropertyTest() {
    Person* p = [[Person alloc] init];
//    p.son = [[Person alloc] init];
//    p.age = 18;
    p.height = 160;
    
    NSLog(@"添加前 instancesize..->%zd", class_getInstanceSize([p class]));
    NSLog(@"添加前 mallocsize..->%zd", malloc_size((__bridge void*)p));

    
    
    //objc_property_attribute_t所代表的意思可以调用getPropertyNameList打印，大概就能猜出
    objc_property_attribute_t type = { "T", @encode(NSString) }; //type
    objc_property_attribute_t ownership0 = { "C", "" }; // C = copy
    objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
    objc_property_attribute_t backingivar  = { "V", [[NSString stringWithFormat:@"_%@", @"sex"] UTF8String] };  //variable name
    objc_property_attribute_t attrs[] = { type, ownership0, ownership,backingivar};//这个数组一定要按照此顺序才行
    BOOL add = class_addProperty([Person class], "sex", attrs, 4);
    
    

    class_addMethod([Person class], NSSelectorFromString(@"sex"), (IMP)getter, "@@:");
    class_addMethod([Person class], NSSelectorFromString(@"setSex:"), (IMP)setter, "v@:@");

    [p setValue:@"10" forKey:@"sex"];
    NSLog(@"添加后 instancesize..->%zd", class_getInstanceSize([p class]));
    NSLog(@"添加后 mallocsize..->%zd", malloc_size((__bridge void*)p));
    NSLog(@"sex is %@", [p valueForKey:@"sex"]);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 1. malloc_size和getInstanceSize
//        word_align_test();
        
        // 2. objc_getClass, object_getClass, Class的区别和联系
//        class_test();
        
        // 3. 动态添加property, getInstanceSize大小会发生变化吗?
        addPropertyTest();
        [[[NSObject alloc] init] addObserver:[NSObject new] forKeyPath:@"" options:NSKeyValueObservingOptionNew context:NULL];
        
    }
    return 0;
}

