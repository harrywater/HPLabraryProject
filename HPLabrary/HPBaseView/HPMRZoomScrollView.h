//
//  HPMRZoomScrollView.h
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/24.
//  Copyright © 2015年 王辉平. All rights reserved.
//
//作用:缩放图片

#import <UIKit/UIKit.h>


@interface HPMRZoomScrollView : UIScrollView <UIScrollViewDelegate>
{
    UIImageView *_imageView;
   __weak UIImageView* _indexLogo;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) UIImageView * indexLogo;

@end
