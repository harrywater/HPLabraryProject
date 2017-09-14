//
//  HPMRZoomScrollView.h
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/24.
//  Copyright © 2015年 王辉平. All rights reserved.
//
//作用:缩放图片

#import <UIKit/UIKit.h>
typedef void(^HandleMRZoomBlock)(CGFloat scale);

@interface HPMRZoomScrollView : UIScrollView <UIScrollViewDelegate>
{
    UIImageView *_imageView;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) HandleMRZoomBlock handleBlock;
//- (void)resetDefaultScale;
@end
