//
//  HZTabBarController.h
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTabBarView.h"
NS_ASSUME_NONNULL_BEGIN

@interface HZTabBarController : UITabBarController
@property (nonatomic,strong)NSMutableArray<HZTabModel *> *tabList;
@property (nonatomic,strong) HZTabBarView *tabView;
-(void)initTabBar;
-(void)tabSelect:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
