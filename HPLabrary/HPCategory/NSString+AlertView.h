//
//  NSString+AlertView.h
//  smi
//
//  Created by 王辉平 on 15/7/1.
//  Copyright (c) 2015年 王辉平. All rights reserved.
//  作用：对话框提示

@interface NSString(AlertView)
+(void)showAlertWithString:(NSString*)string UIView:(UIView*)bgView;
+(void)showAlertWithString:(NSString*)string;
+ (void)displayHUB:(NSString *)text;
@end
