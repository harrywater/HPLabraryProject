//
//  HPWebViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/23.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPWebViewController.h"

@interface HPWebViewController ()

@end

@implementation HPWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView* webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURLRequest* resq = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://202.69.28.70/pps/yqyApp/userMember/getActivityRichContentView.do?jsonData=SSQ8w+jFQGOVb+K4WSp/HXSP0hz6tPKrspRAJiRKqj4WMqW3JP0q6jjph1oo9JdI&sign=eb46fa8f47495e5411b8c9c46a7ef3de7bffd778d5587a7ff7ff90edc9d0f139&timestamp=1482377143291"]];
    [webView loadRequest:resq];
    [self.view addSubview:webView];
}

@end
