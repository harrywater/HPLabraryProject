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

static NSString* CELL_INDENTIFIER=@"IPHONE_LIST_CELL";

@interface IphoneIndexTableViewController ()
{
    NSArray* listArray;
}
@end

@implementation IphoneIndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_INDENTIFIER];
    listArray=@[@"异步下载图片,缩放滚动",@"在线电影",@"3",@"4",@"6"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==1) {
        HPMovieViewController* hpmovieViewController=[[HPMovieViewController alloc]init];
        [self presentViewController:hpmovieViewController animated:YES completion:NULL];
        return;
    }
    if (indexPath.row==2) {
        [self movieBtnAction];
        return;
    }
    HPZoomViewController* hpScrollImageView=[[HPZoomViewController alloc]init];
    [self presentViewController:hpScrollImageView animated:YES completion:NULL];
}
-(void)movieBtnAction{
    //    MPMoviePlayerViewController* moviePlayerController=[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:@"https://s3.amazonaws.com/adplayer/colgate.mp4"]];
//    NSString *path=[[NSBundle mainBundle] pathForResource:@"mov" ofType:@"mp4"];
//    NSString *path=[[NSBundle mainBundle] pathForResource:@"cdts" ofType:@"rmvb"];
//    NSURL *URL = [[NSURL alloc] initFileURLWithPath:path];
    NSURL *URL = [[NSURL alloc] initWithString:@"http://222.186.59.219:8080/mov.mp4"];
    DLog(@"url===%@",URL);
    MPMoviePlayerViewController *movie = [[MPMoviePlayerViewController alloc]initWithContentURL:URL];
    [movie.moviePlayer prepareToPlay];
    movie.moviePlayer.controlStyle=MPMovieControlStyleFullscreen;
    [movie.view setFrame:self.view.bounds];
    [movie.moviePlayer play];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(movieFinishedCallback:)
                                                name:MPMoviePlayerPlaybackDidFinishNotification
                                              object:movie.moviePlayer];
    
    [self presentMoviePlayerViewControllerAnimated:movie];
    
}

-(void)movieFinishedCallback:(NSNotification*)notify{
    
    // 视频播放完或者在presentMoviePlayerViewControllerAnimated下的Done按钮被点击响应的通知。
    MPMoviePlayerController* theMoviePlayer = [notify object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:theMoviePlayer];
    
    [self dismissMoviePlayerViewControllerAnimated];
}

@end
