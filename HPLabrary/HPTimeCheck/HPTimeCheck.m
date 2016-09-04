//
//  HPTimeCheck.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/2/5.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPTimeCheck.h"

@implementation HPTimeCheck
+(BOOL)checkTimeIsmatured{
    NSUserDefaults* userDefaults=[NSUserDefaults standardUserDefaults];
    NSDate* checkDate=[userDefaults objectForKey:@"appinitDate"];
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter  setDateFormat:@"yyyy-MM-dd HH:mm"];
    if (!checkDate) {//第一次启动 记录时间
        NSString *firstDateStr = @"2016-02-06 14:00";//设置启动是时间轴
        //        NSString *firstDateStr = [dateFormatter stringFromDate:[NSDate date]];
        DLog(@"初始化time---%@",firstDateStr);
        NSDate *appinitDate=[dateFormatter dateFromString:firstDateStr];
        [userDefaults setObject:appinitDate forKey:@"appinitDate"];
    }else {
        //        NSString *currentDateStr =@"2016-03-06 18:00";
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
        DLog(@"现在时间----%@",currentDateStr);
        NSDate*nowDate=[dateFormatter dateFromString:currentDateStr];
        NSTimeInterval time11=[nowDate timeIntervalSinceDate:checkDate];
        int hours=((int)time11)/(3600*24);//时间差：小时
        if (hours>=30) {//30天后提示到期
            return YES;
        }
    }
    return NO;
}
@end
