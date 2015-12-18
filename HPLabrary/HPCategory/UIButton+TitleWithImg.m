//
//  UIButton+titleWithImg.m
//  smi
//
//  Created by 王辉平 on 15/5/21.
//  Copyright (c) 2015年 王辉平. All rights reserved.
//

#import "UIButton+TitleWithImg.h"

@implementation UIButton (TitleWithImg)
-(void)setTitle:(NSString*)titleStr  withImg:(UIImage*)btnImg forState:(UIControlState)stateType withOrientationType:(ButtonImgWithTitleOrientationType)buttonImgWithTitleOrientationType{
 
    self.titleLabel.font=[UIFont systemFontOfSize:15];
    [self setTitleColor:[UIColor colorWithRed:130.0/255.0 green:130.0/255.0 blue:130.0/255.0 alpha:1] forState:stateType];
    switch (buttonImgWithTitleOrientationType) {
        case ButtonImgWithTitle_Horizontal:
        {
            self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
            self.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
            [self setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                                      0.0,
                                                      0.0,
                                                      0.0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(-2.0,
                                                      7,
                                                      0.0,
                                                      0.0)];
            [self setTitle:titleStr forState:stateType];
            [self setImage:btnImg forState:stateType];
        }
            break;
        case ButtonImgWithTitle_Vertical:
        {
            self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
            self.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
            //    [self.titleLabel setContentMode:UIViewContentModeCenter];
            //    [self.imageView setContentMode:UIViewContentModeCenter];
            self.titleLabel.font=[UIFont systemFontOfSize:13];
            [self setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                                      0.0,
                                                      0.0,
                                                      0.0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(61.0,
                                                      -69.0,
                                                      0.0,
                                                      -10.0)];
            [self setTitle:titleStr forState:stateType];
            [self setImage:btnImg forState:stateType];
            [self setTitleColor:[UIColor blackColor] forState:stateType];
        }
            break;
        case ButtonImgWithTitle_HorizontalImgIsBack:
        {
            self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
            self.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
            [self setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                                      40.0,
                                                      0.0,
                                                      0.0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(-2.0,
                                                      -5.0,
                                                      0.0,
                                                      0.0)];
            [self setTitle:titleStr forState:stateType];
            [self setImage:btnImg forState:stateType];
        }
            break;
        case ButtonImgWithTitle_BottomType:
        {
            self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
            self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
            [self setImageEdgeInsets:UIEdgeInsetsMake(0.0,
                                                      0.0,
                                                      0.0,
                                                      0.0)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(6.0,
                                                      7,
                                                      0.0,
                                                      0.0)];
            [self setTitle:titleStr forState:stateType];
            [self setImage:btnImg forState:stateType];
        }
            break;
        default:
            break;
    }
}
@end
