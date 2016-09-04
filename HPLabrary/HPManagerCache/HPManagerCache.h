//
//  HPManagerCache.h
//  PPMovie
//
//  Created by 王辉平 on 16/1/11.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPManagerCache : NSObject
+(void)clearCacheWithPath:(NSString *)path;
-(void)clearCache;
@end
