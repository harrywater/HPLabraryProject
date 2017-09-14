//
//  HPRotateView.m
//  LBJNPro
//
//  Created by 王辉平 on 17/5/4.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPRotateView.h"
//#import "UIImageView+UITouch.h"
//#import "UIScrollView+UITouch.h"

@interface HPRotateView()<UIScrollViewDelegate>
{
    NSInteger sequenceSize; //资源数组大小
    NSInteger imageIndex; // 读取图片的索引
    NSInteger kPanelTotal;
    NSInteger kImageSpacing;
    NSInteger currentOffset;
    CGFloat   kSlideSpeed; // 滑动速度
    CGFloat   kImageWidth;
    CGFloat   kImageHeight;
    
    BOOL isScal;
    
    CGFloat lastDistance;
    CGFloat imgStartWidth;
    CGFloat imgStartHeight;
    
    
    CGFloat lastScale;
    CGRect oldFrame;    //保存图片原来的大小
    CGRect largeFrame;  //确定图片放大最大的程度
    
    SLIDETYPE slideType; // 360 or 180
    
}
@property(nonatomic,strong)NSArray* imgPathSource;
@property(nonatomic,strong)UIScrollView* scro;
@property(nonatomic,strong)UIImageView *showView;
@property(nonatomic,strong)UITapGestureRecognizer *doubleTapGestureRecognizer;
@end

@implementation HPRotateView

+(id)createWithDs:(NSArray*)ds atIndex:(int)index andSlideType:(SLIDETYPE)type
{
    return [[self alloc] initWithFrame:VIEW_RECT_FRAME ds:ds index:index andSlideType:type];
}
+(id)createWithDs:(NSArray*)ds atIndex:(int)index
{
    return [[self alloc] initWithFrame:VIEW_RECT_FRAME ds:ds index:index];
}
-(id)initWithFrame:(CGRect)frame ds:(NSArray*)ds index:(NSInteger)index andSlideType:(SLIDETYPE)type
{
    self = [super initWithFrame:frame];
    slideType = type;
    self.imgPathSource = ds;
    imageIndex = index;
    sequenceSize = self.imgPathSource.count;
    HPWeakSelf(self);
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakself initLayoutView];
    });
    return self;
}
-(id)initWithFrame:(CGRect)frame ds:(NSArray*)ds index:(NSInteger)index
{
    self = [super initWithFrame:frame];
    self.imgPathSource = ds;
    imageIndex = index;
    sequenceSize = self.imgPathSource.count;
    HPWeakSelf(self);
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakself initLayoutView];
    });
    return self;
}
-(BOOL)becomeFirstResponder
{
    return YES;
}

- (void)initLayoutView
{
    // 基础配置
    kPanelTotal = 3; //面板总数
    kImageSpacing = IPAD_WIDTH/2;
    kSlideSpeed = 5; //滑动速度  默认5
    currentOffset = kImageSpacing * sequenceSize;
    
    lastDistance = 0;
    imgStartWidth=self.width;
    imgStartHeight=self.height;
    
    [self addSubview:self.showView];
    [self addSubview:self.scro];
    
    oldFrame = self.showView.frame;
    largeFrame = CGRectMake(0 - self.width, 0 - self.height, 3 * oldFrame.size.width, 3 * oldFrame.size.height);
    if (slideType != SLIDE_180) {
        // 缩放手势
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
        [self.scro addGestureRecognizer:pinchGestureRecognizer];
    }
 
}
// 处理缩放手势
- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    if (self.scaleNoEnable) {
        return;
    }
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        self.showView.transform = CGAffineTransformScale(self.showView.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        if (self.showView.frame.size.width < oldFrame.size.width) {
            self.showView.frame = oldFrame;
            //让图片无法缩得比原图小
        }
        if (self.showView.frame.size.width > 3 * oldFrame.size.width) {
            self.showView.frame = largeFrame;
        }
        pinchGestureRecognizer.scale = 1;
    }
}

- (void)updateAnimationView
{
    if(slideType == SLIDE_180){
        if (imageIndex<=0) {
            imageIndex = 0;
        }
        if (imageIndex>=sequenceSize) {
            imageIndex =sequenceSize-1;
        }
        self.showView.image = [self getImageWithIndex:imageIndex];
    }else{
        if (imageIndex <= 0) imageIndex = sequenceSize-1;
        if (imageIndex >= sequenceSize) imageIndex = 0;
        self.showView.image = [self getImageWithIndex:(sequenceSize -1) - imageIndex];
    }
    // 如果需要 回调处理
    if (self.delegate) {
        if([(NSObject *)self.delegate respondsToSelector:@selector(handleScroSlidePage:)])
        {
            [self.delegate handleScroSlidePage:imageIndex];
        }
    }
}

- (void)setCurImgIndex:(NSInteger)curIndex
{
    imageIndex = curIndex;
}
- (void)resetShowView
{
    imageIndex = 0;
    self.showView.frame = VIEW_RECT_FRAME;
    self.showView.image = [self getImageWithIndex:imageIndex];
}

- (UIImage *)getImageWithIndex:(NSInteger)aIndex
{
    
    if (aIndex<self.imgPathSource.count) {
        return getFullPathImage(self.imgPathSource[aIndex]);
    }else{
        return nil;
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollView.contentOffset.x==%f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x < currentOffset - kSlideSpeed ) {
        NSLog(@"右滑动");
        imageIndex++;
        currentOffset = scrollView.contentOffset.x;
        [self updateAnimationView];
    } else if (scrollView.contentOffset.x > currentOffset + kSlideSpeed) {
        NSLog(@"左滑动");
        imageIndex--;
        currentOffset = scrollView.contentOffset.x;
        [self updateAnimationView];
    }
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    
    [scrollView setContentOffset:scrollView.contentOffset animated:YES];
}

- (void)_handleDoubleTapAction:(UITapGestureRecognizer *)sender {
    if (sender.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint location = [sender locationInView:self];
    NSLog(@"location==x==%f,===y===%f",location.x,location.y);
}

#pragma mark getter
- (UIScrollView*)scro
{
    if (_scro == nil) {
        _scro = [[UIScrollView alloc]initWithFrame:VIEW_RECT_FRAME];
        _scro.delegate = self;
        _scro.bounces = NO;
        _scro.scrollEnabled = YES;
        _scro.pagingEnabled = NO;
        _scro.contentSize = CGSizeMake(kPanelTotal * kImageSpacing * sequenceSize , _scro.height);
        _scro.contentOffset = CGPointMake(kImageSpacing * sequenceSize , 0);
        _scro.userInteractionEnabled = YES;
        _scro.showsHorizontalScrollIndicator = NO;
        _scro.showsVerticalScrollIndicator = NO;
        _scro.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    return _scro;
}
- (UIImageView*)showView
{
    if (_showView == nil) {
        _showView = [[UIImageView alloc]initWithFrame:VIEW_RECT_FRAME];
        _showView.image = [self getImageWithIndex:0];
    }
    return _showView;
}

- (UITapGestureRecognizer *)doubleTapGestureRecognizer {
    if (!_doubleTapGestureRecognizer) {
        _doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_handleDoubleTapAction:)];
        _doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    }
    return _doubleTapGestureRecognizer;
}

@end
