//
//  HPMovieViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/30.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "HPMovieViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface HPMovieViewController ()

@end

@implementation HPMovieViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIButton* movieBtn=[[UIButton alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    movieBtn.layer.masksToBounds=YES;
    movieBtn.layer.cornerRadius=8;
    [movieBtn setTitle:@"播放" forState:UIControlStateNormal];
    movieBtn.backgroundColor=[UIColor yellowColor];
    [movieBtn addTarget:self action:@selector(movieBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:movieBtn];
    
}
-(void)movieBtnAction{
//    MPMoviePlayerViewController* moviePlayerController=[[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:@"https://s3.amazonaws.com/adplayer/colgate.mp4"]];

    MPMoviePlayerViewController *movie = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:@"https://s3.amazonaws.com/adplayer/colgate.mp4"]];
    [movie.moviePlayer prepareToPlay];
    movie.moviePlayer.controlStyle=MPMovieControlStyleFullscreen;
    [movie.view setFrame:self.view.bounds];
    [self.view addSubview:movie.view];
    [movie.moviePlayer play];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(movieFinishedCallback:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification
                                             object:movie];
    
}

-(void)movieFinishedCallback:(NSNotification*)notify{
    
    // 视频播放完或者在presentMoviePlayerViewControllerAnimated下的Done按钮被点击响应的通知。
    MPMoviePlayerViewController* theMovie = [notify object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                   name:MPMoviePlayerPlaybackDidFinishNotification
                                                 object:theMovie];
    
    [self dismissMoviePlayerViewControllerAnimated];
    [theMovie.view removeFromSuperview];
}
@end
