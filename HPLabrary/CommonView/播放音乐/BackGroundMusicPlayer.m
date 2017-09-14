//
//  MusicPlayer.m
//  JNHF
//
//  Created by TeamGo on 16/3/8.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "BackGroundMusicPlayer.h"
#import "HPDocManager.h"

static BackGroundMusicPlayer *player;

@interface BackGroundMusicPlayer()

@property (nonatomic,strong) AVAudioPlayer *thePlayer;

@end


@implementation BackGroundMusicPlayer

+ (instancetype)musicPlayer
{
    if (!player) {
        player = [[BackGroundMusicPlayer alloc] init];
    }
    
    
    return player;
}

- (void)palyWithMusicName:(NSString*)mName
{
    [self stopPlay];
    NSString *musicFilePath = [HPDocManager musicFileWithPath:mName];       //创建音乐文件路径
    NSURL *musicURL = [[NSURL alloc] initFileURLWithPath:musicFilePath];
    
    AVAudioPlayer *thePlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    
    //创建播放器
    _thePlayer = thePlayer;    //赋值给自己定义的类变量
    
    [_thePlayer prepareToPlay];
    [_thePlayer setVolume:1];   //设置音量大小
    _thePlayer.numberOfLoops = -1;//设置音乐播放次数  -1为一直循环
    [_thePlayer play];   //播放
}

- (void)stopPlay
{
    if (_thePlayer || _thePlayer.isPlaying) {
        [_thePlayer stop];
        _thePlayer = nil;
    }
}
- (BOOL)isMusiPlaying
{
    return _thePlayer.isPlaying;
}
@end
