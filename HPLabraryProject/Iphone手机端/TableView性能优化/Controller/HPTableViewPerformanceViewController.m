
//
//  HPTableViewPerformanceViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/7.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPTableViewPerformanceViewController.h"
#import "TableViewDataModel.h"
#import "HPEntityCell.h"

@interface HPTableViewPerformanceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger cout;
}
@property(nonatomic,strong)UITableView* listView;
@property(nonatomic,strong)NSMutableArray* jsonSourceArr;

@end

@implementation HPTableViewPerformanceViewController

- (void)getTestDataCompleteBlock:(void (^)(NSArray*))completeBlock {
    // Simulate an async request
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"feed"];
        NSMutableArray *entities = [TableViewDataModel mj_objectArrayWithKeyValuesArray:feedDicts];
        // Callback
        dispatch_async(dispatch_get_main_queue(), ^{
            !completeBlock ?: completeBlock(entities);
        });
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.listView];
    [self.view addSubview:self.backBtn];
    
    HPWeakSelf(self);
    [self getTestDataCompleteBlock:^(NSArray* soucres) {
        [weakself.jsonSourceArr addObjectsFromArray:soucres];
        [weakself.listView reloadData];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOfSectionsInTableView");
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSLog(@"heightForFooterInSection");
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSLog(@"heightForHeaderInSection");
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"heightForRowAtIndexPath");
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection");
    return self.jsonSourceArr.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath");
    static NSString* indentifier = @"cellIndentifier";
    HPEntityCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
//    if (!cell) {
//        cell = [[HPEntityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
//    }
    
    return cell;
}
- (UITableView*)listView
{
    if (_listView == nil) {
        _listView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenFrame.width, ScreenFrame.height) style:UITableViewStyleGrouped];
        _listView.delegate = self;
        _listView.dataSource = self;
        [_listView registerClass:[HPEntityCell class] forCellReuseIdentifier:@"cellIndentifier"];
//        _listView.editing = YES;
    }
    return _listView;
}
- (NSMutableArray*)jsonSourceArr
{
    if (_jsonSourceArr == nil) {
        _jsonSourceArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _jsonSourceArr;
}

@end
