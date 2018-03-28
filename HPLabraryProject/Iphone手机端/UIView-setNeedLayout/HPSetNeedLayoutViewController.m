
//
//  HPSetNeedLayoutViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/15.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPSetNeedLayoutViewController.h"
#import "HPNeedView1.h"
#import "HPNeedView2.h"
#import "HPNeedView3.h"

@interface HPSetNeedLayoutViewController ()
@property(nonatomic,strong)HPNeedView1* view1;
@property(nonatomic,strong)HPNeedView2* view2;
@property(nonatomic,strong)HPNeedView3* view3;
@end

@implementation HPSetNeedLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.backBtn];

//    [self.view addSubview:self.view1];
//    [self.view1 setNeedsDisplayInRect:CGRectMake(50, 20, 50, 40)];
   
    [self.view addSubview:self.view2];
  
    
//    [self.view addSubview:self.view3];
    
//    [self.view1 setNeedsDisplayInRect:CGRectMake(0, 100, 300, 200)];
    
//    [self.view1 setNeedsDisplay];
//    [self.view1 layoutIfNeeded];
    UIButton* setBtn = [[UIButton alloc]initWithFrame:CGRectMake(300, 30, 40, 60)];
    setBtn.backgroundColor = [UIColor redColor];
    [setBtn addTarget:self action:@selector(setAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setBtn];
    
}
- (void)setAction
{
    CGRect fam = self.view2.frame;
    fam.origin.y = 0;
    
    HPWeakSelf(self);
    [UIView animateWithDuration:2.0 animations:^{
        
        weakself.view2.frame = fam;
    } completion:^(BOOL finished) {
        
    }];
//    [self.view1 setNeedsLayout];
    
    [self.view1 changeSubViewFrame];
//    [self.view1 setNeedsDisplay];
    
    [self.view1 setNeedsDisplayInRect:CGRectMake(50, 5, 50, 90)];
//    [self.view1 setNeedsLayout];
}
- (HPNeedView1*)view1
{
    if (_view1 == nil) {
        _view1 = [[HPNeedView1 alloc]initWithFrame:CGRectMake(10, 120, 200, 100)];
        _view1.backgroundColor = [UIColor greenColor];
    }
    return _view1;
}
- (HPNeedView2*)view2
{
    if (_view2 == nil) {
        _view2 = [[HPNeedView2 alloc]initWithFrame:CGRectMake(10, 120, 200, 100)];
        _view2.backgroundColor = [UIColor orangeColor];
    }
    return _view2;
}
- (HPNeedView3*)view3
{
    if (_view3 == nil) {
        _view3 = [[HPNeedView3 alloc]initWithFrame:CGRectMake(10, 240, 200, 100)];
        _view3.backgroundColor = [UIColor yellowColor];
    }
    return _view3;
}
@end
