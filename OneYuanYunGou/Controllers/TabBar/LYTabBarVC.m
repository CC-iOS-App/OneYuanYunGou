//
//  LYTabBarVC.m
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/8.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import "LYTabBarVC.h"
#import "LYHomePageVC.h"
#import "LYAllProductVC.h"
#import "LYLatestAnnounceVC.h"
#import "LYShoppingCartVC.h"
#import "LYMyCloudVC.h"
#import "UIColor+Util.h"

#define  SCREENWIDTH [UIScreen mainScreen].bounds.size.width

@interface LYTabBarVC () <UITabBarControllerDelegate, UINavigationControllerDelegate>

@end

@implementation LYTabBarVC

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomePage" bundle:nil];
    UINavigationController *homePageNav = [homeStoryboard instantiateViewControllerWithIdentifier:@"HomePageNav"];
    
    UIStoryboard *productStoryboard = [UIStoryboard storyboardWithName:@"Product" bundle:nil];
    UINavigationController *productNav = [productStoryboard instantiateViewControllerWithIdentifier:@"ProductNav"];
    
    UIStoryboard *latestStoryboard = [UIStoryboard storyboardWithName:@"LatestAnn" bundle:nil];
    UINavigationController *latestAnnNav = [latestStoryboard instantiateViewControllerWithIdentifier:@"LatestAnnNav"];
    
    UIStoryboard *shopStoryboard = [UIStoryboard storyboardWithName:@"ShopCart" bundle:nil];
    UINavigationController *shopCartNav = [shopStoryboard instantiateViewControllerWithIdentifier:@"ShopCartNav"];
    
    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"MyCloud" bundle:nil];
    UINavigationController *myCloudNav = [myStoryboard instantiateViewControllerWithIdentifier:@"MyCloudNav"];
    
    self.tabBar.translucent = NO;   //设置tabbar是否半透明
    self.viewControllers = @[homePageNav,
                             productNav,
                             latestAnnNav,
                             shopCartNav,
                             myCloudNav];
    
    NSArray *titles = @[@"首页", @"所有商品", @"最新揭晓", @"购物车", @"我的云购"];
    NSArray *images = @[@"tab-home", @"tab-product", @"tab-latest", @"tab-shopping", @"tab-mycloud"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger index, BOOL *stop) {
        [item setTitle:titles[index]];
        [item setImage:[UIImage imageNamed:images[index]]];
        [item setSelectedImage:[UIImage imageNamed:[images[index] stringByAppendingString:@"-s"]]];
        
    }];
}

#pragma mark -

- (void)pushSearchViewCtl
{
    
}

@end
