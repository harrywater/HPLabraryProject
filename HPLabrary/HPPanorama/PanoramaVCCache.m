//
//  PanoramaVCCache.m
//  REShow
//
//  Created by loufq on 11-11-27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PanoramaVCCache.h"
#import "SynthesizeSingleton.h"

@implementation PanoramaVCCache
@synthesize memCache;
- (void)dealloc {
    self.memCache = nil;
    [super dealloc];
}

SYNTHESIZE_SINGLETON_FOR_CLASS(PanoramaVCCache);
-(PanoWebVC*)getByKey:(NSString*)key{
    if (!memCache) {
        self.memCache =[NSMutableDictionary dictionary];
    }
    PanoWebVC* pvc =[memCache objectForKey:key];
    if (!pvc) {
        pvc =[PanoWebVC createWithFilePath:key];
        [memCache setObject:pvc forKey:key];
    }
    return pvc;
    /* */
}
/*
 -(PanoramaViewController*)getByKey:(NSString*)key{
 if (!memCache) {
 self.memCache =[NSMutableDictionary dictionary];
 }
 PanoramaViewController* pvc =[memCache objectForKey:key];
 if (!pvc) {
 pvc =[PanoramaViewController createWithFilePath:key];
 [memCache setObject:pvc forKey:key];
 }
 return pvc;
 }
 */

@end
