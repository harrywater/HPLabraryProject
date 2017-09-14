//
//  HPMRZoomScrollView.h
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/24.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "HPMRZoomScrollView.h"

@interface HPMRZoomScrollView (Utility)

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;

@end

@implementation HPMRZoomScrollView

@synthesize imageView=_imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        [self initImageView];
    
    }
    return self;
}

- (void)initImageView
{
    _imageView = [[UIImageView alloc]init];
    
    // The imageView can be zoomed largest size
    //imageView.frame = CGRectMake(0, 0, MRScreenWidth * 2.5, MRScreenHeight * 2.5);
    _imageView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * 2.5, [UIScreen mainScreen].bounds.size.height * 2.5);
    _imageView.userInteractionEnabled = YES;
    [self addSubview:_imageView];

    // Add gesture,double tap zoom imageView.
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(handleDoubleTap:)];
    [doubleTapGesture setNumberOfTapsRequired:2];
    [_imageView addGestureRecognizer:doubleTapGesture];
    
    float minimumScale = self.frame.size.width / _imageView.frame.size.width;
    [self setMinimumZoomScale:minimumScale];
    [self setZoomScale:minimumScale];
}
//- (void)resetDefaultScale
//{
//    float minimumScale = self.frame.size.width / _imageView.frame.size.width;
//    [self setZoomScale:minimumScale animated:NO];
//}
#pragma mark - Zoom methods

- (void)handleDoubleTap:(UIGestureRecognizer *)gesture
{
    float newScale = self.zoomScale * 1.5;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gesture locationInView:gesture.view]];
    if (self.handleBlock) {
        self.handleBlock(1.5);
    }
    [self zoomToRect:zoomRect animated:YES];
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center
{
    CGRect zoomRect;
    zoomRect.size.height = self.frame.size.height / scale;
    zoomRect.size.width  = self.frame.size.width  / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    if (scale<=0.5) {
        DLog(@"0.4");
    }else{
        DLog(@"1");
    }
    [scrollView setZoomScale:scale animated:NO];
}
@end
