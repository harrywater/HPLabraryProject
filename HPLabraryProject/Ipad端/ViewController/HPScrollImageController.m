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
    [self.view addSubview:self.backBtn];

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
