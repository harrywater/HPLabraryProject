//
//  HPRotateView.h
//  LBJNPro
//
//  Created by 王辉平 on 17/5/4.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HPRotateViewDelegate
@optional
- (void)handleScroSlidePage:(NSInteger)currentIdex;
@end

typedef NS_ENUM(NSInteger,SLIDETYPE) {
    SLIDE_normal = 0,
    SLIDE_360 = 1,
    SLIDE_180 = 2,
};
@interface HPRotateView : UIView
@property(nonatomic,weak)id<HPRotateViewDelegate>delegate;
@property(nonatomic,assign)BOOL scaleNoEnable;
+(id)createWithDs:(NSArray*)ds atIndex:(int)index;
+(id)createWithDs:(NSArray*)ds atIndex:(int)index andSlideType:(SLIDETYPE)type;
- (void)resetShowView; // 回到初始位置
- (void)setCurImgIndex:(NSInteger)curIndex;
@end
