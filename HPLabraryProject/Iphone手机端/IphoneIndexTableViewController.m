//
//  IphoneIndexTableViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/21.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "IphoneIndexTableViewController.h"
#import "HPZoomViewController.h"
#import "HPMovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "HPWebViewController.h"
#import "HPNSTimerDemoViewController.h"
#import "HPCycleViewController.h"
#import "HPCoreTextViewController.h"
#import "HPLayerViewController.h"
#import "HPRuntimeViewController.h"
#import "HPAutoReleasePoolViewController.h"
#import "HPTableViewPerformanceViewController.h"
#import "HPSetNeedLayoutViewController.h"
#import "HPAnimationViewController.h"
#import "HPUIButtonEdgeInsetViewController.h"
#import <Foundation/Foundation.h>
static NSString* CELL_INDENTIFIER=@"IPHONE_LIST_CELL";

@interface IphoneIndexTableViewController ()
{
    NSArray* listArray;
    NSArray* classNameArr;
}
@end

@implementation IphoneIndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_INDENTIFIER];
    listArray=@[@"异步下载图片,缩放滚动",@"在线电影",@"wenView加载",@"timer应用",@"循环tableView",@"UITextView图文混排",@"Layer画图",@"Runtime",@"AutoReleasePool释放内存",@"tabView优化性能",@"UIView-setNeedLayout",@"CAAnimation动画",@"ButtonEdgeInsetTest"];
    classNameArr = @[@"HPZoomViewController",@"HPMovieViewController",@"HPWebViewController",@"HPNSTimerDemoViewController",@"HPCycleViewController",@"HPCoreTextViewController",@"HPLayerViewController",@"HPRuntimeViewController",@"HPAutoReleasePoolViewController",@"HPTableViewPerformanceViewController",@"HPSetNeedLayoutViewController",@"HPAnimationViewController",@"HPUIButtonEdgeInsetViewController"];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_INDENTIFIER forIndexPath:indexPath];
//    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CELL_INDENTIFIER];
    // Configure the cell...
    cell.textLabel.text=[listArray objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    return cell;
}
- (void)routeVCByIndex:(NSInteger)index
{
    if (index<classNameArr.count) {
        Class VCClass = NSClassFromString(classNameArr[index]);
        UIViewController* vc = [[VCClass alloc]init];
        if ([vc isKindOfClass:[UIViewController class]]) {
            [self presentViewController:vc animated:YES completion:NULL];
        }
        
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    [self routeVCByIndex:indexPath.row];
}


@end
