//
//  AdScrollerView.h
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/9.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIPageControlScrStyle)
{
    UIPageControlScrStyleNone,   //系统默认滚动
    UIPageControlScrStyleLeft,   //用户左滑
    UIPageControlScrStyleRight,  //用户右滑
};

@interface AdScrollerView : UIScrollView <UIScrollViewDelegate>

@property (retain, nonatomic, readonly) UIPageControl *pageControl;
@property (retain, nonatomic) NSArray *imageNameArr;
@property (assign, nonatomic) UIPageControlScrStyle pageControlScrollerStyle;

@end
