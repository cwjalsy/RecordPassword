//
//  AppDelegate+AppService.h
//  ChokLife
//
//  Created by Junheng on 2017/7/18.
//  Base on Tof Templates
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import "AppDelegate.h"

#pragma mark -
#pragma mark Category AppService for AppDelegate 
#pragma mark -


#define ReplaceRootViewController(vc) [[AppDelegate shareAppDelegate] replaceRootViewController:vc]


@interface AppDelegate (AppService)



//初始化服务
-(void)initService;


//初始化 window
-(void)initWindow;

//监听网络状态
- (void)monitorNetworkStatus;


//单例
+ (AppDelegate *)shareAppDelegate;




/**
 当前顶层控制器
 */
-(UIViewController*)getCurrentVC;

-(UIViewController*)getCurrentUIVC;

@end
