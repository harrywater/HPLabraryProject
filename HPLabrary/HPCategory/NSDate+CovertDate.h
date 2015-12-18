//
//  NSDate+covertDate.h
//  smi
//
//  Created by 王辉平 on 15/6/26.
//
//作用:时间格式转换

#import <Foundation/Foundation.h>

@interface NSDate (CovertDate)
//把从服务器取得的时间long类型转换成日期--xx月xx日
+ (NSString *)covertDateFromNum:(long long )num;
//把从服务器取得的时间long类型转换成日期--xxxx年-xx月-xx日
+ (NSString *)covertDateWithNum:(long long)num;
+ (long long)coverDate:(NSDate *)date;

//我的约会时间显示
-(NSString *)myDateListTimeShowWithDate:(NSDate *)date;

@end
