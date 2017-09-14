//
//  MusicPlayer.h
//  JNHF
//
//  Created by TeamGo on 16/3/8.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface BackGroundMusicPlayer : NSObject

+ (instancetype)musicPlayer;

- (void)palyWithMusicName:(NSString*)mName;

- (void)stopPlay;

- (BOOL)isMusiPlaying;

@end
