
//
//  MCTabBarViewController+MCCheckNewVersion.m
//  MyCommunity
//
//  Created by Junheng on 2017/2/10.
//  Base on Tof Templates
//  Copyright © 2017年 XiaoNingLe. All rights reserved.
//

#import "MCTabBarViewController+MCCheckNewVersion.h"
#import <AFNetworking/AFNetworking.h>
#pragma mark -
#pragma mark Category MCCheckNewVersion for MCTabBarViewController
#pragma mark -

@implementation MCTabBarViewController (MCCheckNewVersion)


- (void)checkNewVersion{
    
    
    
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    
    
    NSString *currentVersion = [appInfo objectForKey:@"CFBundleShortVersionString"];
    
    
    __block NSString *newVersion = @"";
    
//    NSString *bundleIdentifier = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    
    
    
    
    //TODO: app id
    NSString *updateUrlString =  [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@", @"1035214808"];
    
    
   
    
    
    NSString *str = [updateUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    [manager GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *resultDic = responseObject;
        
        NSArray *resultArray = [resultDic objectForKey:@"results"];
        
        DLog(@"%@",resultArray);
        
        for (id config in resultArray) {
            
            newVersion = [config valueForKey:@"version"];
            
        }
        
        
        if (newVersion && ![newVersion isEqualToString:@""]) {
            
            if ([self compareVersionsFormAppStore:newVersion WithAppVersion:currentVersion]) {
                
                

                
                NSString *versionMessageStr = [NSString stringWithFormat:@"当前版本%@,最新版本为%@,请升级.",currentVersion,newVersion];
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"升级提示!" message:versionMessageStr preferredStyle:UIAlertControllerStyleAlert];
                
                [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                    
                }]];
                
                
                [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    NSString *iFeverAPPID = @"1035214808";
                    
                 
                    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@?mt=8",iFeverAPPID]];
                    
                    [[UIApplication sharedApplication]openURL:url];
                }]];
                
                [self presentViewController:alertController animated:YES completion:nil];
                
            }
        }else{
        
        
            //服务器没返回版本号 默认在审核 (应付在网络情不佳情况下的审核)
            [UserManager setReviewing:YES];
        
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        //        [self showHint:@"网络错误"];
        
    }];
    
    
}


//比较版本的方法
- (BOOL)compareVersionsFormAppStore:(NSString*)AppStoreVersion WithAppVersion:(NSString*)AppVersion{
    
    BOOL littleSunResult = false;
    
    NSMutableArray* a = (NSMutableArray*) [AppStoreVersion componentsSeparatedByString: @"."];
    NSMutableArray* b = (NSMutableArray*) [AppVersion componentsSeparatedByString: @"."];
    
    while (a.count < b.count) { [a addObject: @"0"]; }
    while (b.count < a.count) { [b addObject: @"0"]; }
    
    for (int j = 0; j<a.count; j++) {
        if ([[a objectAtIndex:j] integerValue] > [[b objectAtIndex:j] integerValue]) {
            
              //appstore版本号 > 提交的版本号  有新版本 非审核中
            
            [UserManager setReviewing:NO];
            
            littleSunResult = true;
            break;
        }else if([[a objectAtIndex:j] integerValue] < [[b objectAtIndex:j] integerValue]){
            
            //appstore版本号 < 提交的版本号  无新版本号  审核中
               [UserManager setReviewing:YES];
            
            littleSunResult = false;
            break;
        }else{
            
             //appstore版本号 = 提交的版本号  无新版本号  非审核中中
              [UserManager setReviewing:NO];
            
            littleSunResult = false;
        }
    }
    return littleSunResult;//true就是有新版本，false就是没有新版本
    
}

@end
