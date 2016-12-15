

#import "PanoWebVC.h"
#import "HPDocManager.h"

@interface PanoWebVC()<UIWebViewDelegate>
{
    UIWebView* myWebView;
}
@end

@implementation PanoWebVC

@synthesize filePath;

- (void)dealloc {
    self.filePath = nil;
    [super dealloc];
}

+(PanoWebVC*)createWithFilePath:(NSString*)aFilePath{
    PanoWebVC* vc =    [[[self alloc] initWithFilePath:aFilePath] autorelease];
    return vc;
}

-(id)initWithFilePath:(NSString*)aFilePath{
    self = [super initWithFrame:CGRectMake(0, 0, 1024, 768)];
    self.filePath = aFilePath;
    self.backgroundColor = [UIColor clearColor];
    if (!myWebView) {
        myWebView =[[[UIWebView alloc] initWithFrame:self.bounds] autorelease];
        myWebView.delegate = self;
        myWebView.backgroundColor = [UIColor clearColor];
        [self addSubview:myWebView];
    }
    NSString* path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"my720/%@/1.html",filePath]];
    DLog(@"720===path===%@",path);
    [myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]];
    return self;
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
