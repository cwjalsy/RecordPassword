//
//  AppManager.h
//  ChokLife
//
//  Created by Junheng on 2017/7/19.
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppManager : NSObject


/**
 *  检测程序是否是第一次运行
 *
 *  @return YES / NO
 */
+ (BOOL)isFirstRunning;


/**
 *  记录程序第一次运行
 */
+ (void)recordFirstRunning;


#pragma mark ————— FPS 监测 —————
+(void)showFPS;

@end
