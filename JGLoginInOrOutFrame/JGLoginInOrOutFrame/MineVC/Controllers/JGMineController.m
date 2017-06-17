//
//  JGMineController.m
//  JGLoginInOrOutFrame
//
//  Created by 郭军 on 2017/6/16.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import "JGMineController.h"
#import "JGMineInfoController.h"

@interface JGMineController ()

@end

@implementation JGMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"去我的信息" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
}



- (void)BtnClick {
    
    JGMineInfoController *InfoVC = [[JGMineInfoController alloc] init];
    InfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:InfoVC animated:YES];
    
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
