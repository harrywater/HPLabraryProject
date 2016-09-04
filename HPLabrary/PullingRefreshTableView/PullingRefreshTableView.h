//
//  PullingRefreshTableView.h
//  PullingTableView
//
//  Created by danal on 3/6/12. QQ:290994669
//  If you want use it,please leave my name here
//  Copyright (c) 2012 danal Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kPRStateNormal = 0,
    kPRStatePulling = 1,
    kPRStateLoading = 2,
    kPRStateHitTheEnd = 3
} PRState;

@interface LoadingView : UIView {
    UILabel *_stateLabel;
    UILabel *_dateLabel;
    UIImageView *_arrowView;
    UIActivityIndicatorView *_activityView;
    CALayer *_arrow;
    BOOL _loading;
}
@property (nonatomic,getter = isLoading) BOOL loading;    
@property (nonatomic,getter = isAtTop) BOOL atTop;
@property (nonatomic) PRState state;

- (id)initWithFrame:(CGRect)frame atTop:(BOOL)top;

@end

@protocol PullingRefreshTableViewDelegate;

@interface PullingRefreshTableView : UITableView <UIScrollViewDelegate>{
    LoadingView *_headerView;
    LoadingView *_footerView;
    UILabel *_msgLabel;
    BOOL _loading;
    BOOL _isFooterInAction;
    NSInteger _bottomRow;
}
@property (assign,nonatomic) id <PullingRefreshTableViewDelegate> pullingDelegate;
@property (nonatomic) BOOL autoScrollToNextPage;
@property (nonatomic) BOOL reachedTheEnd;
@property (nonatomic,getter = isHeaderOnly) BOOL headerOnly;
@property (nonatomic,getter = isFooterOnly) BOOL footerOnly;
- (id)initWithFrame:(CGRect)frame pullingDelegate:(id<PullingRefreshTableViewDelegate>)aPullingDelegate;

- (void)tableViewDidScroll:(UIScrollView *)scrollView;

- (void)tableViewDidEndDragging:(UIScrollView *)scrollView;

- (void)tableViewDidFinishedLoading;

- (void)tableViewDidFinishedLoadingWithMessage:(NSString *)msg;

- (void)launchRefreshing;
- (void)tableViewRefreshFinishedLoading;

@end



@protocol PullingRefreshTableViewDelegate <NSObject>

@required
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView;

@optional
- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView;
//- (void)pullingTableViewDidFinishedLoading:(PullingRefreshTableView *)tableView;
//- (void)pullingTableViewDidFinishedRefreshing:(PullingRefreshTableView *)tableView;
@end

//Usage example
/*
_tableView = [[PullingRefreshTableView alloc] initWithFrame:frame pullingDelegate:aPullingDelegate];
[self.view addSubview:_tableView];
_tableView.autoScrollToNextPage = NO;
_tableView.delegate = self;
_tableView.dataSource = self;
*/