//
//  JGTabbarController.m
//  JGLoginInOrOutFrame
//
//  Created by 郭军 on 2017/6/16.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "JGTabbarController.h"

#import "JGNavigationController.h"
#import "JGHomeController.h"
#import "JGMineController.h"
#import "JGOtherController.h"



@interface JGTabbarController ()

@end

@implementation JGTabbarController

HMSingletonM(JGTabbarController)


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建子控制器
    [self setUpChildViewControllers];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                       selector:@selector(LoginBackCustomerVC)
                           name:@"login"
                         object:nil];
    
    
}


- (void)LoginBackCustomerVC {
    
    self.selectedIndex = 0;
    
    
}



/**
 *  创建子控制器123
 
 */
- (void)setUpChildViewControllers {
    
    [self setupChildVc:[[JGHomeController alloc] init] title:@"首页" image:@"tabbar_msg"  selectedImage:@"tabbar_msg_sel"];
    
    [self setupChildVc:[[JGOtherController alloc] init] title:@"其他" image:@"tabbar_log"  selectedImage:@"tabbar_log_sel"];
    
    [self setupChildVc:[[JGMineController alloc] init] title:@"我的" image:@"tabbar_work" selectedImage:@"tabbar_work_sel"];
    
}

/**
 *  初始化控制器
 *
 *  @param vc            控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中图片
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    //    vc.tabBarItem.title = title;
    vc.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //255, 172, 56
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0 green:172/255.0 blue:56/255.0 alpha:1]} forState:UIControlStateSelected];
    
    
    //包装一个导航控制器
    JGNavigationController *nav = [[JGNavigationController alloc] initWithRootViewController:vc];
    //隐藏tabbar
    [self addChildViewController:nav];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
