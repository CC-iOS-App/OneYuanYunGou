//
//  LYMyCloudVC.m
//  OneYuanYunGou
//
//  Created by paomoliu on 16/3/8.
//  Copyright © 2016年 Sunshine Girls. All rights reserved.
//

#import "LYMyCloudVC.h"
#import "LYMyCloudCell.h"

static NSString *KMyCloudCell = @"MyCloudCell";

@interface LYMyCloudVC ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)pushSettingVC:(id)sender;
- (IBAction)pushLoginVC:(id)sender;

@end

#pragma mark - Life Cycle

@implementation LYMyCloudVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_tableView registerClass:[LYMyCloudCell class] forCellReuseIdentifier:KMyCloudCell];
    _tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - IBAction Methods

- (IBAction)pushSettingVC:(id)sender {
}

- (IBAction)pushLoginVC:(id)sender {
}

#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 3 : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LYMyCloudCell *cell = [tableView dequeueReusableCellWithIdentifier:KMyCloudCell];
    
    NSArray *imageNames = @[@"myclod-shoprecord", @"mycloud-getp", @"mycloud-orderlist"];
    NSArray *cellTexts = @[@"我的云购记录", @"获得的商品", @"我的晒单"];
    
    if (indexPath.section == 0) {
        cell.imageV.image = [UIImage imageNamed:imageNames[indexPath.row]];
        cell.label.text = cellTexts[indexPath.row];
    } else if (indexPath.section == 1) {
        cell.imageV.image = [UIImage imageNamed:@"mycloud-account"];
        cell.label.text = @"账户明细";
    } else {
        cell.imageV.image = [UIImage imageNamed:@"mycloud-address"];
        cell.label.text = @"收货地址管理";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

//section间的距离 ＝ hearder.height + footer.height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 0 : 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

@end
