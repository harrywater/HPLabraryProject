//
//  PanoramaVCCache.h
//  REShow
//
//  Created by loufq on 11-11-27.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanoWebVC.h"
@interface PanoramaVCCache : NSObject{
      NSMutableDictionary *memCache;
}
@property(nonatomic,retain) NSMutableDictionary *memCache;
+(PanoramaVCCache*)sharedPanoramaVCCache;

//-(PanoramaViewController*)getByKey:(NSString*)key;

-(PanoWebVC*)getByKey:(NSString*)key;

@end
