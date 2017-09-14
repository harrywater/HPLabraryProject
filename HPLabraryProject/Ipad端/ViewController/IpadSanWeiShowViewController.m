//
//  IpadSanWeiShowViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/15.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "IpadSanWeiShowViewController.h"
#import "HPImageSequence.h"

@interface IpadSanWeiShowViewController ()
@property(nonatomic,strong) HPImageSequence*sanWeishowImgView;
@end

@implementation IpadSanWeiShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.sanWeishowImgView];
    [self.view addSubview:self.backBtn];
    [self setSqueImgPefix:@"nk__" Type:@"jpg" andRevolve:Revolve_360];
}
- (void)setSqueImgPefix:(NSString*)fix Type:(NSString*)type andRevolve:(RevolveModel)revolveModel
{
    NSString* temName = [fix stringByAppendingString:@"0"];
    self.sanWeishowImgView.image = getImageWithSpendMainBundlePath(temName, type);
    self.sanWeishowImgView.extension = type;
    self.sanWeishowImgView.prefix = fix;
    self.sanWeishowImgView.revolveModel = revolveModel;
    self.sanWeishowImgView.numberOfImages = 10;
}
- (HPImageSequence*)sanWeishowImgView
{
    if (_sanWeishowImgView == nil) {
        _sanWeishowImgView = [[HPImageSequence alloc]initWithFrame:HP_FullScreenRect];
        _sanWeishowImgView.userInteractionEnabled = YES;
    }
    return _sanWeishowImgView;
}

@end
