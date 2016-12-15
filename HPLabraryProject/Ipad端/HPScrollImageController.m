//
//  HPScrollImageController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/24.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "HPScrollImageController.h"
#import "HPCycleScrollView.h"

@interface HPScrollImageController ()<HPCycleScrollViewDatasource,HPCycleScrollViewDelegate>
{
    NSArray* imageNameArray;
}
@end

@implementation HPScrollImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    DLog(@"fame==%f",self.view.frame.size.width);
    // Do any additional setup after loading the view.
    imageNameArray=@[@"dbal_1.jpg",@"dbal_2.jpg",@"dbal_3.jpg",@"dbal_4.jpg",@"dbal_5.jpg",@"dbal_6.jpg"];
    
    HPCycleScrollView* cycleScrol=[[HPCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, 1024, 768)];
    cycleScrol.delegate=self;
    cycleScrol.datasource=self;
    [self.view addSubview:cycleScrol];
    
    UIButton* backBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 45, 50, 30)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
//    backBtn.backgroundColor=[UIColor greenColor];
    [self.view addSubview:backBtn];

}
-(void)backAction{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - HPCycleScrollViewDelegate
- (void)didClickPage:(HPCycleScrollView *)csView atIndex:(NSInteger)index{
    
}
#pragma mark - HPCycleScrollViewDatasource
- (NSInteger)numberOfPages{
    return [imageNameArray count];
}
- (UIView *)pageAtIndex:(NSInteger)index{
    UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,1024, 768)];
    imageView.image=[UIImage imageNamed:imageNameArray[index]];
    return imageView;
}

@end
