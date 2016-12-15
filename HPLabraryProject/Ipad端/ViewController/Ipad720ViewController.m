//
//  Ipad720ViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/15.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "Ipad720ViewController.h"
#import "PanoramaVCCache.h"

@interface Ipad720ViewController ()

@end

@implementation Ipad720ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PanoWebVC* panoramaVC = [[PanoramaVCCache sharedPanoramaVCCache] getByKey:@"定点1"];
    [self.view addSubview:panoramaVC];
    [self.view addSubview:self.backBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
