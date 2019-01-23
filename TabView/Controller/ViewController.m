//
//  ViewController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/21.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "ViewController.h"
#import "HZTabBarView.h"
#import "HZTabModel.h"
#import "HomeViewController.h"
#import "MeViewController.h"

@interface ViewController ()<HZTabViewDelegate>

@property (nonatomic, strong) NSMutableArray<UINavigationController *> *vcList;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, HZ_TAB_StatusBarHeight, HZ_TAB_SCREEN_WIDTH, HZ_TAB_SCREEN_HEIGHT - HZ_TAB_BAR_HEIGHT - HZ_TAB_StatusBarHeight)];
        _scrollView.backgroundColor = [UIColor purpleColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

-(NSMutableArray<UINavigationController *> *)vcList{
    if (!_vcList) {
        _vcList = [NSMutableArray new];
        UINavigationController *nvc = [[UINavigationController alloc] init];
        nvc.navigationItem.title = @"首页";
        HomeViewController *homeVc = [[HomeViewController alloc] init];
        homeVc.navigationItem.title = @"首页";
        [nvc addChildViewController:homeVc];
        [_vcList addObject:nvc];
        
        UINavigationController *meNvc = [[UINavigationController alloc] init];
        MeViewController *meVc = [[MeViewController alloc] init];
        meVc.title = @"我的";
        [meNvc addChildViewController:meVc];
        [_vcList addObject:meNvc];
    }
    return _vcList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    NSMutableArray<HZTabModel *> *dataList = [NSMutableArray new];
    HZTabModel *model = [[HZTabModel alloc] init];
    model.title = @"首页";
    model.selectImg = @"ic_home";
    model.normalImg = @"ic_home_normal";
    [dataList addObject:model];
    model = [[HZTabModel alloc] init];
    model.title = @"我的";
    model.selectImg = @"ic_me";
    model.normalImg = @"ic_me_normal";
    [dataList addObject:model];
    
    HZTabBarView *tabView = [[HZTabBarView alloc] initFrame:CGRectMake(0, HZ_TAB_SCREEN_HEIGHT - HZ_TAB_BAR_HEIGHT, HZ_TAB_SCREEN_WIDTH , HZ_TAB_BAR_HEIGHT) tabList:dataList];
    tabView.delegate = self;
    [self.view addSubview:tabView];
    
    for (NSInteger i = 0; i<self.vcList.count; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i * HZ_TAB_SCREEN_WIDTH, self.scrollView.bounds.origin.y, HZ_TAB_SCREEN_WIDTH, self.scrollView.frame.size.height)];
        UIView *childView = self.vcList[i].view;
        [view addSubview:childView];
        childView.frame = view.bounds;
        [self.scrollView addSubview:view];
    }
    self.scrollView.contentSize = CGSizeMake(HZ_TAB_SCREEN_WIDTH * self.vcList.count, self.scrollView.frame.size.height);
    [self.view addSubview:self.scrollView];
}

-(void)tabView:(HZTabBarView *)tabView didSelect:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index * HZ_TAB_SCREEN_WIDTH, 0) animated:YES];
}

@end
