//
//  TableViewDataModel.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/8.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "TableViewDataModel.h"

@implementation TableViewDataModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}

@end
