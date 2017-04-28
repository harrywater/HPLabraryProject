//
//  HPImageSequence.h
//  YXGJ
//
//  Created by 王辉平 on 16/1/1.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^SETBUTTONAPPEAR_BLOCK) (NSInteger current);
//360°旋转  or 180°旋转
typedef NS_ENUM(NSInteger,RevolveModel) {
    Revolve_180,
    Revolve_360,
};

typedef NS_ENUM(NSInteger,SlideOrientation) {
    Orientation_left, //左滑动
    Orientation_right,//右滑动
};

@interface HPImageSequence : UIImageView {
	NSString *prefix;
	int numberOfImages;
	int current;
	int previous;
	NSString *extension;
	int increment;
}
@property (nonatomic,assign)RevolveModel revolveModel;
@property (readwrite) int increment;
@property (readwrite, copy) NSString *extension;
@property (readwrite, copy) NSString *prefix;
@property (readwrite) int numberOfImages;
@property (nonatomic, copy)SETBUTTONAPPEAR_BLOCK setButtonAppearblock;
@property (nonatomic, assign)SlideOrientation slideOrientation;//滑动方向
- (void)resetCurrent;
@end

