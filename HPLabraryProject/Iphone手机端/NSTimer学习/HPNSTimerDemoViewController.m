//
//  HPNSTimerDemoViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/16.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "HPNSTimerDemoViewController.h"

@interface HPNSTimerDemoViewController ()
@property (nonatomic, strong) dispatch_source_t timer;
@end

@implementation HPNSTimerDemoViewController
- (void)gcdTimer
{
    __block  int count = 0;
    
    // 获得队列
//    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
//    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_t tim = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
    // 何时开始执行第一个任务
    // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 比当前时间晚3秒
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(tim, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(tim, ^{
        NSLog(@"timer thread------------%@---cout---%d", [NSThread currentThread],count);
        count++;
        NSLog(@"tim==%@",tim);
        if (count == 400) {
            // 取消定时器
            dispatch_cancel(self.timer);
            self.timer = nil;
        }
    });
    
    // 启动定时器
    dispatch_resume(tim);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backBtn];
//    NSLog(@"mainThreadRunLoop====%@",[NSRunLoop currentRunLoop]);
    // 实现1 异步线程开启timer
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES]; [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//        
//        // 子线程开启timer  由于默认runLoop是没有运行的，需要手动开启runLoop 不开的话 timer不会运行
//        [[NSRunLoop currentRunLoop]run];
//    });
    
    // 实现2  开一个子线程 子线程中加入一个timer
//    [NSThread detachNewThreadSelector:@selector(threadTask) toTarget:self withObject:nil];

//    // 实现3 主线程加timer
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//
//
    UIScrollView * scro = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 400, self.view.width, 300)];
    scro.contentSize =CGSizeMake(self.view.width, 900);
    scro.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scro];
    
    
    //实现4  默认每秒运行60次 CADisplayLink是一个和屏幕刷新率同步的定时器类，可以使用CADisplayLink做一些和屏幕操作相关的操作。
//    CADisplayLink* linkTimer = [CADisplayLink displayLinkWithTarget:self
//                                            selector:@selector(linkTimer:)];
////    [linkTimer setFrameInterval:2];
//    [linkTimer addToRunLoop:[NSRunLoop currentRunLoop]
//                    forMode:NSDefaultRunLoopMode];
    
    //实现5  自动将创建的定时器以默认方式添加到当前线程runloop中，而无需手动添加
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES];
    
    //实现6  GCD
//    [self gcdTimer];
}
- (void)linkTimer:(CADisplayLink*)tmpTimer
{
    NSLog(@"CADisplayLink_timer跑动=======666666666");
}
- (void)timerTask:(NSTimer*)tmpTimer
{
    NSLog(@"timer跑动=======666666666");
}
-(void)threadTask{
    NSLog(@"threadTask跑动=======666666666===%@===mainThread==%@",[NSThread currentThread],[NSThread mainThread]);
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTask:) userInfo:nil repeats:YES];
    
     // 子线程开启timer 先要把timer加入到loop然后run
    //由于默认子线程runLoop是没有运行的，需要手动开启runLoop 不开的话 timer不会运行
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}
@end
