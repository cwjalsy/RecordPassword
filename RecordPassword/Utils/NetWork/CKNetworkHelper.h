//
//  CKNetWorkHelper.h
//  ChokLife
//
//  Created by Junheng on 2017/7/20.
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    StatusUnknown          = -1,//未知网络
    StatusNotReachable     = 0,//没有网络
    StatusReachableViaWWAN = 1,//手机自带网络
    StatusReachableViaWiFi = 2 //wifi
    
}CKNetworkStatus;

typedef void(^MCProgressBlock)(int64_t bytesProgress, int64_t totalBytesProgress);
typedef void(^MCSuccessBlock)(id responseObject);
typedef void(^MCFailureBlock)(NSError *error);
typedef void(^JHFailureBlock)(NSString *errorHintStr);


/** 网络状态的Block*/
typedef void(^CKNetworkStatusBlock)(CKNetworkStatus status);


@interface CKNetworkHelper : NSObject


/**
 实时获取网络状态,通过Block回调实时获取(此方法可多次调用)
 */
+ (void)networkStatusWithBlock:(CKNetworkStatusBlock)networkStatus;


/**
 有网YES, 无网:NO
 */
+ (BOOL)isNetwork;

/**
 手机网络:YES, 反之:NO
 */
+ (BOOL)isWWANNetwork;

/**
 WiFi网络:YES, 反之:NO
 */
+ (BOOL)isWiFiNetwork;



@end
