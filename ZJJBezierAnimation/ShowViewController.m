//
//  ShowViewController.m
//  ZJJBezierAnimation
//
//  Created by 张锦江 on 2018/1/24.
//  Copyright © 2018年 ZJJ. All rights reserved.
//

#import "ShowViewController.h"
#import "ZAnimationView.h"

@interface ShowViewController () {
    ZAnimationView *_aview;
}

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"展示";
    _aview = [[ZAnimationView alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-20, self.view.frame.size.height-100) withType:_typeInt];
    _aview.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_aview];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 600, 100, 50);
    button.backgroundColor = [UIColor yellowColor];
    [button setTitle:@"watch" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(watch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)watch {
    [_aview beginBezierAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
