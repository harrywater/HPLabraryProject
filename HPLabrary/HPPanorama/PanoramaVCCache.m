
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
    PanoWebVC* pvc =[memCache objectForKey:@"cache"];
    if (!pvc) {
        pvc =[PanoWebVC createWithFilePath:key];
        [memCache setObject:pvc forKey:@"cache"];
    }else{
        [pvc updateWithFilePath:key];
    }
    return pvc;
     /* */
}
@end
