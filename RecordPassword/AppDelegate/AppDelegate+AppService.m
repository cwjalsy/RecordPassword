//
//  AppDelegate+AppService.m
//  ChokLife
//
//  Created by Junheng on 2017/7/18.
//  Base on Tof Templates
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "CoreLaunchLite.h"
#import "WelcomeViewController.h"

#pragma mark -
#pragma mark Category AppService for AppDelegate 
#pragma mark -

@implementation AppDelegate (AppService)

- (void)initService{


    //注册登录状态监听
//    [kNotificationCenter addObserver:self
//                            selector:@selector(loginStateChange:)
//                                name:KNotificationLoginStateChange
//                              object:nil];
    
    //网络状态监听
    [kNotificationCenter addObserver:self
                            selector:@selector(netWorkStateChange:)
                                name:KNotificationNetWorkStateChange
                              object:nil];

}

- (void)initWindow{

   
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
//    DLog(@"%@",self.window);
    
    [self.window makeKeyAndVisible];
    
    
//     [[UIButton appearance] setExclusiveTouch:YES];
     [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = KWhiteColor;
    

    if ([AppManager isFirstRunning]) {
        
        
        
        //加载欢饮页  无导航栏 无tabbar  无过度效果
        
        self.window.rootViewController = [[WelcomeViewController alloc]init];
        
        
        //隐藏状态栏
        
        
    }else
    {
        
        //判断是否登录 ？ 去加载不同的rootViewController
        
        
        //不是第一次运行  有过渡效果
        
        //判断是否登录
        //        if ([MCuserInfoTool isLogin]) {
        
        //游客模式 直接进入主界面
        
        self.mainController = [[HomeViewController alloc]init];
        
        //设置导航条
        MCNavigationController * nav = [[MCNavigationController alloc] initWithRootViewController:self.mainController];
        
        
        
        self.window.rootViewController = nav;
        
        /** Lite版本 */
        [CoreLaunchLite animWithWindow:self.window image:nil];
        
        
        //        }else
        //        {
        
        
        
        
        
        
        //            if ([MCuserInfoTool GetUserInfo].count != 0) { //有用户资料
        //
        //                LoggedUserViewController *logged = [[LoggedUserViewController alloc]init];
        //
        //
        //
        //                logged.lastViewAgeVc = OtherVC;
        //
        //
        //                // 判断是否是微信登录
        //                BOOL isWeiXinLogin = [MCuserInfoTool isWeChatLogin];
        //
        //                if (isWeiXinLogin) {
        //
        //                    logged = (LoggedUserViewController *)[[LoginViewController alloc] init];
        //
        //
        //                }
        //
        //                MCNavigationController *nav= [[MCNavigationController alloc]initWithRootViewController:logged];
        //
        //                self.window.rootViewController = nav;
        //
        //                /** Lite版本 */
        //                [CoreLaunchLite animWithWindow:self.window image:nil];
        //
        //
        //
        //
        //
        //            }else   //无用户资料
        //            {
        //
        //
        //                IndicatorViewController *indicator = [[IndicatorViewController alloc]init];
        //
        //                MCNavigationController *nav = [[MCNavigationController alloc]initWithRootViewController:indicator];
        //
        //
        //                self.window.rootViewController = nav;
        //
        //                /** Lite版本 */
        //                [CoreLaunchLite animWithWindow:self.window image:nil];
        //
        //
        //
        //            }
        
        
        //        }
        
        
    }
    


#ifdef DEBUG
    //展示FPS
    [AppManager showFPS];
#else
    

#endif
    


   
    
    
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus{

    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [CKNetworkHelper networkStatusWithBlock:^(CKNetworkStatus networkStatus) {
        
        switch (networkStatus) {
                // 未知网络
            case StatusUnknown:
                DLog(@"网络环境：未知网络");
                // 无网络
            case StatusNotReachable:
                DLog(@"网络环境：无网络");
                KPostNotification(KNotificationNetWorkStateChange, @NO);
                break;
                // 手机网络
            case StatusReachableViaWWAN:
                DLog(@"网络环境：手机自带网络");
                KPostNotification(KNotificationNetWorkStateChange, @YES);
                // 无线网络
            case StatusReachableViaWiFi:
                DLog(@"网络环境：WiFi");
                KPostNotification(KNotificationNetWorkStateChange, @YES);
                break;
        }
        
    }];

    


}


#pragma mark ————— 网络状态变化 —————
- (void)netWorkStateChange:(NSNotification *)notification
{
    BOOL isNetWork = [notification.object boolValue];
    
    if (isNetWork) {//有网络  
//        if ([userManager loadUserInfo] && !isLogin) {//有用户数据 并且 未登录成功 重新来一次自动登录
//            [userManager autoLoginToServer:^(BOOL success, NSString *des) {
//                if (success) {
//                    DLog(@"网络改变后，自动登录成功");
//                    [MBProgressHUD showSuccessMessage:@"网络改变后，自动登录成功"];
//                    KPostNotification(KNotificationAutoLoginSuccess, nil);
//                }else{
//                    [MBProgressHUD showErrorMessage:NSStringFormat(@"自动登录失败：%@",des)];
//                }
//            }];
//        }
        
        if ([CKNetworkHelper isWiFiNetwork]) {  //wifi
            
             [MBProgressHUD showTopTipMessage:@"已连接WiFi" isWindow:YES];
        }else{  //手机自带网
        
         [MBProgressHUD showTopTipMessage:@"手机自带网络" isWindow:YES];
            
    
        }
        
    }else {//登陆失败加载登陆页面控制器
        [MBProgressHUD showTopTipMessage:@"网络状态不佳" isWindow:YES];
    }
    
}

-(UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}




@end
