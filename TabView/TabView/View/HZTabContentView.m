//
//  HZTabContentView.m
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "HZTabContentView.h"
@interface HZTabContentView()<HZTabViewDelegate>

@property (nonatomic,strong) HZTabBarView *tabView;
@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation HZTabContentView

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - HZ_TAB_BAR_HEIGHT)];
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}

-(HZTabBarView *)tabView{
    if (!_tabView) {
        _tabView = [[HZTabBarView alloc] initFrame:CGRectMake(0, self.frame.size.height - HZ_TAB_BAR_HEIGHT, self.frame.size.width , HZ_TAB_BAR_HEIGHT) tabList:_tabList];
    }
    return _tabView;
}

-(instancetype)initFrame:(CGRect)frame tabList:(NSMutableArray<HZTabModel *> *)tabList nvcList:(nonnull NSMutableArray *)nvcList{
    self = [super initWithFrame:frame];
    if (self) {
        _tabList = tabList;
        _nvcList = nvcList;
        [self initUI];
    }
    return self;
}

- (void)initTabList:(NSMutableArray<HZTabModel *> *)tabList nvcList:(NSMutableArray *)nvcList{
    _tabList = tabList;
    _nvcList = nvcList;
    [self initUI];
}

-(void)initUI{
    
    [self addSubview:self.scrollView];
    if (_tabList == nil) {
        _tabList = [NSMutableArray new];
    }
    if (_nvcList == nil) {
        _nvcList = [NSMutableArray new];
    }
    NSInteger endCount = _nvcList.count > 5 ? 5 : _nvcList.count;
    for (NSInteger i = 0; i < endCount; i++) {
        UIViewController *vc = _nvcList[i];
        vc.view.frame = CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.scrollView.frame.size.height);
        [self.scrollView addSubview:vc.view];
    }
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * self.tabList.count, self.scrollView.frame.size.height);
    [self addSubview:self.scrollView];
    self.tabView = [[HZTabBarView alloc] initFrame:CGRectMake(0, self.frame.size.height - HZ_TAB_BAR_HEIGHT, self.frame.size.width , HZ_TAB_BAR_HEIGHT) tabList:_tabList];
    [self addSubview:self.tabView];
    self.tabView.delegate = self;
    
    [UINavigationController aspect_hookSelector:@selector(pushViewController:animated:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo,UIViewController *vc) {
        //NSLog(@"😜😜😜Appear:--> %@", aspectInfo.instance);（为什么不使用此方式，请查看评论）
        NSLog(@"😜😜😜Appear:--> %@", NSStringFromClass([aspectInfo.instance class]));
        [self hideView];

    } error:NULL];
    [UINavigationController aspect_hookSelector:@selector(popViewControllerAnimated:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo) {
        //NSLog(@"😜😜😜Appear:--> %@", aspectInfo.instance);（为什么不使用此方式，请查看评论）
        NSLog(@"😜😜😜Appear:--> %@", NSStringFromClass([aspectInfo.instance class]));
        [self showView];
    } error:NULL];
}

-(void)tabView:(HZTabBarView *)tabView didSelect:(NSInteger)index{
    [self.scrollView setContentOffset:CGPointMake(index * HZ_TAB_SCREEN_WIDTH, 0) animated:YES];
    if (_selectBlock!=nil) {
        self.selectBlock(_tabList[index], index);
    }
}

- (void)showView{
    [self.tabView showView];
}

- (void)hideView{
    [self.tabView hideView];
}

@end
