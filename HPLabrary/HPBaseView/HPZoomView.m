//
//  HPZoomView.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/25.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "HPZoomView.h"
#import <SDWebImageManager.h>
#import <UIImageView+WebCache.h>
@interface HPZoomView()<UIScrollViewDelegate>
{
    UIImageView* imgView;
}
//创建缩放view
-(void)createZoomView;
@end

@implementation HPZoomView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createZoomView];
    }
    return self;
}
-(void)setPhotoUrl:(NSString *)photoUrl{
    _photoUrl=photoUrl;
    [imgView sd_setImageWithURL:[NSURL URLWithString:photoUrl] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {

    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}
-(void)createZoomView{
    
    UIScrollView* scrol=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ScreenFrame.width, ScreenFrame.height)];
    scrol.minimumZoomScale=1;
    scrol.maximumZoomScale=3;
    scrol.delegate=self;
    scrol.showsHorizontalScrollIndicator = NO;
    scrol.showsVerticalScrollIndicator = NO;
    [self addSubview:scrol];
    
    imgView=[[UIImageView alloc]initWithFrame:scrol.frame];
    [scrol addSubview:imgView];
}
#pragma mark -scrol delegate
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imgView;
}
@end
