//
//  HomeViewController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "HomeViewController.h"
#import "SecondViewController.h"
#import "HZTabContentView.h"
#import "HZTabbarHelper.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation HomeViewController

-(NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
        for (NSInteger i = 0 ; i< 90 ; i++) {
            [_dataList addObject:[NSString stringWithFormat:@"测试数据%ld",i]];
        }
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    if (self.dataList.count > 0) {
        [self.tableView reloadData];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];;
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.navigationItem.title = @"second";
    vc.hidesBottomBarWhenPushed = YES;
    if (self.nvc == nil) {
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        [self.nvc pushViewController:vc animated:YES];
    }
}


@end
