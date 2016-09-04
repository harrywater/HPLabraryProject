//
//  HPConstant.h
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/18.
//  Copyright © 2015年 王辉平. All rights reserved.
//

//================================公共部分==============================

//用途：打包，测试 选用release 或者debug 分别启用不同环境配置
#ifdef DEBUG
#define apiRootUrl @"http://ipiaocpy.6655.la:8094/Api/Page/index/format_type/json/"
#else
#define apiRootUrl @"http://api.ixingmei.com/Api/Page/index/format_type/json"
#endif

// app的版本号(BundleVersion,short)
#define APP_VERSION_KEY         @"APP_VERSION_KEY"
#define AppVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]    //格式:@"1.2.0"
#define AppVersionNumberFormatString [AppVersionString stringByReplacingOccurrencesOfString:@"." withString:@""]    //格式:@"120"

//判断设备是iPhone还是ipad
#define isIphone UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone

#define ReturnImageWithImgName(stringName)  [UIImage imageNamed:stringName]
#define ReturnColorWithImgName(stringName)  [UIColor colorWithPatternImage:[UIImage imageNamed:stringName]]

//微信支付
#define wechatAPPID @""
#define wechatAppSecret @""

//百度云推送
#define BPusAPPID @""
#define BPusAppSecret @""
#define BPusApiKey @""

//接口API通讯
#define XMKEY          @""
#define XMSECRET       @""
#define SC             @""

//名语言设置
#define LOCALSTR(STRING)			NSLocalizedString(STRING, nil)

// 设置颜色  十六进制RGB值
#define HEXCOLOR(rgbValue)			[UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : 1.0]

// 设置颜色与透明度
#define HEXCOLORAL(rgbValue, al)	[UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : al]
//app 主色系
#define Main_Color [UIColor colorWithRed:255/255.0f green:105/255.0f blue:19/255.0f alpha:1]
#define theApplication	[UIApplication sharedApplication]
#define TheAppDelegate     ((AppDelegate *)[[UIApplication sharedApplication] delegate])

// 判断系统是否是iOS7
#define IOS7					([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)

#define ScreenFrame			    [UIScreen mainScreen].bounds.size

// DEBUG 打印日志  ：Debug模式下打印日志，Release模式下不打印日志，不显示
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

//MRC 内存释放宏定义
#ifndef SAFE_RELEASE
#define SAFE_RELEASE(x) {if (x) {			\
[x release];	\
}				\
x = nil; }
#endif

//================================Iphone部分==============================
// 动态获取设备高度
#define IPHONE_HEIGHT			[UIScreen mainScreen].bounds.size.height
#define IPHONE_WIDTH            [UIScreen mainScreen].bounds.size.width

//================================Ipad部分==============================
#define docPath ([[HPDocManager documentPath] stringByAppendingPathComponent:@"Resource"])
#define skinImage(_name) [HPDocManager getSkinImage:_name]
#define getImage(_name) [HPDocManager getTouchImage:_name]
// 动态获取设备高度
#define IPAD_ScreenWidth        1024.000
#define IPAD_ScreenHeight       768.000


