//
//  HPAutoReleasePoolViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 17/9/14.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPAutoReleasePoolViewController.h"
#import <mach/mach.h>

static const int poolSection = 50000;
static const int poolCount = 20 * poolSection;

@interface HPAutoReleasePoolViewController ()
@property(strong, nonatomic) NSMutableArray *memoryUsageList1;
@property(strong, nonatomic) NSMutableArray *memoryUsageList2;
@end

@implementation HPAutoReleasePoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backBtn];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _memoryUsageList1 = [NSMutableArray new];
    _memoryUsageList2 = [NSMutableArray new];
    
    UIButton* btnTest = [[UIButton alloc]initWithFrame:CGRectMake((self.view.width-200)/2, 400, 200, 100)];
    btnTest.backgroundColor = [UIColor redColor];
    [btnTest addTarget:self action:@selector(runTest) forControlEvents:UIControlEventTouchUpInside];
    [btnTest setTitle:@"RunTest" forState:UIControlStateNormal];
    [self.view addSubview:btnTest];
    
}
- (void)runTest{
    dispatch_queue_t serialQueue = dispatch_queue_create("me.hp.test.autoreleasepool", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(serialQueue, ^{
        for (int i = 0; i < poolCount; i++) {
            @autoreleasepool {
                NSNumber *num = [NSNumber numberWithInt:i];
                NSString *str = [NSString stringWithFormat:@"%d ", i];
                
                //Use num and str...whatever...
                [NSString stringWithFormat:@"%@%@", num, str];
                
                if (i % poolSection == 0) {
                    [_memoryUsageList1 addObject:@(getMerroyUsage())];
                }
            }
        }
    });
    dispatch_sync(serialQueue, ^{
        for (int i = 0; i < poolCount; i++) {
            NSNumber *num = [NSNumber numberWithInt:i];
            NSString *str = [NSString stringWithFormat:@"%d ", i];
            
            //Use num and str...whatever...
            [NSString stringWithFormat:@"%@%@", num, str];
            
            if (i % poolSection == 0) {
                [_memoryUsageList2 addObject:@(getMerroyUsage())];
            }
        }
    });
    
    //Done work
    dispatch_sync(serialQueue, ^{
        NSLog(@"autoReleasePool==_memoryUsageList1==%@",_memoryUsageList1);
        NSLog(@"_memoryUsageList2==%@",_memoryUsageList2);
    });
}

double getMerroyUsage(void)
{
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerror = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    double memoryUsageInMB = kerror == KERN_SUCCESS ? (info.resident_size / 1024.0 / 1024.0) : 0.0;
    return memoryUsageInMB;
}
@end
