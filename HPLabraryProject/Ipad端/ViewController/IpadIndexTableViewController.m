//
//  IpadIndexTableViewController.m
//  HPLabraryProject
//
//  Created by 王辉平 on 15/12/21.
//  Copyright © 2015年 王辉平. All rights reserved.
//

#import "IpadIndexTableViewController.h"
#import "IpadIndexTableViewModel.h"

static NSString* CELL_INDENTIFIER=@"IPAD_LIST_CELL";

@interface IpadIndexTableViewController ()
{
    NSArray* listArray;
}
@property(nonatomic,strong)IpadIndexTableViewModel* viewModel;
@end

@implementation IpadIndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_INDENTIFIER];
    listArray=@[@"缩放滚动,多张大图滑动内存优化",@"计算器",@"定点720",@"360or180旋转",@"6"];
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


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (IpadIndexTableViewModel*)viewModel
{
    if (_viewModel == nil) {
        _viewModel = [[IpadIndexTableViewModel alloc]init];
        _viewModel.viewController = self;
    }
    return _viewModel;
}
@end
