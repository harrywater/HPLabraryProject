//
//  HPScrolleView.h
//  LBJNPro
//
//  Created by 王辉平 on 17/5/11.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HPScrollViewDelegate;
@protocol HPScrollViewDatasource;


@interface HPScrolleView : UIView<UIScrollViewDelegate>
{
    NSInteger _totalPages;
    NSInteger _curPage;
    NSMutableArray *_curViews;
}

@property (nonatomic,readonly) UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger thisImageCount;
@property (nonatomic,weak,setter = setDataource:) id<HPScrollViewDatasource> datasource;
@property (nonatomic,weak,setter = setDelegate:) id<HPScrollViewDelegate> delegate;

- (void)reloadData;
- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;
- (void)setPageControlPointSelectImg:(NSString*)selImgName andNormalImg:(NSString*)normalImgName;

@end

@protocol HPScrollViewDelegate <NSObject>

@optional
- (void)didClickPage:(HPScrolleView *)csView atIndex:(NSInteger)index;
- (void)didScollToIndex:(NSInteger)index;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
@end

@protocol HPScrollViewDatasource <NSObject>

@required
- (NSInteger)numberOfPages;
- (UIView *)pageAtIndex:(NSInteger)index;

@end
