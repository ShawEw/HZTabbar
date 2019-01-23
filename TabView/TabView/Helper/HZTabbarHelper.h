//
//  HZTabbarHelper.h
//  TabView
//
//  Created by jiang junhui on 2019/1/23.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HZTabContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HZTabbarHelper : NSObject

@property (nonatomic,strong) HZTabContentView *tabbar;

@property (nonatomic,copy) TabbarSelectBlock selectBlock;

+(instancetype)shared;

-(void)init:(UIView *)view tabList:(nonnull NSMutableArray<HZTabModel *> *)tabList nvcList:(nonnull NSMutableArray *)nvcList;

-(void)showView;

-(void)hideView;
@end

NS_ASSUME_NONNULL_END
