
//
//  HPAnimationViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/28.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPAnimationViewController.h"

@interface HPAnimationViewController ()
@property(nonatomic,strong)UIView* redView;
@property(nonatomic,strong)UIView* yellowView;
@property(nonatomic,strong)UIView* greenView;
@end

@implementation HPAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backBtn];
    
    [self.view addSubview:self.redView];
    [self.view addSubview:self.yellowView];
    [self.view addSubview:self.greenView];
    
    UIButton* start = [[UIButton alloc]initWithFrame:CGRectMake(IPHONE_WIDTH-100, 20, 80, 45)];
    start.backgroundColor = [UIColor blueColor];
    [start setTitle:@"开始" forState:UIControlStateNormal];
    [start addTarget:self action:@selector(startAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:start];
}
- (void)startAnimation
{
    
    //渐显
//    CABasicAnimation* basicAn = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    basicAn.toValue = @1;
//    basicAn.fromValue = @0.15;
//    basicAn.duration = 3;
//    [self.redView.layer addAnimation:basicAn forKey:@""];
    
    //位移
    CABasicAnimation* basicAn = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAn.toValue = [NSValue valueWithCGRect:self.yellowView.frame];
    basicAn.duration = 3;
//    basicAn.fillMode =
    [self.redView.layer addAnimation:basicAn forKey:@""];
    
}

- (UIView*)redView
{
    if(_redView == nil){
        _redView = [[UIView alloc]initWithFrame:CGRectMake(90, 60, 100, 50)];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}
- (UIView*)yellowView
{
    if(_yellowView == nil){
        _yellowView = [[UIView alloc]initWithFrame:CGRectMake(50, 230, 100, 50)];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}
- (UIView*)greenView
{
    if(_greenView == nil){
        _greenView = [[UIView alloc]initWithFrame:CGRectMake(50, 400, 100, 50)];
        _greenView.backgroundColor = [UIColor greenColor];
    }
    return _greenView;
}
@end
