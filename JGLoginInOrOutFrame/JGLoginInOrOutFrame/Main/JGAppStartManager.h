//
//  JGAppStartManager.h
//  JGLoginInOrOutFrame
//
//  Created by 郭军 on 2017/6/16.
//  Copyright © 2017年 ZJBL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JGTabbarController.h"
#import "JGNavigationController.h"
#import "Member.h"



@interface JGAppStartManager : NSObject {
    Member *host;
}

@property(nonatomic, strong) JGNavigationController *navigationController;
@property(nonatomic, strong) JGTabbarController *tabBarController;

+(instancetype)shareManager;


///**
// 返回当前登录的用户
// 
// @return 登录用户
// */
//-(Member *)currentMember;


/**
 设置记录当前登录的用户
 
 @param member 登录用户
 */
-(void)setMember:(Member *)member;


/**
 push到home界面，并设置第index个界面为当前展示界面
 
 @param index tabBar的index属性
 */
-(void)pushHomeViewWithSelectIndex:(NSInteger)index;


/**
 app启动时处理事件
 */
-(void)startApp;


/**
 app退出登录时处理事件
 */
-(void)loginout;


@end
