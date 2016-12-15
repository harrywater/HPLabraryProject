//
//  IpadIndexTableViewModel.h
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/15.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IpadIndexTableViewController;

@interface IpadIndexTableViewModel : NSObject
@property(nonatomic,weak)IpadIndexTableViewController* viewController;

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
