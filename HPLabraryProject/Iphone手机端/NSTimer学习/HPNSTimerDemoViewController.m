//
//  HPNSTimerDemoViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/16.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPNSTimerDemoViewController.h"

@interface HPNSTimerDemoViewController ()

@end

@implementation HPNSTimerDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"mainThreadRunLoop====%@",[NSRunLoop currentRunLoop]);
    // 实现1 异步线程开启timer
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES]; [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//        
//        // 子线程开启timer  由于默认runLoop是没有运行的，需要手动开启runLoop 不开的话 timer不会运行
//        [[NSRunLoop currentRunLoop]run];
//    });
    
//    // 实现2  开一个子线程 子线程中加入一个timer
//    [NSThread detachNewThreadSelector:@selector(threadTask) toTarget:self withObject:nil];
//
//    // 实现3 主线程加timer
//    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}
- (void)timerTask:(NSTimer*)tmpTimer
{
    NSLog(@"timer跑动=======666666666");
}
-(void) threadTask{
    
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES];
    
     // 子线程开启timer 先要把timer加入到loop然后run
    //由于默认子线程runLoop是没有运行的，需要手动开启runLoop 不开的话 timer不会运行
    
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}
@end
