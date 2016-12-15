//
//  IpadIndexTableViewModel.m
//  HPLabraryProject
//
//  Created by 王辉平 on 16/12/15.
//  Copyright © 2016年 王辉平. All rights reserved.
//

#import "IpadIndexTableViewModel.h"
#import "IpadIndexTableViewController.h"
#import "HPScrollImageController.h"
#import "IpadCalculatorViewController.h"
#import "Ipad720ViewController.h"
#import "IpadSanWeiShowViewController.h"

@implementation IpadIndexTableViewModel

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            HPScrollImageController* hpScrollImageView=[[HPScrollImageController alloc]init];
            [self.viewController presentViewController:hpScrollImageView animated:YES completion:NULL];
        }
            break;
        case 1:{
            IpadCalculatorViewController* calucateVC = [[IpadCalculatorViewController alloc]init];
            [self.viewController presentViewController:calucateVC animated:YES completion:NULL];
        }
            break;
        case 2:
        {
            Ipad720ViewController* wbVC = [[Ipad720ViewController alloc]init];
            [self.viewController presentViewController:wbVC animated:YES completion:NULL];
        }
            break;
        case 3:
        {
            IpadSanWeiShowViewController* sanweiVC = [[IpadSanWeiShowViewController alloc]init];
            [self.viewController presentViewController:sanweiVC animated:YES completion:NULL];
        }
            break;
    }
}
@end
