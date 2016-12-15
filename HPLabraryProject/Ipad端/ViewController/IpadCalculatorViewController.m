//
//  IpadCalculatorViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/2/18.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "IpadCalculatorViewController.h"

@interface IpadCalculatorViewController ()<UIWebViewDelegate>

@end

@implementation IpadCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView* webVC = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, IPAD_ScreenWidth, IPAD_ScreenHeight)];
    webVC.scrollView.bounces = NO;
    webVC.delegate = self;
    [self.view addSubview:webVC];
    [self.view addSubview:self.backBtn];
    
//    NSString* path1 = [docPath stringByAppendingPathComponent:@"calculation1/calculatoron.html"];
    NSString* path2 = [docPath stringByAppendingPathComponent:@"calculation2/index.html"];
    [webVC loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path2]]];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
