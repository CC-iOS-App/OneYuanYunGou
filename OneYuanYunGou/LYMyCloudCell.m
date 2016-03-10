//
//  LYMyCloudCell.m
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/10.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import "LYMyCloudCell.h"
#import "Masonry.h"

@implementation LYMyCloudCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self setLayout];
    }
    
    return self;
}

- (void)setLayout
{
    _label = [[UILabel alloc] init];
    _label.font = [UIFont systemFontOfSize:13.0];
    [self.contentView addSubview:_label];
    
    _imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:_imageV];
    
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@10);
        make.bottom.equalTo(@-10);
        make.width.equalTo(@18);
        make.height.equalTo(@20);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageV.mas_right).with.offset(10);
        make.centerY.equalTo(_imageV.mas_centerY);
    }];
}

@end
