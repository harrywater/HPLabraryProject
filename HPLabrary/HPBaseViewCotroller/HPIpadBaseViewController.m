//
//  HPBaseViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/15.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPIpadBaseViewController.h"

@interface HPIpadBaseViewController ()

@end

@implementation HPIpadBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (UIButton*)backBtn
{
    if (_backBtn == nil) {
        _backBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 45, 50, 30)];
        [_backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.backgroundColor = [UIColor redColor];
        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
    }
    return _backBtn;
}
-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
