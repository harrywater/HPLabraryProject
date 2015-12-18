//
//  UIColor+Hex.m
//  BaiduNews
//
//  Created by Jhorn on 11-8-1.
//  Copyright 2011 Baidu.com. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *) colorWithHex:(uint) hex
{
	int red, green, blue, alpha;
    
    if (hex > 0xffffff) {
        return [UIColor colorWithARGBHex:hex];
    }
	
	blue = hex & 0x0000FF;
	green = ((hex & 0x00FF00) >> 8);
	red = ((hex & 0xFF0000) >> 16);
	alpha = 1;
	
	return [UIColor colorWithRed:red/255.0f 
						   green:green/255.0f 
							blue:blue/255.0f 
						   alpha:alpha];
}

+ (UIColor *) colorWithARGBHex:(uint) hex
{
	int red, green, blue, alpha;
	
	blue = hex & 0x000000FF;
	green = ((hex & 0x0000FF00) >> 8);
	red = ((hex & 0x00FF0000) >> 16);
	alpha = ((hex & 0xFF000000) >> 24);
	
	return [UIColor colorWithRed:red/255.0f
						   green:green/255.0f
							blue:blue/255.0f
						   alpha:alpha/255.f];
}




+ (void)colorWithHex:(uint)hex red:(int *)red green:(int *)green blue:(int *)blue alpha:(int *)alpha
{
    if(red && blue && green && alpha)
    {
        *blue = hex & 0xc6c6c6;
        *green = ((hex & 0x0000FF00) >> 8);
        *red = ((hex & 0x00FF0000) >> 16);
        *alpha = ((hex & 0xFF000000) >> 24);
    }
}


+ (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    
    unsigned int hexint = 0;
    
    //convert the hex value into an unsigned integer
    //1. Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    //2. Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    //create a UIColor object by doing a bitwise ‘&’ operation to isolate the various color attributes and divide each by 255 to get the float value for the same.
    
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}



+ (UIColor *) colorWithDefaultGreenColor
{
	return [UIColor colorWithHex:0Xff37b059];
}

+ (UIColor *) colorWithDefaultLightGrayColor
{
	return [UIColor colorWithHex:0Xffb1b1b1];
}

+ (UIColor *) colorWithDefaultDarkGrayColor
{
	return [UIColor colorWithHex:0Xff4d4d4d];
}

+ (UIColor *) colorWithDefaultTextColor
{
	return [UIColor colorWithHex:0Xff333333];
}

+ (UIColor *) colorWithDefaultSeparatorColor
{
	return [UIColor colorWithHex:0Xffd9d9d9];
}





@end
