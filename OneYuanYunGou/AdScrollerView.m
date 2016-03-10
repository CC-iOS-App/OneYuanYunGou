//
//  AdScrollerView.m
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/9.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import "AdScrollerView.h"

#define SCREENWIDTH self.bounds.size.width      //广告宽度
#define SCREENHEIGHT self.bounds.size.height    //广告高度

#define HEIGHT self.bounds.origin.y

static CGFloat const changeImageTime = 3.0;
static NSUInteger const pageViewTag = 1000;

@interface AdScrollerView ()
{
    /**
     *  判断是系统滚动还是由人导致的滚动计时器到了，YES为系统滚动，反之人滚动（人滚动一个广告后，这个广告的计时器需归0并重新计时）
     */
    BOOL isTimeUp;
    NSTimer *moveTime;
}

@property (strong, nonatomic) UIImageView *onePageView;
@property (strong, nonatomic) UIImageView *twoPageView;
@property (strong, nonatomic) UIImageView *threePageView;
@property (strong, nonatomic) UIImageView *fourPageView;
@property (strong, nonatomic) UIImageView *fivePageView;
@property (strong, nonatomic) UIImageView *sixPageView;

@end

@implementation AdScrollerView

#pragma mark - init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    
    return self;
}

- (void)initialization
{
    self.bounces = NO;                                              //设置无反弹效果
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.contentSize = CGSizeMake(SCREENWIDTH * 6, SCREENHEIGHT);   //设置滚动视图的滚动区域
    self.delegate = self;
    
    _onePageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    _onePageView.tag = pageViewTag;
    [self addSubview:_onePageView];
    
    _twoPageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT)];
    _twoPageView.tag = pageViewTag + 1;
    [self addSubview:_twoPageView];
    
    _threePageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 2, 0, SCREENWIDTH, SCREENHEIGHT)];
    _threePageView.tag = pageViewTag + 2;
    [self addSubview:_threePageView];
    
    _fourPageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 3, 0, SCREENWIDTH, SCREENHEIGHT)];
    _fourPageView.tag = pageViewTag + 3;
    [self addSubview:_fourPageView];
    
    _fivePageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 4, 0, SCREENWIDTH, SCREENHEIGHT)];
    _fivePageView.tag = pageViewTag +4;
    [self addSubview:_fivePageView];
    
    _sixPageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH * 5, 0, SCREENWIDTH, SCREENHEIGHT)];
    _sixPageView.tag = pageViewTag + 5;
    [self addSubview:_sixPageView];
    
    isTimeUp = YES;     //默认系统滚动
    moveTime = [NSTimer scheduledTimerWithTimeInterval:changeImageTime target:self selector:@selector(systemScrollerImage) userInfo:nil repeats:NO];
}

#pragma mark - set scroller imageName
/**
 *  设置广告滚动视图的图片
 *
 *  @param imageNameArr 存放图片名的数组
 */
- (void)setScrollerImageNameArr:(NSArray *)imageNameArr
{
    _imageNameArr = imageNameArr;
    
    for (int i = 0; i < imageNameArr.count; i++) {
        UIImageView *pageView = [self viewWithTag:pageViewTag + i];
        pageView.image = [UIImage imageNamed:imageNameArr[i]];
    }
}

#pragma mark - create pageControl

- (void)setPageControlScrStyle:(UIPageControlScrStyle)pageControlScrStyle
{
    if (pageControlScrStyle == UIPageControlScrStyleNone) {
        return;
    }
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = _imageNameArr.count;
    
    if (pageControlScrStyle == UIPageControlScrStyleLeft) {
        _pageControl.frame = CGRectMake(10, HEIGHT + SCREENHEIGHT - 20, 20 *_pageControl.numberOfPages, 20);
    } else {
        _pageControl.frame = CGRectMake(SCREENWIDTH - 20 * _pageControl.numberOfPages, HEIGHT + SCREENHEIGHT - 20, 20 * _pageControl.numberOfPages, 20);
    }
    
    _pageControl.currentPage = 0;       //默认0
    _pageControl.enabled = NO;
    
    [[self superview] addSubview:_pageControl];         //将pageControl添加到滚动视图的父视图，添加到滚动视图上，其会随图片滚动
}

- (void)systemScrollerImage
{
    [self setContentOffset:CGPointMake(SCREENWIDTH * 2, 0) animated:YES];
    
    if (!isTimeUp) {
        isTimeUp = YES;
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
}

/**
 *  一次滚动结束调用一次
 *  contentOffset 监控目前滚动的位置，默认为CGPointZero
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //手动滚动，应取消3秒计时器
    if (!isTimeUp) {
        [moveTime setFireDate:[NSDate dateWithTimeIntervalSinceNow:changeImageTime]];
    }
    isTimeUp = NO;
}

@end
