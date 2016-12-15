//
//  SMIBaseViewController.h
//  smi
//
//  Created by 王辉平 on 15/6/4.
//
//

#import <UIKit/UIKit.h>
#import "UIButton+titleWithImg.h"
#import "NSString+NetWork.h"
#import "NSString+AlertView.h"

@interface HPIphoneBaseViewController : UIViewController
@property(nonatomic,assign)BOOL leftButtonHiden;
@property(nonatomic,assign)BOOL rightButtonHiden;
@property(nonatomic,strong)UIButton *rightButton;
@property(nonatomic,copy) NSString *titleString;
@property(nonatomic,strong)UIButton *leftButton;

-(void)leftButtonTouch:(UIButton *)sender;
-(void)rightButtonTouch:(UIButton *)sender;
@end
