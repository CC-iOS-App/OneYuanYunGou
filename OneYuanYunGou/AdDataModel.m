//
//  AdDataModel.m
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/9.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import "AdDataModel.h"

@implementation AdDataModel

- (instancetype)initWithImageName
{
    self = [super init];
    if (self) {
        _imageNameArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AdData.plist" ofType:nil]];
    }
    
    return self;
}

+ (id)adDataModelWithImageName
{
    return [[self alloc] initWithImageName];
}

@end
