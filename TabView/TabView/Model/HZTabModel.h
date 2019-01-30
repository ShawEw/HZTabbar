//
//  HZTabModel.h
//  TabView
//
//  Created by jiang junhui on 2019/1/21.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HZTabModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *normalImg;
@property (nonatomic,strong) NSString *selectImg;
@property (nonatomic,assign) UIColor* titleSelectColor;
@property (nonatomic,assign) UIColor *titleColor;
@property (nonatomic,strong) NSString *viewControllerName;//界面名字 用以反射界面
//@property (nonatomic,assign) BOOL isBig;//暂时不使用
@property (nonatomic,assign) NSInteger index;//暂时不使用

@property (nonatomic,assign) BOOL isFromStoryboard;
@property (nonatomic,strong) NSString *storyboardName;

@end

NS_ASSUME_NONNULL_END
