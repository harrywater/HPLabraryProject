//
//  HPNeedView1.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/15.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPNeedView1.h"
@interface HPNeedView1()
@property(nonatomic,strong)UIButton* btn;
@property(nonatomic,strong)UILabel* label;
@property(nonatomic,assign)BOOL isRender;
@end
@implementation HPNeedView1
- (id)init
{
    self = [super init];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    if(self.isRender){
        NSLog(@"view1----drawRect==");
        //设置背景颜色
        UIRectFill(rect);
        //拿到当前视图准备好的画板
        CGContextRef context = UIGraphicsGetCurrentContext();
        //利用path进行绘制三角形
        CGContextBeginPath(context);//标记
        CGContextMoveToPoint(context, rect.size.width / 2, 0);//设置起点
        CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
        CGContextAddLineToPoint(context, 0, rect.size.height);
        CGContextClosePath(context);//路径结束标志，不写默认封闭
        [[UIColor redColor] setFill]; //设置填充色
        [[UIColor yellowColor] setStroke]; //设置边框颜色
        CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
    }
    
    
}
- (void)changeSubViewFrame
{
//    self.btn.frame = CGRectMake(10, 20, 140, 130);
//    self.label.frame = CGRectMake(40, 50, 90,10);
    self.isRender = YES;
    
}
- (void)initSubviews
{
    [self addSubview:self.btn];
    [self addSubview:self.label];
}
- (void)layoutSubviews
{
     NSLog(@"view1----layoutSubviews==");
//    if (_isRender) {
//        _isRender = NO;
////        self.frame = CGRectMake(10, 10, 210, 200);
//        NSLog(@"view1----layoutSubviews===NO");
//        self.btn.frame =CGRectMake(0, 10, 40, self.height/3);
//        self.label.frame =CGRectMake(0, 60, 100,self.height/3);
//    }else{
//        _isRender = YES;
//        self.frame = CGRectMake(10, 10, 210, 100);
//        NSLog(@"view1----layoutSubviews==YES");
//        self.btn.frame =CGRectMake(0, 10, 40, self.height/3);
//        self.label.frame =CGRectMake(0, 60, 100,self.height/3);
//    }
    
}
- (UIButton*)btn
{
    if (_btn == nil) {
        _btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 10, 40, self.height/3)];
        _btn.backgroundColor = [UIColor yellowColor];
    }
    return _btn;
}
- (UILabel*)label
{
    if (_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 100,self.height/3)];
        _label.backgroundColor = [UIColor orangeColor];
    }
    return _label;
}
@end
