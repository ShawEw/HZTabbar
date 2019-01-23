//
//  SecondViewController.m
//  TabView
//
//  Created by jiang junhui on 2019/1/22.
//  Copyright © 2019 hongzheng. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, 60, 40)];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 300, 60, 40)];
    [button2 setTitle:@"跳转" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

-(void)click{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
