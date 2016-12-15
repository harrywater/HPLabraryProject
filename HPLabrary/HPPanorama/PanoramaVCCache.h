
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
