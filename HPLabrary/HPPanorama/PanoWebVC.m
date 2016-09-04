//
//  PanoWebVC.m
//  REShow
//
//  Created by loufq on 11-12-1.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "PanoWebVC.h"
#import "HPDocManager.h"

@implementation PanoWebVC
@synthesize filePath;
- (void)dealloc {
    self.filePath = nil;
    [super dealloc];
}
 
+(PanoWebVC*)createWithFilePath:(NSString*)aFilePath{
    PanoWebVC* vc =    [[[self alloc] initWithFilePath:aFilePath] autorelease];
    vc.frame = CGRectMake(0, 0, 1024, 768);
    return vc;
}

-(id)initWithFilePath:(NSString*)aFilePath{
    self = [super init];
    self.filePath = aFilePath;
    return self;
}
-(void)show720View{
    self.frame = CGRectMake(0, 0, 1024, 768);
    UIWebView* wv =[[[UIWebView alloc] initWithFrame:self.bounds] autorelease];
    myWebView = wv;
    wv.delegate = self;
    NSString* path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"my720/%@/1.html",filePath]];
    DLog(@"720===path===%@",path);
    [wv loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    [self addSubview:wv];
}

-(void)updateWithFilePath:(NSString*)aFilePath{
    NSString* path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"my720/%@/1.html",aFilePath]];
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]]; 
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{ 
    return YES;
} 
- (void)webViewDidStartLoad:(UIWebView *)webView{ 
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{ 
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{ 
}

@end
