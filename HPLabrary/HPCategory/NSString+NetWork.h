//
//  NSString+NetWork.h
//  smi
//
//  Created by 王辉平 on 15/7/16.
//
//  作用:判断网络是否存在，属于2G 3G 4G wifi 判断

@interface NSString (NetWork)
+(NSString *)internetStatus;
+ (NSString *)networkingStatesFromStatebar;
@end
