//
//  HPCycleScrollView.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/24.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "HPCycleScrollView.h"

@interface HPCycleScrollView()
@property(nonatomic,strong)UIImageView* arrowRight;
@property(nonatomic,strong)UIImageView* arrowLeft;
@property(nonatomic,strong)UIPageControl* pageControl;
@end

@implementation HPCycleScrollView

@synthesize scrollView = _scrollView;
@synthesize currentPage = _curPage;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame withPageControl:(BOOL)bol
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width* 3,self.bounds.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentOffset = CGPointMake(0,0);
        _scrollView.pagingEnabled = YES;
        _scrollView.clipsToBounds=YES;
        _scrollView.bounces = NO;
        _scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
        [self addSubview:_scrollView];
        
        // 箭头
        //        [self addSubview:self.arrowLeft];
        //        [self addSubview:self.arrowRight];
        if (bol) {
            [self addSubview:self.pageControl];
        }
        _curPage = 0;
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame withPageControl:NO];;
}

- (void)setDataource:(id<HPCycleScrollViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    _totalPages = [_datasource numberOfPages];
    if (_totalPages == 0) {
        return;
    }
    self.pageControl.numberOfPages = _totalPages;
    [self loadData];
}

- (void)loadData
{
    //从scrollView上移除所有的subview
    NSArray *subViews = [_scrollView subviews];
    if([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self getDisplayImagesWithCurpage:(int)_curPage];
    
    for (int i = 0; i < 3; i++) {
        UIView *v = [_curViews objectAtIndex:i];
        v.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [v addGestureRecognizer:singleTap];
        v.frame = CGRectOffset(v.frame,v.frame.size.width * i,0);//x坐标偏移
        [_scrollView addSubview:v];
    }
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width,0)];
    // 设置选中的点
    self.pageControl.currentPage = _curPage;
    if (_delegate && [_delegate respondsToSelector:@selector(didScollToIndex:)]) {
        [_delegate didScollToIndex:_curPage];
    }
}

- (void)getDisplayImagesWithCurpage:(int)page {
    
    int pre = [self validPageValue:_curPage-1];
    int last = [self validPageValue:_curPage+1];
    
    if (!_curViews) {
        _curViews = [[NSMutableArray alloc] init];
    }
    [_curViews removeAllObjects];
    [_curViews addObject:[_datasource pageAtIndex:pre]];
    [_curViews addObject:[_datasource pageAtIndex:page]];
    [_curViews addObject:[_datasource pageAtIndex:last]];
    
}

- (int)validPageValue:(NSInteger)value {
    
    if(value == -1) value = _totalPages - 1;
    if(value == _totalPages) value = 0;
    
    return (int)value;
    
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    
    if ([_delegate respondsToSelector:@selector(didClickPage:atIndex:)]) {
        [_delegate didClickPage:self atIndex:_curPage];
    }
    
}

- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index
{
    if (index == _curPage) {
        [_curViews replaceObjectAtIndex:1 withObject:view];
        for (int i = 0; i < 3; i++) {
            UIView *v = [_curViews objectAtIndex:i];
            v.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(handleTap:)];
            [v addGestureRecognizer:singleTap];
            v.frame = CGRectOffset(v.frame,v.frame.size.width * i,0);
            [_scrollView addSubview:v];
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    int y = aScrollView.contentOffset.x;
    //往下翻一张
    if(y >= (2*self.frame.size.width)) {
        _curPage = [self validPageValue:_curPage+1];
        NSLog(@"往下翻一张_curPage==%ld",(long)_curPage);
        [self loadData];
    }
    
    //往上翻
    if(y <= 0) {
        _curPage = [self validPageValue:_curPage-1];
         NSLog(@"往上翻_curPage==%ld",(long)_curPage);
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {
    
   [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width,0) animated:YES];
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [self.delegate scrollViewWillBeginDragging:scrollView];
    }
}

#pragma mark getter
- (UIImageView*)arrowLeft
{
    if (_arrowLeft == nil) {
        _arrowLeft = [[UIImageView alloc]initWithFrame:CGRectMake(74/2, IPAD_PRO_HEIGHT/2-158/4, 211/2, 158/2)];
        _arrowLeft.image = getAssetImageByName(@"arrowLeft");
        if (IPAD_HEIGHT<1024) {
            _arrowLeft.frame = CGFitSMRectMake(_arrowLeft.frame);
        }
    }
    return _arrowLeft;
}
- (UIImageView*)arrowRight
{
    if (_arrowRight == nil) {
        _arrowRight = [[UIImageView alloc]initWithFrame:CGRectMake(IPAD_PRO_WIDTH-74/2-211/2, IPAD_PRO_HEIGHT/2-158/4, 211/2, 158/2)];
        _arrowRight.image = getAssetImageByName(@"arrowRight");
        if (IPAD_HEIGHT<1024) {
            _arrowRight.frame = CGFitSMRectMake(_arrowRight.frame);
        }
    }
    return _arrowRight;
}
- (UIPageControl*)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, IPAD_PRO_HEIGHT-50-30, IPAD_PRO_WIDTH, 50)];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:226.0/255.0 green:35.0/255.0 blue:26.0/255.0 alpha:1];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.enabled = NO;
        _pageControl.currentPage = 0;
        if (IPAD_HEIGHT<1024) {
            _pageControl.frame = CGFitSMRectMake(_pageControl.frame);
        }
    }
    return _pageControl;
}
@end
