//
//  HPDocManager.m
//  YXGJ
//
//  Created by 王辉平 on 16/1/4.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPDocManager.h"
#import "FileUtil.h"
#import "NSUserDefaults+Standard.h"

@implementation HPDocManager

+(NSString*)documentPath{
    return [[NSBundle mainBundle] resourcePath];
    /*NSArray			*paths				= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString		*documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;*/
}

+(NSString*)skinPath{
    return [docPath stringByAppendingPathComponent:@"skin"];
}

+(NSString*)touchPath{
    return [docPath stringByAppendingPathComponent:@"TouchImages"];
}
+(NSString*)swfPath{
    return [docPath stringByAppendingPathComponent:@"swf"];
}
+(NSString*)vedioPath{
    return [docPath stringByAppendingPathComponent:@"vedio"];
}

+(NSString*)skinFileWithPath:(NSString*)aSortPath{
    return [[self skinPath] stringByAppendingPathComponent:aSortPath];
}
+(NSString*)touchFileWithPath:(NSString*)aSortPath{
    return [[self touchPath] stringByAppendingPathComponent:aSortPath];
}

+(NSString*)swfFileWithPath:(NSString*)aSortPath{
    return [[self swfPath] stringByAppendingPathComponent:aSortPath];
}

+(NSString*)vedioFileWithPath:(NSString*)aSortPath{
    return [[self vedioPath] stringByAppendingPathComponent:aSortPath];
}

+(UIImage*)getSkinImage:(NSString*)aName{
    NSString* path =[self skinFileWithPath:aName];
    return [UIImage imageWithContentsOfFile:path];
}

+(UIImage*)getTouchImage:(NSString*)aName{
    NSString* path =[[self touchPath] stringByAppendingPathComponent:aName];
    return [UIImage imageWithContentsOfFile:path];
}

+(UIImage*)getSwfImage:(NSString*)aName{
    NSString* path =[[self touchPath] stringByAppendingPathComponent:aName];
    return [UIImage imageWithContentsOfFile:path];
}

+(NSArray*)getFiles:(NSString*)aFullPath{
    return [self getFilterFile:aFullPath withType:@"jpg"];
}

+(NSArray*)getFilterFile:(NSString*)aFullPath withType:(NSString*)aType{
    NSMutableArray* allFolderFile =[NSMutableArray array];
    [FileUtil readDir:aFullPath array:allFolderFile skipDescendants:YES];
    
    [allFolderFile filterUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH %@",aType]];
    return allFolderFile;
}

+(BOOL)firstTimeRun{
    if ([NSUserDefaults boolForKey:@"firsttime"]) {
        return NO;
    }
    [NSUserDefaults setBool:YES forKey:@"firsttime"];
    return YES;
}
+(void)firstCopy{
    NSString* navPath =   [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Resource"];
    NSString* path =   [[HPDocManager documentPath] stringByAppendingPathComponent:@"Resource"];
    NSFileManager* fm =[NSFileManager defaultManager];
    NSError* error = nil;
    [fm copyItemAtPath:navPath toPath:path error:&error];
    if (error) {
        DLog(@"%@", error.localizedDescription);
    }
}
@end

