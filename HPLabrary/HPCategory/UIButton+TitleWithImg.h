//
//  UIButton+titleWithImg.h
//  smi
//
//  Created by 王辉平 on 15/5/21.
//  Copyright (c) 2015年 王辉平. All rights reserved.
//
//  作用: button 绘制圆角 加 字

typedef NS_ENUM(NSInteger, ButtonImgWithTitleOrientationType) {
    ButtonImgWithTitle_Horizontal,
    ButtonImgWithTitle_HorizontalImgIsBack,
    ButtonImgWithTitle_BottomType, //约会详情底部菜单
    ButtonImgWithTitle_Vertical
};
#import <UIKit/UIKit.h>
@interface UIButton (TitleWithImg)
-(void)setTitle:(NSString*)titleStr  withImg:(UIImage*)btnImg forState:(UIControlState)stateType withOrientationType:(ButtonImgWithTitleOrientationType)buttonImgWithTitleOrientationType;

@end
