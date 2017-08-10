//
//  CKNetWorkHelper.m
//  ChokLife
//
//  Created by Junheng on 2017/7/20.
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import "CKNetworkHelper.h"
#import <AFNetworking/AFNetworking.h>

@implementation CKNetworkHelper

#pragma mark - 开始监听网络
+ (void)load {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+ (void)networkStatusWithBlock:(CKNetworkStatusBlock)networkStatus {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                    networkStatus ? networkStatus(StatusUnknown) : nil;
                   
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                    networkStatus ? networkStatus(StatusNotReachable) : nil;
            
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    networkStatus ? networkStatus(StatusReachableViaWWAN) : nil;
            
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    networkStatus ? networkStatus(StatusReachableViaWiFi) : nil;
               
                    break;
            }
        }];
    });
}



+ (BOOL)isNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

+ (BOOL)isWWANNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

+ (BOOL)isWiFiNetwork {
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

@end
