//
//  UIColor+Hex.h
//  BaiduNews
//
//  Created by JHorn on 11-8-1.
//  Copyright 2011 Baidu.com. All rights reserved.
//
//  作用:RGB颜色值 设置转换成UIColor对象

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *) colorWithHex:(uint) hex;
+ (UIColor *) colorWithARGBHex:(uint) hex;
+ (void)colorWithHex:(uint)hex red:(int *)red green:(int *)green blue:(int *)blue alpha:(int *)alpha;

+ (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;

+ (UIColor *) colorWithDefaultGreenColor;

+ (UIColor *) colorWithDefaultLightGrayColor;

+ (UIColor *) colorWithDefaultDarkGrayColor;

+ (UIColor *) colorWithDefaultTextColor;

+ (UIColor *) colorWithDefaultSeparatorColor;

@end
