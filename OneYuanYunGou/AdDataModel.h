//
//  AdDataModel.h
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/9.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdDataModel : NSObject

@property (strong, nonatomic) NSArray *imageNameArr;

- (instancetype)initWithImageName;
+ (id)adDataModelWithImageName;

@end
