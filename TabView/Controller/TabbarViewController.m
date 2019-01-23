//
//  TabbarViewController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/23.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "TabbarViewController.h"

@interface TabbarViewController ()

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabList = [NSMutableArray new];
    HZTabModel *model = [[HZTabModel alloc] init];
    model.title = @"首页";
    model.selectImg = @"ic_home";
    model.normalImg = @"ic_home_normal";
    model.viewControllerName = @"HomeViewController";
    [self.tabList addObject:model];
    
    model = [[HZTabModel alloc] init];
    model.title = @"我的";
    model.selectImg = @"ic_me";
    model.normalImg = @"ic_me_normal";
    model.viewControllerName = @"MeViewController";
    [self.tabList addObject:model];
    

    
    model = [[HZTabModel alloc] init];
    model.title = @"我的";
    model.selectImg = @"ic_me";
    model.normalImg = @"ic_me_normal";
    model.viewControllerName = @"MeViewController";
    [self.tabList addObject:model];
    [self.tabList addObject:model];
    
    [self initTabBar];
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
