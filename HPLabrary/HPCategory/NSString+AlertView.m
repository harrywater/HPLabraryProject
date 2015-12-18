//
//  NSString+AlertView.m
//  smi
//
//  Created by 王辉平 on 15/7/1.
//  Copyright (c) 2015年 王辉平. All rights reserved.
//
//作用: 提示框显示

#import "NSString+AlertView.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
@implementation NSString(AlertView)
+ (void)displayHUB:(NSString *)text
{
    AppDelegate* appDelegate=[[UIApplication sharedApplication] delegate];
    MBProgressHUD * hud = [[MBProgressHUD alloc] initWithView:appDelegate.window ];
    [appDelegate.window addSubview:hud];
    // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    hud.customView = nil;
    // Set custom view mode
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = text;
    hud.labelFont = [UIFont systemFontOfSize:14.0];
    [hud show:YES];
    hud.removeFromSuperViewOnHide=YES;
    [hud hide:YES afterDelay:1.5];
}
+(void)showAlertWithString:string UIView:bgView{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:bgView animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = string;
    hud.detailsLabelFont = [UIFont systemFontOfSize:16];
    hud.margin = 10.f;
    if([UIScreen mainScreen].bounds.size.height==480){
        hud.yOffset = 80;
    }else if ([UIScreen mainScreen].bounds.size.height==568) {
        hud.yOffset = 50;
    }else {
        hud.yOffset = 100;
    }
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}
+(void)showAlertWithString:string{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:string delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
    [alert show];
}
@end
