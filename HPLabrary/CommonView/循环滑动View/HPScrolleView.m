//
//  HPScrolleView.m
//  LBJNPro
//
//  Created by 王辉平 on 17/5/11.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPScrolleView.h"

@interface HPScrolleView()
@property(nonatomic,strong)UIImageView* arrowRight;
@property(nonatomic,strong)UIImageView* arrowLeft;
@property(nonatomic,strong)UIPageControl* pageControl;
@end

@implementation HPScrolleView
@synthesize scrollView = _scrollView;
@synthesize currentPage = _curPage;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (!_curViews) {
            _curViews = [[NSMutableArray alloc] init];
        }
        _curPage = 0;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
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
        [self addSubview:self.pageControl];
        
    }
    return self;
}
- (void)setPageControlPointSelectImg:(NSString*)selImgName andNormalImg:(NSString*)normalImgName
{
    //KVC
    [self.pageControl setValue:getImageFromImgDirByName(normalImgName) forKeyPath:@"_pageImage"];
    [self.pageControl setValue:getImageFromImgDirByName(selImgName) forKeyPath:@"_currentPageImage"];
}
- (void)setDataource:(id<HPScrollViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    _totalPages = [_datasource numberOfPages];
    _scrollView.contentSize = CGSizeMake(self.bounds.size.width* _totalPages,self.bounds.size.height);
    if (_totalPages == 0) {
        return;
    }
    if (_curViews.count) {
        [_curViews removeAllObjects];
    }
    for (int i = 0; i<_totalPages; i++) {
        [_curViews addObject:[_datasource pageAtIndex:i]];
    }
    self.pageControl.numberOfPages = _totalPages;
    [self loadData];
}

- (void)loadData
{

    for (int i = 0; i < _curViews.count; i++) {
        UIView *v = [_curViews objectAtIndex:i];
        v.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [v addGestureRecognizer:singleTap];
        v.frame = CGRectOffset(v.frame,v.frame.size.width * i,0);//x坐标偏移
        [_scrollView addSubview:v];
    }
    
    [_scrollView setContentOffset:CGPointMake(0,0)];
    // 设置选中的点
    self.pageControl.currentPage = _curPage;
    
//    if (_delegate && [_delegate respondsToSelector:@selector(didScollToIndex:)]) {
//        [_delegate didScollToIndex:_curPage];
//    }
    
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
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page =(NSInteger)(scrollView.contentOffset.x/scrollView.width);
    NSLog(@"page===%ld",page);
    _curPage = page;
    // 设置选中的点
    self.pageControl.currentPage = _curPage;

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
