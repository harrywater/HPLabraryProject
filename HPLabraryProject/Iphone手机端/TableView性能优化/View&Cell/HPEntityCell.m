//
//  HPEntityCell.m
//  HPLabraryProject
//
//  Created by 王辉平 on 2017/12/14.
//  Copyright © 2017年 王辉平. All rights reserved.
//

#import "HPEntityCell.h"
@interface HPEntityCell()
@property (nonatomic, strong)   UILabel *titleLabel;
@property (nonatomic, strong)   UILabel *contentLabel;
@property (nonatomic, strong)   UIImageView *contentImageView;
@property (nonatomic, strong)   UILabel *usernameLabel;
@property (nonatomic, strong)   UILabel *timeLabel;
@end

@implementation HPEntityCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}
- (void)initSubViews
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    self.contentView.backgroundColor = [UIColor redColor];
    self.imageView.backgroundColor = [UIColor greenColor];
    CGFloat w = [[UIScreen mainScreen]bounds].size.width;
    self.timeLabel.frame = CGRectMake(0, 0, w, 44);
    self.timeLabel.text = @"AAAAAAAAAAAAAAA";
    self.timeLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.timeLabel];
//    [self addSubview:self.timeLabel];
}
- (UILabel*)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}
- (UILabel*)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
    }
    return _contentLabel;
}
- (UILabel*)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc]init];
    }
    return _usernameLabel;
}
- (UILabel*)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc]init];
    }
    return _timeLabel;
}
- (UIImageView*)contentImageView
{
    if (_contentImageView == nil) {
        _contentImageView = [[UIImageView alloc]init];
    }
    return _contentImageView;
}

@end
