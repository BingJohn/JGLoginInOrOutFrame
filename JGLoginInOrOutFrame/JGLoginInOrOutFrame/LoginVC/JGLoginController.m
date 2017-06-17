//
//  JGLoginController.m
//  JGLoginInOrOutFrame
//
//  Created by 郭军 on 2017/6/16.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "JGLoginController.h"
#import "MBProgressHUD+MJ.h"
#import "JGTabbarController.h"
#import "JGForgetPwdController.h"


@interface JGLoginController ()

@property (nonatomic, strong)UIButton *btn;

@property (nonatomic, strong)UIButton *btn1;

@end

@implementation JGLoginController

HMSingletonM(JGLoginController)

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _btn = [[UIButton alloc] initWithFrame:CGRectMake(80, 100, 300, 40)];
    _btn.backgroundColor = [UIColor redColor];
    [_btn setTitle:@"登录" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
    _btn1 = [[UIButton alloc] initWithFrame:CGRectMake(280, 170, 100, 40)];
    _btn1.backgroundColor = [UIColor redColor];
    [_btn1 setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(BtnClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn1];
    
}


- (void)BtnClick1 {
    
    JGForgetPwdController *forgetVC = [[JGForgetPwdController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}



/**
 模拟登录
 */
- (void)BtnClick {
    
    [MBProgressHUD showMessage:@"正在登录"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        [standardUserDefaults setObject:@"test" forKey:@"token"];
        [standardUserDefaults synchronize];
        
        [UIApplication sharedApplication].keyWindow.rootViewController = [[JGTabbarController alloc] init];
        
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
