//
//  HPUIButtonEdgeInsetViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2018/5/14.
//  Copyright © 2018年 王辉平. All rights reserved.
//

#import "HPUIButtonEdgeInsetViewController.h"

@interface HPUIButtonEdgeInsetViewController ()

@end

@implementation HPUIButtonEdgeInsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backBtn];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* testButn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 150, 150)];
    testButn.backgroundColor = [UIColor yellowColor];
//    [testButn setBackgroundImage:[UIImage imageNamed:@"dbal_1.jpg"] forState:UIControlStateNormal];
//    [testButn setImage:[UIImage imageNamed:@"dbal_1.jpg"] forState:UIControlStateNormal];
    [testButn setTitle:@"首页" forState:UIControlStateNormal];
    [testButn setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0, 0)];
//    [testButn setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0, -200)];
    testButn.titleLabel.backgroundColor = [UIColor redColor];
   
    [testButn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    
    
    UIButton* testButn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 290, 150, 150)];
    testButn2.backgroundColor = [UIColor yellowColor];
    //    [testButn2 setBackgroundImage:[UIImage imageNamed:@"dbal_1.jpg"] forState:UIControlStateNormal];
//    [testButn2 setImage:[UIImage imageNamed:@"dbal_1.jpg"] forState:UIControlStateNormal];
    [testButn2 setTitle:@"首页" forState:UIControlStateNormal];
//    [testButn2 setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0, 0)];
//        [testButn2 setTitleEdgeInsets:UIEdgeInsetsMake(0,0,0, -200)];
    [testButn2 layoutIfNeeded];
    //变换前 {{56.666666666666657, 64.333333333333329}, {37, 21.666666666666668}}
    NSLog(@"fam原来==%@",NSStringFromCGRect(testButn2.titleLabel.frame));
//    NSLog(@"fam  edge==%@",NSStringFromUIEdgeInsets(testButn2.titleEdgeInsets));
    //UIEdgeInsetsMake(0,200,0,-150)
    [testButn2 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    [testButn2 setImageEdgeInsets:UIEdgeInsetsMake(0,150,0,-150)];
    [testButn2 setTitleEdgeInsets:UIEdgeInsetsMake(50,128,-10,0)];
//    [testButn2 setTitleEdgeInsets:UIEdgeInsetsMake(0,200,0,-150)];
//    testButn2.imageEdgeInsets = UIEdgeInsetsMake(0, testButn2.bounds.size.width/2 - testButn2.imageView.bounds.size.width/2 + testButn2.titleLabel.bounds.size.width/2, 0, 0);

    [testButn2 layoutIfNeeded];
    //实际坐标变化 fa2m=={{231.66666666666666, 64.333333333333329}, {37, 21.666666666666668}}
    // （200+150）/2 = 175 偏移量是175点 = 231.6-56.6
    //总结：平移量是横向左右or纵向的上下 合并确定的值/2
    NSLog(@"titleLabel-fam最新==%@，imgFram==%@",NSStringFromCGRect(testButn2.titleLabel.frame),NSStringFromCGRect(testButn2.imageView.frame));
    testButn2.titleLabel.backgroundColor = [UIColor redColor];
    [testButn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    
    [self.view addSubview:testButn];
    [self.view addSubview:testButn2];
}

@end
