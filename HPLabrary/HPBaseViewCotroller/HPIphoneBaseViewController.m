//
//  SMIBaseViewController.m
//  smi
//
//  Created by 王辉平 on 15/6/4.
//
//

#import "HPIphoneBaseViewController.h"

@interface HPIphoneBaseViewController ()

@end

@implementation HPIphoneBaseViewController

-(id)init{
    self=[super init];
    //    if (self) {
    //        self.hidesBottomBarWhenPushed = YES;
    //    }
    return self;
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
