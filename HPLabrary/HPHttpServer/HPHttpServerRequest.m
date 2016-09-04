//
//  HPHttpServerRequest.m
//  SMIXMHManager
//
//  Created by 王辉平 on 16/1/5.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPHttpServerRequest.h"
#import "AFNetworking.h"
@implementation HPHttpServerRequest

+ (void)requestWithParameters:(NSDictionary *)parameters response:(void (^)(NSError *error, NSDictionary *result))response
{
    NSMutableDictionary *p = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [p setObject:XMKEY forKey:@"xm_key"];
    [p setObject:XMSECRET forKey:@"xm_secret"];
    [p setObject:SC forKey:@"sc"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager POST:apiRootUrl parameters:p success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"POST----parameters:\n%@\nresult:\n%@---------------%@",parameters,operation.responseString,p);
        response(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"request error %@",[error localizedDescription]);
        response(error,nil);
    }];
}

+(void)requestWithChildUrlStr:(NSString*)childUrl andParameters:(NSDictionary *)parameters response:(void (^)(NSError *error, NSDictionary *result))response
{
    NSString* getUrl=[NSString stringWithFormat:@"%@%@",apiRootUrl,childUrl];
    DLog(@"URL------%@/n==%@",getUrl,parameters);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    [manager GET:getUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"GET----parameters:\n%@\nresult:\n%@",parameters,operation.responseString);
        response(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"request error %@",[error localizedDescription]);
        response(error,nil);
    }];
}
//上传图片
+(void)requesPosttWithChildUrlStr:(NSString*)childUrl andParameters:(NSDictionary *)parameters andImage:(UIImage *)image andImageInfo:(NSDictionary *)info response:(void (^)(NSError *error, NSString *result))response
{
    //    NSString* postUrlStr=[NSString stringWithFormat:apiRootUrl,childUrl];
    DLog(@"URL------%@",childUrl);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:childUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.5) name:@"pic" fileName:@"pic" mimeType:@"image/jpeg"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"%@",operation.responseString);
        response(nil,operation.responseString);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%@",error);
        response(error,nil);
    }];
}


/**
  Webservice 接口交互
 */
+(void)requestForWebServerceWithLatitude:(NSString*)latitude andLongitude:(NSString*)longitude andUserPhone:(NSString*)userPhone{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    DLog(@"time----%@",[dateFormatter stringFromDate:[NSDate date]]);
    NSString* time=[dateFormatter stringFromDate:[NSDate date]];
    /**
     报文示例：
     [NSString stringWithFormat:
     @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
     "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     "<soap:Body>"
     "<UpdateLocationInfoFromApp xmlns=\"http://www.cx-info.com/\">"
     "<UserName>%@</UserName>"
     "<Key>%@</Key>"
     "<telPhone>%@</telPhone>"
     "<longitude>%@</longitude>"
     "<latitude>%@</latitude>"
     "<speed>%@</speed>"
     "<last_time>%@</last_time>"
     "<addrStr>%@</addrStr>"
     "<radius>%@</radius>"
     "<direct>%@</direct>"
     "</UpdateLocationInfoFromApp>"
     "</soap:Body>"
     "</soap:Envelope>", @"smimovie",@"smimovie",@"17000185520", @"22.532540", @"114.043086",@"1.0",@"2016-01-22 11:22:12",@"asa",@"0",@"0"
     ];
     */
    NSString *soapMessage =
    [NSString stringWithFormat:
     @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
     "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
     "<soap:Body>"
     "<UpdateLocationInfoFromApp xmlns=\"http://www.cx-info.com/\">"
     "<UserName>%@</UserName>"
     "<Key>%@</Key>"
     "<telPhone>%@</telPhone>"
     "<longitude>%@</longitude>"
     "<latitude>%@</latitude>"
     "<speed>%@</speed>"
     "<last_time>%@</last_time>"
     "<addrStr></addrStr>"
     "<radius>%@</radius>"
     "<direct>%@</direct>"
     "</UpdateLocationInfoFromApp>"
     "</soap:Body>"
     "</soap:Envelope>", @"smimovie",@"smimovie",userPhone,longitude,latitude,@"1.0",time,@"0",@"0"
     ];
    DLog(@"soapMs----%@",soapMessage);
    NSString *soapLength = [NSString stringWithFormat:@"%ld", [soapMessage length]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [manager.requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:soapLength forHTTPHeaderField:@"Content-Length"];
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST" URLString:@"http://smi.gpscx.com/MobileService/Service.asmx" parameters:nil error:nil];
    [request setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *response = [[NSString alloc] initWithData:(NSData *)responseObject encoding:NSUTF8StringEncoding];
        DLog(@"AAAAAAAAAA--------%@, %@", operation, response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"BBBBBBBBB---------%@, %@", operation, error);
    }];
    [manager.operationQueue addOperation:operation];
}
@end

