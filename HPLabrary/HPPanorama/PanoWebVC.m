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
- (void)dealloc {
    myWebView = nil;
    [super dealloc];
}

+(PanoWebVC*)createWithFilePath:(NSString*)aFilePath{
    PanoWebVC* vc =    [[[self alloc] initWithFilePath:aFilePath] autorelease];
    vc.frame = CGRectMake(0, 0, 1024, 768);
    return vc;
}

-(id)initWithFilePath:(NSString*)aFilePath{
    self = [super init];
    if(self){
        myWebView = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)] autorelease];
        myWebView.delegate = self;
        // 预加载
        NSString* path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"my720/%@/1.html",aFilePath]];
        [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
        [self addSubview:myWebView];
    }
    return self;
}
//-(void)show720View{
//    if (myWebView) {
//        [myWebView removeFromSuperview];
//        [self addSubview:myWebView];
//    }
//}

//-(void)updateWithFilePath:(NSString*)aFilePath{
//    NSString* path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"my720/%@/1.html",aFilePath]];
//    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
//}

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
