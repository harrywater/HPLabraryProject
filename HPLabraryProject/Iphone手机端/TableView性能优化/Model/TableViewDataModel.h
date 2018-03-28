//
//  TableViewDataModel.h
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/8.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewDataModel : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;


@end
