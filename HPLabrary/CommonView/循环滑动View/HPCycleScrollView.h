//
//  HPCycleScrollView.h
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/24.
//  Copyright © 2015年 王辉平. All rights reserved.
//
//作用:三页滑动，减少内存页面

#import <UIKit/UIKit.h>

@protocol HPCycleScrollViewDelegate;
@protocol HPCycleScrollViewDatasource;

@interface HPCycleScrollView : UIView<UIScrollViewDelegate>
{
    NSInteger _totalPages;
    NSInteger _curPage;
    NSMutableArray *_curViews;
}

@property (nonatomic,readonly) UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger thisImageCount;
@property (nonatomic,assign) BOOL scrollCycle;
@property (nonatomic,weak,setter = setDataource:) id<HPCycleScrollViewDatasource> datasource;
@property (nonatomic,weak,setter = setDelegate:) id<HPCycleScrollViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame withPageControl:(BOOL)bol;
- (void)reloadData;
- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;

@end

@protocol HPCycleScrollViewDelegate <NSObject>

@optional
- (void)didClickPage:(HPCycleScrollView *)csView atIndex:(NSInteger)index;
- (void)didScollToIndex:(NSInteger)index;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
@end

@protocol HPCycleScrollViewDatasource <NSObject>

@required
- (NSInteger)numberOfPages;
- (UIView *)pageAtIndex:(NSInteger)index;

@end
