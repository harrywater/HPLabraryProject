//
//  HPCycleViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 17/2/16.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPCycleViewController.h"
#import "HPCycleScrollView.h"
@interface HPCycleViewController ()<UITableViewDelegate,UITableViewDataSource,HPCycleScrollViewDelegate,HPCycleScrollViewDatasource>

{
    HPCycleScrollView* scro;
}
@property(nonatomic,strong)NSMutableArray* listTableScourceArr;
@end

@implementation HPCycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scro = [[HPCycleScrollView alloc]initWithFrame:CGRectMake(0, 50, self.view.width, self.view.height-50)];
    scro.currentPage = 0;
    scro.datasource = self;
    [self.view addSubview:scro];
    
    NSArray* sourcrArr1 = @[@"11",@"12",@"13",@"14",@"15"];
    NSArray* sourcrArr2 = @[@"21",@"22",@"23",@"24",@"25",@"26"];
    NSArray* sourcrArr3 = @[@"31",@"32",@"33",@"34"];
    NSArray* sourcrArr4 = @[@"41",@"42",@"43",@"44",@"45",@"46",@"47"];
    [self.listTableScourceArr addObjectsFromArray:@[sourcrArr1,sourcrArr2,sourcrArr3,sourcrArr4]];
    [scro reloadData];
    scro.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.backBtn];
    
    UIButton* addBtn = [[UIButton alloc]initWithFrame:CGRectMake(300, 10, 50, 30)];
    [addBtn setTitle:@"增加" forState:UIControlStateNormal];
    addBtn.backgroundColor = [UIColor redColor];
    [addBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}

- (void)addAction
{
    NSArray* sourcrArr5 = @[@"add51",@"add52",@"add53",@"add54",@"add55",@"add56",@"add57",@"add58",@"add59"];
    [self.listTableScourceArr addObject:sourcrArr5];
    [scro reloadData];
}
- (NSInteger)numberOfPages
{
    return self.listTableScourceArr.count;
}
- (UIView *)pageAtIndex:(NSInteger)index
{
    UITableView* tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, scro.width,scro.height)];
    tbView.dataSource = self;
    tbView.delegate = self;
    tbView.tag = index+1;
    tbView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    return tbView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* indentifier = @"resuq";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    NSArray* sourceArr = self.listTableScourceArr[tableView.tag-1];
    cell.textLabel.text = sourceArr[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* sourceArr = self.listTableScourceArr[tableView.tag-1];
    return sourceArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (NSMutableArray*)listTableScourceArr
{
    if (_listTableScourceArr == nil) {
        _listTableScourceArr = [NSMutableArray array];
    }
    return _listTableScourceArr;
}

@end
