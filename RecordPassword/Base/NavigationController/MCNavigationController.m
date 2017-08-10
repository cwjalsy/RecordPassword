//
//  MCNavigationController.m
//  MyCommunity
//
//  Created by Junheng on 15/10/19.
//  Copyright © 2015年 xiaoningle. All rights reserved.
//

#import "MCNavigationController.h"
//#import "UIBarButtonItem+Extension.h"
//#import "MessageViewController.h"

//#import "QSForumViewController.h"
//#import "HomeViewController.h"
@interface MCNavigationController ()

{
    
    UIBarButtonItem *_messageItem;
    
    
}

//@property (weak, nonatomic) UIViewController *currentShowVC;

@property (strong, nonatomic) UIViewController *rootViewController;


@end

@implementation MCNavigationController


//-(id)initWithRootViewController:(UIViewController *)rootViewController {
//    self = [super initWithRootViewController:rootViewController];
//    self.interactivePopGestureRecognizer.delegate = (id)self;
//    self.delegate = (id)self;
//    return self;
//}
//
//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//}
//-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (navigationController.viewControllers.count == 1)
//        self.currentShowVC = Nil;
//    else
//        self.currentShowVC = viewController;
//}
//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
//        return (self.currentShowVC == self.topViewController);
//    }
//    return YES;
//}
//



+ (void)initialize
{
 
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    
    
    
//    [[UINavigationBar appearance] setBarTintColor:WJColor(255, 255, 255, 0.5)];
    //设置整个项目所有BarButtonItem的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置普通状态
    //key NS*********AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    
    //textAttrs[NSForegroundColorAttributeName] = WJColor(35, 177, 209, 1);
    textAttrs[NSForegroundColorAttributeName] = WJColor(33, 33, 33, 1);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    
    //设置不可用状态
    NSMutableDictionary *disabletextAttrs = [NSMutableDictionary dictionary];
    
    disabletextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disabletextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];
    
    
    
    //设置导航栏标题文字的颜色
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //改变导航条字体为白色
    //    NSFontAttributeName:[UIFont systemFontOfSize:19]
    
    
    //[[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName:WJColor(35, 177, 209, 1)}];
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName:WJColor(33, 33, 33, 1)}];
    
    
    //设置默认按钮颜色
    //[[UINavigationBar appearance] setTintColor:WJColor(184, 184, 184, 1)];
    [[UINavigationBar appearance] setTintColor:WJColor(33, 33, 33, 1)];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //设置导航栏不透明
//    self.navigationBar.translucent = NO;
    
//     [self registerNotifications];
    
    
}


/**
 *  重写这个方法的目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 *  @param animated       是否带动画效果
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {   //这时PUSH进来的控制器不是第一个控制器（根控制器）
        
        /* 自动显示或者隐藏tabbar  */
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(onBack) image:@"community_back" highImage:@"community_pressed"];
        
        
        
        
    }

 
    
    [super pushViewController:viewController animated:animated];
    


}


- (void)onBack
{

    [self popViewControllerAnimated:YES];
    
    
    

}


//-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
//    self = [super initWithRootViewController:rootViewController];
//    if (self) {
//      
//       
//        if ([rootViewController isKindOfClass:[QSForumViewController class]] || [rootViewController isKindOfClass:[HomeViewController class]]) {
//            
//            
//            
//            self.rootViewController = rootViewController;
//            
//            
//            [self setupUnreadMessageCount];
//        }
//        
//        
//    }
//    return self;
//}

#pragma mark - private
//- (void)registerNotifications
//{
//    
//    [self unregisterNotifications];
//    
//    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
//    
//    
//}
//
//
//- (void)unregisterNotifications
//{
//    
//    
//    
//    [[EaseMob sharedInstance].chatManager removeDelegate:self];
//    
//    
//    
//}


#pragma mark - 统计消息未读数(会话列表消息+系统消息)
- (void)setupUnreadMessageCount{
    /*
    
    NSArray *conversations = [[[EaseMob sharedInstance] chatManager] conversations];
    
    
    __block NSInteger unreadCount = 0;
    
    
    for (EMConversation *conversation in conversations) {
        
        unreadCount += conversation.unreadMessagesCount;
        
        
    }
    
    
    
    
    //加上论坛消息回复数
    
    [MCHttpTool requestPOSTWithURL:@"forumMsgPush/count" WithParameter:nil success:^(id responseObject) {
        
        
        DLog(@"%@",[responseObject JSONString]);
        
        if ([responseObject[@"success"] integerValue] == 1) {
            
            
            NSInteger count = [responseObject[@"data"] integerValue];
            
            
            unreadCount = unreadCount + count;
            
            
            
            
            if (unreadCount > 0) {
                
                
                
                _messageItem = [UIBarButtonItem itemWithTarget:self action:@selector(messageClick) image:@"community_newNotice" highImage:@"community_newNotice_pressed"];
                
                
                
                
            }else{
                
                
                
                
                _messageItem =  [UIBarButtonItem itemWithTarget:self action:@selector(messageClick) image:@"yulin_community_notice" highImage:@"yulin_community_notice_pressed"];
                
                
            }
            
            
            
            //self.rootViewController.navigationItem.rightBarButtonItem = _messageItem;
            
            //设置APP消息通知数
            UIApplication *application = [UIApplication sharedApplication];
            [application setApplicationIconBadgeNumber:unreadCount];
            
            
            
            
            
        }else{
            
            
            
            [self showHint:responseObject[@"message"]];
            
            
        }
        
        
    } failure:^(NSError *error) {
        
        [self showHint:error.localizedDescription];
        
    }];
    
    
    
    //后期加上系统消息数
    if (unreadCount > 0) {
        
        
        
        _messageItem = [UIBarButtonItem itemWithTarget:self action:@selector(messageClick) image:@"community_newNotice" highImage:@"community_newNotice_pressed"];
        
        
        
        
    }else{
        
        
        
        
        _messageItem =  [UIBarButtonItem itemWithTarget:self action:@selector(messageClick) image:@"yulin_community_notice" highImage:@"yulin_community_notice_pressed"];
        
        
    }
    
    
    
    //self.rootViewController.navigationItem.rightBarButtonItem = _messageItem;
    
    //设置APP消息通知数
    UIApplication *application = [UIApplication sharedApplication];
    [application setApplicationIconBadgeNumber:unreadCount];
    
    */
    
}


- (void)messageClick{
    
    
//    [MobClick event:@"message" label:@"消息"];
//    
//    
//    MessageViewController *message = [MessageViewController shareIntance];
//    
//    // message.isDragToReply = YES;
//    
//    DLog(@"消息");
//    
//    WeakSelf(self);
//    [MCTools judgeWhetherLoginWithTransactionViewController:self fromWhichModule:OtherVC andLoggedTransactionBlock:^{
//        
//        StrongSelf(self);
//        
//        if ([self.rootViewController isKindOfClass:[QSForumViewController class]] ||[self.rootViewController isKindOfClass:[HomeViewController class]]) {
//            
//            [self.rootViewController.navigationController pushViewController:message animated:YES];
//            
//        }
//        
//    }];
    
    
    
    
    
}

/*!
 @method
 @brief 会话列表信息更新时的回调
 @discussion 1. 当会话列表有更改时(新添加,删除), 2. 登陆成功时, 以上两种情况都会触发此回调
 @param conversationList 会话列表
 @result
 */
- (void)didUpdateConversationList:(NSArray *)conversationList{
    
    
    
    [self setupUnreadMessageCount];
    
    
    
    
    
}


/*!
 @method
 @brief 未读消息数改变时的回调
 @discussion 当EMConversation对象的enableUnreadMessagesCountEvent为YES时,会触发此回调
 @result
 */
- (void)didUnreadMessagesCountChanged{
    
    
    [self setupUnreadMessageCount];
    
    
}

//离线非透传消息接收完成的回调
- (void)didFinishedReceiveOfflineMessages
{
    [self setupUnreadMessageCount];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

//- (UIViewController *)childViewControllerForStatusBarHidden{
//
//    return self.topViewController;
//
//}

- (BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

- (void)dealloc
{
    DLog(@"MCNavigation");
}

@end
