# HZTabbar
自定义tabbar

# 项目使用
## 1. cocoapods 使用
   在podfile文件中使用 pod 'HZTabbar'
## 2. 下载使用
    将项目中的tabview 文件夹复制到项目中
# 代码使用

## 1.UITabBarController
### a.新建数组
    新建UITabBarController继承HZTabBarController。
    传入HZTabModel的可变数组。
    ```
    self.tabList = [NSMutableArray new];
    HZTabModel *model = [[HZTabModel alloc] init];
    model.title = @"首页";
    model.selectImg = @"ic_home";
    model.normalImg = @"ic_home_normal";
    model.viewControllerName = @"HomeViewController";
    [self.tabList addObject:model];
    ```
    其中viewControllerName用以反射出uiviewcontroller。
### b.初始化tabbar
    调用[self initTabBar];
    
### 2.UIViewController
    这种情况使用有局限性，需要在UIViewController上增加UINavigationController。
    ```
    NSMutableArray<HZTabModel *> *dataList = [NSMutableArray new];
    HZTabModel *model = [[HZTabModel alloc] init];
    model.title = @"首页";
    model.selectImg = @"ic_home";
    model.normalImg = @"ic_home_normal";
    model.viewControllerName = @"HomeViewController";
    [dataList addObject:model];
    model = [[HZTabModel alloc] init];
    model.title = @"我的";
    model.selectImg = @"ic_me";
    model.normalImg = @"ic_me_normal";
    model.viewControllerName = @"MeViewController";
    [dataList addObject:model];
    
    NSMutableArray<UIViewController *> *nvcList = [NSMutableArray new];
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    [homeVc viewWillAppear:YES];
    [homeVc hidesBottomBarWhenPushed];
    homeVc.nvc = self.navigationController;
    [nvcList addObject:homeVc];
    
    MeViewController *meVc = [[MeViewController alloc] init];
    [meVc viewWillAppear:YES];
    [meVc hidesBottomBarWhenPushed];
    meVc.nvc = self.navigationController;
    [nvcList addObject:meVc];
    
    [[HZTabbarHelper shared] init:self.view tabList:dataList nvcList:nvcList];
    
    [HZTabbarHelper shared].selectBlock = ^(HZTabModel * _Nonnull model, NSInteger index) {
        self.navigationItem.title = model.title;
    };
    ```
    
    
    
