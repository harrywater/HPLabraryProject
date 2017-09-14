//
//  HPDocManager.h
//  YXGJ
//
//  Created by 王辉平 on 16/1/4.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPDocManager : NSObject
+(NSString*)documentPath;

+(NSString*)skinPath;
+(NSString*)touchPath;
+(NSString*)swfPath;
+(NSString*)vedioPath;

+(NSString*)skinFileWithPath:(NSString*)aSortPath;
+(NSString*)touchFileWithPath:(NSString*)aSortPath;
+(NSString*)swfFileWithPath:(NSString*)aSortPath;
+(NSString*)vedioFileWithPath:(NSString*)aSortPath;
+(NSString*)musicFileWithPath:(NSString*)aSortPath;

+(UIImage*)getSkinImage:(NSString*)aName;
+(UIImage*)getTouchImage:(NSString*)aName;
+(UIImage*)getSwfImage:(NSString*)aName;

+(NSArray*)getFiles:(NSString*)aFullPath;
+(NSArray*)getFilterFile:(NSString*)aFullPath withType:(NSString*)aType;

+(BOOL)firstTimeRun;
+(void)firstCopy;
@end
