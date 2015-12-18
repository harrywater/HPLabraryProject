//
//  NSString+NetWork.m
//  smi
//
//  Created by 王辉平 on 15/7/16.
//
//

#import "NSString+NetWork.h"
#import "Reachability.h"

@implementation NSString (NetWork)

#pragma mark - 获取网络状态
//这种方法的缺点是不能知道用户使用的手机网络是2G、3G还是4G
+(NSString *)internetStatus{
    
    Reachability *reachability   = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    NSString *net = @"wifi";
    switch (internetStatus) {
        case ReachableViaWiFi:
            net = @"wifi";
            break;
            
        case ReachableViaWWAN:
            net = @"wwan";
            break;
            
        case NotReachable://没网络
            net = @"notReachable";
            
        default:
            break;
    }
    
    return net;
}
/*
 *区分2G、3G、4G、LTE
 *需要注意的是，使用这种方法时一定要保证statusbar没有隐藏。如果你的App隐藏了statusbar，那么你也就不能通过这种方法获得网络状态。
 */
+ (NSString *)networkingStatesFromStatebar{
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    NSString *stateString = @"wifi";
    
    switch (type) {
        case 0:
            stateString = @"notReachable";
            break;
            
        case 1:
            stateString = @"2G";
            break;
            
        case 2:
            stateString = @"3G";
            break;
            
        case 3:
            stateString = @"4G";
            break;
            
        case 4:
            stateString = @"LTE";
            break;
            
        case 5:
            stateString = @"wifi";
            break;
            
        default:
            break;
    }
    
    return stateString;
}
@end
