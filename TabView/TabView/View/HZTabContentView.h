//
//  HZTabContentView.h
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTabBarView.h"
#import "HZTabModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^TabbarSelectBlock)(HZTabModel *model,NSInteger index);

@interface HZTabContentView: UIView

-(instancetype)initFrame:(CGRect)frame tabList:(nonnull NSMutableArray<HZTabModel *> *)tabList nvcList:(nonnull NSMutableArray *)nvcList;

-(void)initTabList:(nonnull NSMutableArray<HZTabModel *> *)tabList nvcList:(nonnull NSMutableArray *)nvcList;

-(void)showView;

-(void)hideView;

@property (nonatomic,strong) NSMutableArray<HZTabModel *> *tabList;
@property (nonatomic,strong) NSMutableArray<UINavigationController *> *nvcList;
@property (nonatomic,copy) TabbarSelectBlock selectBlock;

@end

NS_ASSUME_NONNULL_END
