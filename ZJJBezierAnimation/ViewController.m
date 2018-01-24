//
//  ViewController.m
//  ZJJBezierAnimation
//
//  Created by 张锦江 on 2018/1/24.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";
    NSArray *arr = @[@"直线",@"曲线",@"抛物线",@"圆形"];
    for (NSInteger i = 0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(100, 100+80*i, 100, 50);
        button.backgroundColor = [UIColor yellowColor];
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(comeOut:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 + i;
        [self.view addSubview:button];
    }
}

- (void)comeOut:(UIButton *)sender {
    ShowViewController *vc = [ShowViewController new];
    vc.typeInt = sender.tag - 100;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
