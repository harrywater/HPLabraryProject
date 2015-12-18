//
//  UIImage+RgbForImage.m
//  smi
//
//  Created by 王辉平 on 15/6/13.
//
//

#import "UIImage+RgbForImage.h"

@implementation UIImage (RgbForImage)
+(UIImage *)buttonJTImageFromColor:(UIColor *)color frame:(CGRect)frame{
    CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
@end
