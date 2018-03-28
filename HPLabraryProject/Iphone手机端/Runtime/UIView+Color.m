//
//  UIView+Color.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2018/3/5.
//  Copyright © 2018年 王辉平. All rights reserved.
//

#import "UIView+Color.h"
#import <objc/runtime.h>
 NSString* hpS = @"666";
@implementation UIView (Color)

+(void)load
{
    /*
    //0、load方法在
    //+ load 作为 Objective-C 中的一个方法，与其它方法有很大的不同。
    //它只是一个在整个文件被加载到运行时，在 main 函数调用之前被 ObjC 运行时调用的钩子方法
    //如果在类与分类中都实现了 load 方法，它们都会被调用
    //1、获取自定义交互的方法
    Method exMethod = class_getInstanceMethod([self class], @selector(ex_setBackGroundColor:));
    //2、获取系统方法
    Method originMethod = class_getInstanceMethod([self class], @selector(setBackgroundColor:));
    //3、交换实现【ex_setBackGroundColor  的实现代码交换到setBackgroundColor中，setBackgroundColor的实现代码交换到ex_setBackGroundColor】
    method_exchangeImplementations(exMethod, originMethod);
    */
    
}
- (void)ex_setBackGroundColor:(UIColor*)color
{
    //交换实现的内容 以下的实现被交换到setBackgroundColor中，setBackgroundColor的实现交换到ex_setBackGroundColor中
    NSLog(@"func====%s",__FUNCTION__);
    /*
     1、此时调用的方法 'pb_setBackgroundColor' 相当于调用系统的 'setBackgroundColor' 方法,原因是在load方法中进行了方法交换.（此处并没有递归操作.）
     */
    [self ex_setBackGroundColor:[UIColor redColor]];
}
@end
