//
//  ViewController.m
//  Interview-01
//
//  Created by 陈晨 on 2021/8/27.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) Person* person1;
@property (strong, nonatomic) Person* person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person1 = [[Person alloc] init];
    self.person2 = [[Person alloc] init];
    
    
    
    [self.person1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    // NSKVONotifying_Person
    Class cls = object_getClass(self.person1);
    
    NSLog(@"superClass is %p", class_getSuperclass(cls));
    NSLog(@"xx");
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.person1.age = 18;
//    self.person2.age = 20;
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"keypath %@, object %@, change %@, context %s", keyPath, object, change, context);
}

@end
