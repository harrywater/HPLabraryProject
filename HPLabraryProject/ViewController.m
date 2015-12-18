//
//  ViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/18.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 300, 300, 100)];
    label.text=@"this is HPLabrary!";
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont boldSystemFontOfSize:28];
    label.textColor=[UIColor blackColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
