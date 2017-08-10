//
//  MCTabBarViewController.h
//  MyCommunity
//
//  Created by wenjim on 16/7/20.
//  Copyright © 2016年 XiaoNingLe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCTabBarViewController : UITabBarController

{
    

//    EMConnectionState _connectionSate;
    
}


//- (void)setupUntreatedApplyCount;

//- (void)networkChanged:(EMConnectionState)connectionState;

- (void)jumpToChatList;

/**
 *  收到本地通知
 *
 *  @param notification 通知内容
 */
- (void)didReceiveLocalNotification:(UILocalNotification *)notification;


- (void)jumpToForumNotice;


- (void)jumpToStrategyDetail:(NSDictionary *)data;

- (void)jumpToAttackDetail:(NSDictionary *)data;

- (void)jumpToQADetail:(NSDictionary *)data;

- (void)jumpToNewsDetail:(NSDictionary *)data;

- (void)jumpToTestDetail:(NSDictionary *)data;

- (void)jumpToFMDetail:(NSDictionary *)data;

@end
