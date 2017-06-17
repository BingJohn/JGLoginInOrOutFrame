//
//  JGMineInfoController.m
//  JGLoginInOrOutFrame
//
//  Created by 郭军 on 2017/6/16.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "JGMineInfoController.h"
#import "MBProgressHUD+MJ.h"
#import "JGLoginController.h"
#import "JGNavigationController.h"

@interface JGMineInfoController ()

@end

@implementation JGMineInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的信息";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    [btn setTitle:@"退出登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}


/**
 模拟退出
 */
- (void)BtnClick {
    
    
    [MBProgressHUD showMessage:@"正在退出"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        [standardUserDefaults setObject:@"" forKey:@"token"];
        [standardUserDefaults synchronize];
        
        [self.navigationController popToRootViewControllerAnimated:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"login" object:nil];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = [[JGNavigationController alloc] initWithRootViewController:[[JGLoginController alloc] init]];
    });

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
