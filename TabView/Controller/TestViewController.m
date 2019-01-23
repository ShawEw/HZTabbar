//
//  TestViewController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "TestViewController.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import "HZTabbarHelper.h"
@interface TestViewController ()

@property (nonatomic,strong) HZTabContentView *contentView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_contentView != nil) {
        [_contentView removeFromSuperview];
    }
    NSMutableArray<HZTabModel *> *dataList = [NSMutableArray new];
    HZTabModel *model = [[HZTabModel alloc] init];
    model.title = @"首页";
    model.selectImg = @"ic_home";
    model.normalImg = @"ic_home_normal";
    model.viewControllerName = @"HomeViewController";
    [dataList addObject:model];
    model = [[HZTabModel alloc] init];
    model.title = @"我的";
    model.selectImg = @"ic_me";
    model.normalImg = @"ic_me_normal";
    model.viewControllerName = @"MeViewController";
    [dataList addObject:model];
    
    NSMutableArray<UINavigationController *> *nvcList = [NSMutableArray new];
    UINavigationController *homeNvc = [[UINavigationController alloc] init];
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    [homeVc viewWillAppear:YES];
    [homeVc hidesBottomBarWhenPushed];
    [homeNvc addChildViewController:homeVc];
    [nvcList addObject:homeNvc];
    
    UINavigationController *meNvc = [[UINavigationController alloc] init];
    MeViewController *meVc = [[MeViewController alloc] init];
    [meVc viewWillAppear:YES];
    [meVc hidesBottomBarWhenPushed];
    [meNvc addChildViewController:meVc];
    [nvcList addObject:meNvc];
    
    [[HZTabbarHelper shared] init:self.view tabList:dataList nvcList:nvcList];
    
//    _contentView = [[HZTabContentView alloc] initFrame:CGRectMake(0, 0, HZ_TAB_SCREEN_WIDTH, HZ_TAB_SCREEN_HEIGHT) tabList:dataList nvcList:nvcList];
//    [self.view addSubview:_contentView];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
