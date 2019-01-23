//
//  HZTabView.h
//  TabView
//
//  Created by jiang junhui on 2019/1/21.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HZTabModel.h"
#import "Aspects.h"

NS_ASSUME_NONNULL_BEGIN

//iPhoneX / iPhoneXS
#define HZ_TAB_isIphoneX_XS (HZ_TAB_SCREEN_WIDTH == 375.f && HZ_TAB_SCREEN_HEIGHT == 812.f ? YES : NO)
//iPhoneXR / iPhoneXSMax
#define HZ_TAB_isIphoneXR_XSMax (HZ_TAB_SCREEN_WIDTH == 414.f && HZ_TAB_SCREEN_HEIGHT == 896.f ? YES : NO)
//全面屏，iPhone X以上
#define HZ_TAB_IsiPhoneX (HZ_TAB_isIphoneX_XS || HZ_TAB_isIphoneXR_XSMax)
// 屏幕宽度，会根据横竖屏的变化而变化
#define HZ_TAB_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
// 屏幕高度，会根据横竖屏的变化而变化
#define HZ_TAB_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define HZ_TAB_BAR_HEIGHT (HZ_TAB_IsiPhoneX?(49+34):49)

// 状态栏高度
#define HZ_TAB_StatusBarHeight        (HZ_TAB_IsiPhoneX ? 44.f : 20.f)
// 顶部导航栏高度
#define HZ_TAB_NavigationBarHeight    44.f

@class HZTabBarView;
@protocol HZTabViewDelegate <NSObject>

@required
-(void)tabView:(HZTabBarView *)tabView didSelect:(NSInteger)index;

@optional
-(void)tabview:(HZTabBarView *)tabView bigSelect:(UIButton *)btn;

@end

@interface HZTabBarView : UIView

-(instancetype)initFrame:(CGRect)frame tabList:(NSMutableArray<HZTabModel *> *)tabList;

-(void)showView;

-(void)hideView;

@property (nonatomic, strong) NSMutableArray<HZTabModel *> *tabList;

@property (nonatomic, weak) id<HZTabViewDelegate> delegate;

@property (nonatomic, strong) NSString *bigBtnImage;

@end

NS_ASSUME_NONNULL_END
