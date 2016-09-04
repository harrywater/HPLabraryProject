//
//  HPHttpServerRequest.h
//  SMIXMHManager
//
//  Created by 王辉平 on 16/1/5.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPHttpServerRequest : NSObject
/**
 发起POST请求并解析数据
 @param parameters POST参数
 @param response 结果回调
 */
+ (void)requestWithParameters:(NSDictionary *)parameters response:(void (^)(NSError *error, NSDictionary *result))response;
/**
 发起GET请求并解析数据
 @param childUrl 请求的url后半部分
 @param response 结果回调
 */
+(void)requestWithChildUrlStr:(NSString*)childUrl andParameters:(NSDictionary *)parameters response:(void (^)(NSError *error, NSDictionary *result))response;

/**
 *上传图片
 发起POST请求并解析数据
 @param childUrl 请求的url后半部分
 @param response 结果回调
 */
+(void)requesPosttWithChildUrlStr:(NSString*)childUrl andParameters:(NSDictionary *)parameters andImage:(UIImage *)image andImageInfo:(NSDictionary *)info response:(void (^)(NSError *error, NSString *result))response;

/**
 soap 协议  webservice接口交互
 上报定位坐标
 @param latitude 纬度
 @param longitude 经度
 @param userPhone 用户手机号
 */
+(void)requestForWebServerceWithLatitude:(NSString*)latitude andLongitude:(NSString*)longitude andUserPhone:(NSString*)userPhone;

@end
