//
//  TestController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/23.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "TestController.h"
#import "HZTabbarHelper.h"
#import "HZTabModel.h"
#import "HomeViewController.h"
#import "MeViewController.h"

@interface TestController ()

@end

@implementation TestController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    NSMutableArray<UIViewController *> *nvcList = [NSMutableArray new];
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    [homeVc viewWillAppear:YES];
    [homeVc hidesBottomBarWhenPushed];
    homeVc.nvc = self.navigationController;
    [nvcList addObject:homeVc];
    
    MeViewController *meVc = [[MeViewController alloc] init];
    [meVc viewWillAppear:YES];
    [meVc hidesBottomBarWhenPushed];
    meVc.nvc = self.navigationController;
    [nvcList addObject:meVc];
    
    [[HZTabbarHelper shared] init:self.view tabList:dataList nvcList:nvcList];
    
    [HZTabbarHelper shared].selectBlock = ^(HZTabModel * _Nonnull model, NSInteger index) {
        self.navigationItem.title = model.title;
    };
    
}


@end
