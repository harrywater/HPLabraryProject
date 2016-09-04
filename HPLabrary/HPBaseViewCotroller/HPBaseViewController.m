//
//  SMIBaseViewController.m
//  smi
//
//  Created by 王辉平 on 15/6/4.
//
//

#import "HPBaseViewController.h"

@interface HPBaseViewController ()

@end

@implementation HPBaseViewController
{
    UILabel *titleLabel;
}

@synthesize titleString = _titleString;
@synthesize rightButton = _rightButton;
@synthesize leftButton=_leftButton;


-(id)init{
    self=[super init];
    //    if (self) {
    //        self.hidesBottomBarWhenPushed = YES;
    //    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor colorWithRed:254.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
    [self loadTitleView];
}

-(void)loadTitleView
{
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 195, 100, 44)];
    [titleLabel setFont:[UIFont systemFontOfSize:17]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = titleLabel;
    //leftButton
    _leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,55,44)];
    _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _leftButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [_leftButton setBackgroundImage:ReturnImageWithImgName(@"navBack.png") forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(leftButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    [_leftButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    self.navigationItem.leftBarButtonItem = buttonItem;
    //rightButton
    _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,25,21)];
    _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [_rightButton addTarget:self action:@selector(rightButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    [_rightButton setContentEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    //底部颜色
    UIImageView* bottomLineImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 42.5, IPHONE_WIDTH,1.5)];
    bottomLineImageView.image=[UIImage imageNamed:@"lineViewBg.png"];
    [self.navigationController.navigationBar addSubview:bottomLineImageView];
    
}

-(void)setTitleString:(NSString *)titleString
{
    [titleLabel setText: titleString];
}
-(void)setLeftButtonTitle:(NSString*)titleString wityButtonImgWithTitleOrientationType:(ButtonImgWithTitleOrientationType)buttonType{
    if (buttonType==ButtonImgWithTitle_HorizontalImgIsBack) {
        [_leftButton setTitle:titleString withImg:[UIImage imageNamed:@"rightBtn.png"] forState:UIControlStateNormal withOrientationType:buttonType];
        return;
    }
    [_leftButton setTitle:titleString withImg:[UIImage imageNamed:@"leftBtn.png"] forState:UIControlStateNormal withOrientationType:buttonType];
}
-(void)setLeftButtonHiden:(BOOL)leftButtonHiden
{
    _leftButton.hidden = leftButtonHiden;
    if (leftButtonHiden) {
        if (_leftButton) {
            [_leftButton removeFromSuperview],_leftButton=nil;
        }
    }
}
-(void)setRightButtonHiden:(BOOL)rightButtonHiden
{
    _rightButton.hidden = rightButtonHiden;
    if (rightButtonHiden) {
        if (_rightButton) {
            [_rightButton removeFromSuperview],_rightButton=nil;
        }
    }
}

- (void)leftButtonTouch:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonTouch:(UIButton *)sender{
    
}

@end
