//
//  HPRuntimeViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/10/24.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPRuntimeViewController.h"
#import <objc/runtime.h>
#import "HPRuntimeMethodObj.h"
#import <CoreFoundation/CoreFoundation.h>

@interface HPRuntimeViewController ()
{
    NSString* _name;
}
@property(nonatomic,copy)NSString* name;
@end

@implementation HPRuntimeViewController


- (void)viewDidLoad {
    self.name = @"aaaa";
    [self setName:@"ddddaaa"];
    [self name];
    _name = @"eeee";
    [NSRunLoop currentRunLoop];
    NSLog(@"self.name=%@=====_name=%@",self.name,_name);
    [super viewDidLoad];
    //1、交换系统方法的实现
    BOOL isAdd = class_addMethod([self class], @selector(viewWillAppear:), method_getImplementation(class_getInstanceMethod([self class], @selector(exchange_viewWillAppear:))), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(exchange_viewWillAppear:))));
    if (isAdd) {
        //新增
        //        class_replaceMethod([self class], @selector(viewWillAppear:), method_getImplementation(class_getInstanceMethod([self class], @selector(exchange_viewWillAppear:))), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(exchange_viewWillAppear:))));
    }else{
    
        method_exchangeImplementations(class_getInstanceMethod([self class], @selector(viewWillAppear:)), class_getInstanceMethod([self class], @selector(exchange_viewWillAppear:)));
    }
    //2、动态新增viewKOV方法，实现方法里面是用的是HPRuntimeMethodObj类下的viewKOV_exchange实现
//    BOOL isA = class_addMethod([self class], @selector(viewKOV), method_getImplementation(class_getInstanceMethod([HPRuntimeMethodObj class], @selector(viewKOV_exchange))), method_getTypeEncoding(class_getInstanceMethod([self class], @selector(viewKOV_exchange))));
//    if (isA) {
//        NSLog(@"断点此处做po [self viewKOV]，执行viewKOV_exchange里面代码");
//    }
  
    //3、消息实现交换
    UIView * viw = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    viw.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viw];
 
}

- (void)viewKOV
{
    NSLog(@"self == viewKOV消息实现");
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"未实现viewWillAppear");
}
- (void)exchange_viewWillAppear:(BOOL)animated
{
    NSLog(@"实现切换调用exchange_viewWillAppear");
}
@end
