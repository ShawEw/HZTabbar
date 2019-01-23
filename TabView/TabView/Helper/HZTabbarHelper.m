//
//  HZTabbarHelper.m
//  TabView
//
//  Created by jiang junhui on 2019/1/23.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "HZTabbarHelper.h"

@interface HZTabbarHelper ()

@end
@implementation HZTabbarHelper

+(instancetype)shared{
    static HZTabbarHelper *tabbarHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarHelper = [[super allocWithZone:nil] init];
        tabbarHelper.tabbar = [[HZTabContentView alloc] initWithFrame:CGRectMake(0, HZ_TAB_StatusBarHeight + HZ_TAB_NavigationBarHeight, HZ_TAB_SCREEN_WIDTH, HZ_TAB_SCREEN_HEIGHT - HZ_TAB_StatusBarHeight - HZ_TAB_NavigationBarHeight)];
    });
    return tabbarHelper;
}

-(void)init:(UIView *)view tabList:(nonnull NSMutableArray<HZTabModel *> *)tabList nvcList:(nonnull NSMutableArray *)nvcList{
    [self.tabbar initTabList:tabList nvcList:nvcList];
    [view addSubview:self.tabbar];
}

-(void)setSelectBlock:(TabbarSelectBlock)selectBlock{
    _selectBlock = selectBlock;
    self.tabbar.selectBlock = selectBlock;
}

- (void)showView{
    [self.tabbar showView];
}

- (void)hideView{
    [self.tabbar hideView];
}

@end
