//
//  HZTabBarController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "HZTabBarController.h"

@interface HZTabBarController ()<HZTabViewDelegate>

@end

@implementation HZTabBarController

-(HZTabBarView *)tabView{
    if (!_tabView) {
        _tabView = [[HZTabBarView alloc] initFrame:CGRectMake(0, 0, HZ_TAB_SCREEN_WIDTH, HZ_TAB_BAR_HEIGHT) tabList:_tabList];
        _tabView.delegate = self;
    }
    return _tabView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configViewControllers{
    NSMutableArray *list = [NSMutableArray new];
    if (_tabList == nil) {
        _tabList = [NSMutableArray new];
    }
    NSInteger endCount = _tabList.count > 5 ? 5 : _tabList.count;
    for (NSInteger i = 0; i < endCount; i++) {
        HZTabModel *model = _tabList[i];
        UINavigationController *nvc = [[UINavigationController alloc] init];
        UIViewController *vc = [[NSClassFromString(model.viewControllerName) alloc] init];
        [nvc addChildViewController:vc];
        [list addObject:nvc];
    }
    self.viewControllers = list;
}


-(void)initTabBar{
    [self configViewControllers];
    
    [self.tabBar addSubview:self.tabView];
    [[UITabBar appearance] setShadowImage:[UIImage new]];//去除tabbar的上放的线
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [self setSelectedIndex:0];
}

-(void)tabView:(HZTabBarView *)tabView didSelect:(NSInteger)index{
    [self setSelectedIndex:index];
}

-(void)tabview:(HZTabBarView *)tabView bigSelect:(UIButton *)btn{
    
}

@end
