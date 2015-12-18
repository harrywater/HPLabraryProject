//
//  NSDate+covertDate.h
//  smi
//
//  Created by 王辉平 on 15/6/26.
//
//

#import "NSDate+CovertDate.h"

@implementation NSDate (CovertDate)
+ (NSString *)covertDateFromNum:(long long)num {

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:num / 1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日";
    NSString *string = [formatter stringFromDate:date];
    return string;
}

+ (NSString *)covertDateWithNum:(long long)num {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:num / 1000];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *string = [formatter stringFromDate:date];
    return string;
}
+ (long long)coverDate:(NSDate *)date {
    
    return [date timeIntervalSince1970] * 1000;
}

//今天  昨天  前天   年月日时分
-(NSString *)myDateListTimeShowWithDate:(NSDate *)date
{

    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *yesterday, *beforeYesterday;
    
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    beforeYesterday = [today dateByAddingTimeInterval:-2*secondsPerDay];
    
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * beforeYesterString = [[beforeYesterday description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    NSDateFormatter *fomatter = [[NSDateFormatter alloc]init];
    fomatter.dateFormat = @"HH:mm";
    NSString *hourMin = [fomatter stringFromDate:date];
    fomatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSString *otherDateString = [fomatter stringFromDate:date];
    
    if ([dateString isEqualToString:todayString])
    {
        return [NSString stringWithFormat:@"今天 %@",hourMin];
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return [NSString stringWithFormat:@"昨天 %@",hourMin];
    }
    else if ([dateString isEqualToString:beforeYesterString])
    {
        return [NSString stringWithFormat:@"前天 %@",hourMin];
    }
    else
    {
        return otherDateString;
    }


    
}



@end
