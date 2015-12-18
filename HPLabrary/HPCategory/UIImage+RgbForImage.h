//
//  UIImage+RgbForImage.h
//  smi
//
//  Created by 王辉平 on 15/6/13.
//
//  作用:用于设置button setbackgroundImage:(UIImage)的image 实现设置颜色后按下有按下效果

#import <UIKit/UIKit.h>

@interface UIImage (RgbForImage)
+(UIImage *)buttonJTImageFromColor:(UIColor *)color frame:(CGRect)frame;
@end
