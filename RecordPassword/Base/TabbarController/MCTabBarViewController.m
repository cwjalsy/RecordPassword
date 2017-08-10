//
//  MCTabBarViewController.m
//  MyCommunity
//
//  Created by wenjim on 16/7/20.
//  Copyright © 2016年 XiaoNingLe. All rights reserved.
//

#import "MCTabBarViewController.h"
#import "MCTabBarViewController+MCCheckNewVersion.h"
#import "JhTabbar.h"
#import "MCNavigationController.h"

//#import "HomeViewController.h" //首页模块

//#import "MineViewController.h" //我的模块


//#import "StrategyHomeViewController.h" //攻略模块




//#import "WJMineViewController.h" //我的模块

//#import "JhH5NewsViewController.h"

//#import "ChatListViewController.h"
//#import "MessageViewController.h"

//#import "ContactsViewController.h"

//#import "EMCDDeviceManager.h"  //播放音频震动类

//#import "FriendInfo.h"

//#import "RobotManager.h"

//#import "ConvertToCommonEmoticonsHelper.h"

//#import "QSForumViewController.h"

//#import "JhFollowingUserViewController.h"
//#import "ForumNoticeViewController.h"


//#import "StrategyDetailViewController.h" // 攻略
//#import "AttackDetailViewController.h"   // 出招、测试
//#import "JhH5NewsViewController.h"       // 新闻
//#import "QSAudioPlayerViewController.h"  // 音频
//#import "JHQADetailViewController.h"     // 问答

//#import "QSStrategyListModel.h"
//#import "TestHomeListModel.h"
//#import "JhQAHomeListModel.h"
//#import "QSAudioDataModel.h"

//#import "WJCourseHomeViewController.h" // 课程

//#import "WJDiscoverHomeViewController.h" // 发现

//两次提示的默认间隔
static const CGFloat kDefaultPlaySoundInterval = 3.0;
static NSString *kMessageType = @"MessageType";
static NSString *kConversationChatter = @"ConversationChatter";
static NSString *kGroupName = @"GroupName";

@interface MCTabBarViewController () <UIAlertViewDelegate,UITabBarControllerDelegate,JhTabbarDelegate>

//IChatManagerDelegate,
@property (strong, nonatomic) NSDate *lastPlaySoundDate;


@end

@implementation MCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    //设置TabBar图片下面字体的颜色
    [self TabBarTitleColor];
    //设置TabBar所有的控件
    [self setTabBarAllControl];

    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUntreatedApplyCount) name:@"setupUntreatedApplyCount" object:nil];
    
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:KNOTIFICATION_RELOADFOLLOWINGUSER object:nil] subscribeNext:^(NSNotification *notification) {
//      
//        [[JhFollowingUserViewController shareInstance] reloadDataSource];
//        
//        [[MessageViewController shareIntance] refreshDataSource];
//        
//        
//    }];
    
//     [self registerNotifications];
    
    
//    [self setupUnreadMessageCount];
//    [self setupUntreatedApplyCount];
//
    
//   检查新版本
//    [self checkNewVersion];
    
   

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    

    
    //TODO:友盟统计待修改
    if (tabBarController.selectedIndex == 0) {
        
//        [MobClick event:@"home" label:@"首页"];
        
        
    }else if (tabBarController.selectedIndex == 1){
    
//     [MobClick event:@"forum" label:@"课程"];
        
    
    
    }else if (tabBarController.selectedIndex == 2){
    
    
//     [MobClick event:@"mine" label:@"发现"];
    
    }else{
    
//     [MobClick event:@"mine" label:@"我的"];
    
    }

    

    
    

}




//
//#pragma mark - 统计消息未读数(会话列表消息+系统消息)
//- (void)setupUnreadMessageCount{
//
//  
//    NSArray *conversations = [[[EaseMob sharedInstance] chatManager] conversations];
//    
//    
//    NSInteger unreadCount = 0;
//    
//    
//    for (EMConversation *conversation in conversations) {
//        
//        unreadCount += conversation.unreadMessagesCount;
//        
//        
//    }
//    
//   
//    //后期加上系统消息数
//    
//    
//    
//    
//    
//    
//    
//
//}


//#pragma mark - 统计未处理申请通知数，并显示角标
//- (void)setupUntreatedApplyCount{
//
//    
//    
//
//
//}
- (void)registerNotifications{


    [self unregisterNotification];
    
//    [[EaseMob sharedInstance].chatManager addDelegate: self delegateQueue:nil];
    
}


- (void)unregisterNotification{


//    [[EaseMob sharedInstance].chatManager removeDelegate:self];
    


}
#pragma mark - 设置TabBar图片下面字体的颜色
-(void)TabBarTitleColor
{
    //未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:WJColor(150, 150, 150, 1),NSFontAttributeName:[UIFont systemFontOfSize:11.f]} forState:UIControlStateNormal];
    
    
    //选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:WJColor(255, 197, 103, 1),NSFontAttributeName:[UIFont systemFontOfSize:11.f]} forState:UIControlStateSelected];
}

#pragma mark - 设置TabBar的内容
-(void)setTabBarAllControl
{
//   HomeViewController *home = [[HomeViewController alloc]init];
//
//    
//    [self setUpOneChildViewControl:home  image:[UIImage imageOriginallyWithName:@"tab_home"] selectedImage:[UIImage imageOriginallyWithName:@"tab_home_selected"] title:@"首页"];
//    
//
//    MineViewController * mine = [[MineViewController alloc]init];
//
//    [self setUpOneChildViewControl:mine image:[UIImage imageOriginallyWithName:@"tab_me"] selectedImage:[UIImage imageOriginallyWithName:@"tab_me_selected"] title:@"我的"];
//   
//////    //改变UITabBarController的背景颜色
//    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
//    bgView.backgroundColor = [UIColor whiteColor];
//
//
//        [UIColor colorWithRed:1 green:0.98 blue:0.98 alpha:1];
//    [self.tabBar insertSubview:bgView atIndex:0];
//
//    self.tabBar.backgroundColor = [UIColor whiteColor];
//
//    self.tabBar.barTintColor = [UIColor whiteColor];
//    
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
//    
//    JhTabbar *tabbar = [[JhTabbar alloc]init];
//    
//    tabbar.jh_TabbarDelegate = self;
//     
//    [self setValue:tabbar forKeyPath:@"tabBar"];
//    
}

- (void)mineButtonDidClick{

    if ([UserManager isLogin]) {
        
        
        self.selectedIndex = 3;
        
        
        
    }else{
    
    
//        [MCTools needPushedViewController:self WithLoggedSelection:OtherVC];
//
//      
//        //做一个标记 点了我的模块 方便登录成功后跳到我的界面
//        
//        [MCuserInfoTool recordMineButtonItemClickWithIsClick:YES];
//        
        
        //没有则直接dismiss到原来的界面
       
        
       
        
    }

  

}



#pragma mark - 抽取方法，使得前面的代码更简洁
-(void)setUpOneChildViewControl:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.title = title;
    //    vc.tabBarItem.title = @"哈哈";
    vc.tabBarItem.image         = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    
    //    [self addChildViewController:vc];
    
    //设置导航条
    MCNavigationController * nav = [[MCNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

//- (void)networkChanged:(EMConnectionState)connectionState{
//
//    
//    _connectionSate = connectionState;
//    
//    /*   待拓展  */
//    [[MessageViewController shareIntance] networkChanged:connectionState];
//
//
////    
//
//    
//
//    switch ([MCHttpTool sharedMCNetworking].networkStatus) {
//        case StatusNotReachable:
//
//            [self showHint:@"没有网络"];
//        
//            break;
//         case StatusReachableViaWWAN:
//    
//            [self showHint:@"手机蜂窝网"];
//        
//            break;
//           case StatusReachableViaWiFi:
//        
//            [self showHint:@"已连接WiFi"];
//        
//            break;
//        default:
//            break;
//    }
//    
//    
//    
//    
//    
//}


- (void)jumpToChatList{

    

    
    
//     MCNavigationController *nav = (MCNavigationController *)self.selectedViewController;
//    
//
//    
//    if (nav.topViewController.presentedViewController) {
//     
//        MCNavigationController *nav1 = (MCNavigationController *)nav.topViewController.presentedViewController;
//        
//        [nav1 pushViewController:[MessageViewController shareIntance] animated:YES];
//
//    }else{
//
//        if (![nav.topViewController isKindOfClass:[MessageViewController class]]) {
//            
//            [nav pushViewController:[MessageViewController shareIntance] animated:YES];
//        
//          }
//    }
}

- (void)jumpToArticleDetailWithData:(NSDictionary *)data
{
//    newsDataModel *model = [newsDataModel objectWithKeyValues:data];
//    JhH5NewsViewController *newsVC = [[JhH5NewsViewController alloc] init];
//    
//    newsVC.model = model;
//    newsVC.type = NewsType;
//    
//    MCNavigationController *nav = (MCNavigationController *)self.selectedViewController;
//    
//    if (nav.topViewController.presentedViewController) {
//        
//        MCNavigationController *nav1 = (MCNavigationController *)nav.topViewController.presentedViewController;
//        
//        
//        [nav1 pushViewController:newsVC animated:YES];
//        
//    }else{
//        
//        if (![nav.topViewController isKindOfClass:[MessageViewController class]]) {
//            
//            [nav pushViewController:newsVC animated:YES];
//        }
//    }
}


- (void)didReceiveLocalNotification:(UILocalNotification *)notification{


    [self jumpToChatList];
    
}




#pragma mark - IChatManagerDelegate 消息变化

- (void)didUpdateConversationList:(NSArray *)conversationList
{
    
//    [self setupUnreadMessageCount];
    
    
//    [[MessageViewController shareIntance] refreshDataSource];
    

    
}

//未读消息数量变化
- (void)didUnreadMessagesCountChanged
{
    
    
//    [self setupUnreadMessageCount];
    
}


//离线非透传消息接收完成的回调
- (void)didFinishedReceiveOfflineMessages
{
//    [self setupUnreadMessageCount];
}

//离线透传消息接收完成的回调
- (void)didFinishedReceiveOfflineCmdMessages
{
    
    
    
}


- (BOOL)needShowNotification:(NSString *)fromChatter
{
    BOOL ret = YES;
//    NSArray *igGroupIds = [[EaseMob sharedInstance].chatManager ignoredGroupIds];
//    for (NSString *str in igGroupIds) {
//        if ([str isEqualToString:fromChatter]) {
//            ret = NO;
//            break;
//        }
//    }
//    
    return ret;
}

//TODO:收到消息回调  发送本地通知 (用于屏蔽单个用户的免打扰)
//- (void)didReceiveMessage:(EMMessage *)message
//{
//    
//    
//    //如果message.from == 密友之一  则不发送本地通知
//    
//    
//    //    MCMethodLog();
//    //        MCLog(@"message from is  %@",message.from);
//    
//    
//    BOOL needShowNotification = (message.messageType != eMessageTypeChat) ? [self needShowNotification:message.conversationChatter] : YES;
//    
//    if (needShowNotification) {
//#if !TARGET_IPHONE_SIMULATOR
//        
//        //        BOOL isAppActivity = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
//        //        if (!isAppActivity) {
//        //            [self showNotificationWithMessage:message];
//        //        }else {
//        //            [self playSoundAndVibration];
//        //        }
//        
//        
//        UIApplicationState state = [[UIApplication sharedApplication] applicationState];
//        switch (state) {
//            case UIApplicationStateActive:
//                [self playSoundAndVibration];
//                break;
//            case UIApplicationStateInactive:
//                [self playSoundAndVibration];
//                break;
//            case UIApplicationStateBackground:
//                [self showNotificationWithMessage:message];
//                break;
//            default:
//                break;
//        }
//        
//        
//#endif
//    }
//    
//    
//}
//
////收到在线透传消息
//- (void)didReceiveCmdMessage:(EMMessage *)cmdMessage
//{
//    
//    
//    [self showHint:NSLocalizedString(@"receiveCmd", @"receive cmd message")];
//    
//    
//    
//}
//
////播放音效和震动
//- (void)playSoundAndVibration{
//    NSTimeInterval timeInterval = [[NSDate date]
//                                   timeIntervalSinceDate:self.lastPlaySoundDate];
//    if (timeInterval < kDefaultPlaySoundInterval) {
//        //如果距离上次响铃和震动时间太短, 则跳过响铃
//        NSLog(@"skip ringing & vibration %@, %@", [NSDate date], self.lastPlaySoundDate);
//        return;
//    }
//    
//    //保存最后一次响铃时间
//    self.lastPlaySoundDate = [NSDate date];
//    
//    // 收到消息时，播放音频
//    
//    if ([MCuserInfoTool isVibrationPlayOpened]) {
//        
//        // 收到消息时，震动
//        [[EMCDDeviceManager sharedInstance] playVibration];
//        
//        
//    }
//    
//    
//    if ([MCuserInfoTool isSoundPlayOpened]) {
//        
//        
//        
//        [[EMCDDeviceManager sharedInstance] playNewMessageSound];
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
//#pragma mark - IChatManagerDelegate 登陆回调（主要用于监听自动登录是否成功）
//
//- (void)didLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error
//{
//    if (error) {
//        NSString *hintText = NSLocalizedString(@"reconnection.retry", @"Fail to log in your account, is try again... \nclick 'logout' button to jump to the login page \nclick 'continue to wait for' button for reconnection successful");
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt")
//                                                            message:hintText
//                                                           delegate:self
//                                                  cancelButtonTitle:NSLocalizedString(@"reconnection.wait", @"continue to wait")
//                                                  otherButtonTitles:NSLocalizedString(@"logout", @"Logout"),
//                                  nil];
//        alertView.tag = 99;
//        [alertView show];
//        
////         消息列表界面 待拓展
//        [[MessageViewController shareIntance] isConnect:NO];
//        
////        [_chatListVC isConnect:NO];
//    }
//}
//

#pragma mark - IChatManagerDeledate 好友变化

//接受到好友请求时的回调
//- (void)didReceiveBuddyRequest:(NSString *)username message:(NSString *)message
//{
//    
//    
//    DLog(@"haha");
//    
//#if !TARGET_IPHONE_SIMULATOR
//    [self playSoundAndVibration];
//    
//    BOOL isAppActivity = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
//    if (!isAppActivity) {
//        //发送本地推送
//        UILocalNotification *notification = [[UILocalNotification alloc] init];
//        notification.fireDate = [NSDate date]; //触发通知的时间
//        notification.alertBody = [NSString stringWithFormat:NSLocalizedString(@"friend.somebodyAddWithName", @"%@ add you as a friend"), username];
//        notification.alertAction = NSLocalizedString(@"open", @"Open");
//        notification.timeZone = [NSTimeZone defaultTimeZone];
//    }
//#endif
//    
//    //        [_contactsVC reloadApplyView];
//    
//    [[ContactsViewController shareInstance] reloadApplyView];
//    
//    
////    [self setupUnreadMessageCount];
//    
//    
//}

//- (void)_removeBuddies:(NSArray *)userNames
//{
//    
//    DLog(@"=======================删除");
//    
//    [[EaseMob sharedInstance].chatManager removeConversationsByChatters:userNames deleteMessages:YES append2Chat:YES];
//    
//    //#warning 待拓展
//    [_chatListVC refreshDataSource];
//    
//    NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//    ChatViewController *chatViewContrller = nil;
//    for (id viewController in viewControllers)
//    {
//        if ([viewController isKindOfClass:[ChatViewController class]] && [userNames containsObject:[(ChatViewController *)viewController chatter]])
//        {
//            chatViewContrller = viewController;
//            break;
//        }
//    }
//    if (chatViewContrller)
//    {
//        [viewControllers removeObject:chatViewContrller];
//        [self.navigationController setViewControllers:viewControllers animated:YES];
//    }
//    
//    for (NSString *userName in userNames) {
//        
//        //1.更新本地数据库数据
//        
//        [MCHttpTool UpdateLocalBuddyTabelByhxKey:userName AndUserInfo:nil WithUpdateType:deleteType];
//        
//        //2.调用本地服务器删除接口
//        
//        NSDictionary *paramter = @{@"hxKey":userName};
//        
//        [MCHttpTool requestPOSTWithURL:@"friend/delByKey" WithParameter:paramter success:^(id responseObject) {
//            
//            //            MCLog(@"删除好友%@",responseObject);
//            
//            
//        } failure:^(NSError *error) {
//            
//            
//            //            MCLog(@"%@",error);
//            //            [self showHint:@"网络故障"];
//            
//        }];
//        
//        
//        
//        
//    }
//    
//    
//    
//    //    [MCHttpTool getSearchUserDetailInfoWithYulinStr:@"" hxKey:userNames[0] succeesBlock:^(id responseObject) {
//    //
//    //
//    //        FriendData *data = (FriendData *)responseObject;
//    //
//    //        [self showHint:[NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"delete", @"delete"), data.userName]];
//    //
//    //
//    //    } failedBlock:^(NSError *error) {
//    //
//    //    }];
//    //
//    
//    
//    
//    
//    
//}


//- (void)didUpdateBuddyList:(NSArray *)buddyList
//            changedBuddies:(NSArray *)changedBuddies
//                     isAdd:(BOOL)isAdd
//{
//    
//    
//    //    DLog(@"是否调用了此方法");
//    
//    
//    //FIXME:   //注册了俩次代理
//    //    DLog(@"为什么调用我俩次");
//    
//    if (!isAdd)
//    {
//        NSMutableArray *deletedBuddies = [NSMutableArray array];
//        for (EMBuddy *buddy in changedBuddies)
//        {
//            if ([buddy.username length])
//            {
//                [deletedBuddies addObject:buddy.username];
//            }
//        }
//        if (![deletedBuddies count])
//        {
//            return;
//        }
//        
//        [self _removeBuddies:deletedBuddies];
//    } else {
//        // clear conversation
//        NSArray *conversations = [[EaseMob sharedInstance].chatManager conversations];
//        NSMutableArray *deleteConversations = [NSMutableArray arrayWithArray:conversations];
//        NSMutableDictionary *buddyDic = [NSMutableDictionary dictionary];
//        for (EMBuddy *buddy in buddyList) {
//            if ([buddy.username length]) {
//                [buddyDic setObject:buddy forKey:buddy.username];
//            }
//        }
//        for (EMConversation *conversation in conversations) {
//            if (conversation.conversationType == eConversationTypeChat) {
//                if ([buddyDic objectForKey:conversation.chatter]) {
//                    [deleteConversations removeObject:conversation];
//                }
//            } else {
//                [deleteConversations removeObject:conversation];
//            }
//        }
//        if ([deleteConversations count] > 0) {
//            NSMutableArray *deletedBuddies = [NSMutableArray array];
//            for (EMConversation *conversation in deleteConversations) {
//                if (![[RobotManager sharedInstance] isRobotWithUsername:conversation.chatter]) {
//                    [deletedBuddies addObject:conversation.chatter];
//                }
//            }
//            if ([deletedBuddies count] > 0) {
//                [self _removeBuddies:deletedBuddies];
//            }
//        }
//    }
//    //        [_contactsVC reloadDataSource];
//    
//    [[ContactsViewController shareController] reloadDataSource];
//    
//    
//    
//}
//
//- (void)didRemovedByBuddy:(NSString *)username
//{
//    [self _removeBuddies:@[username]];
//    //    [_contactsVC reloadDataSource];
//    
//    [[ContactsViewController shareController] reloadDataSource];
//    
//    
//}


//#pragma mark - 好友请求被接受时的回调
//- (void)didAcceptedByBuddy:(NSString *)username
//{
//    
//    
//    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_ADDFRIENDSUCCEED object:username];
//    
//    
//    
//    //   [_contactsVC reloadDataSource];
//    
//    [[ContactsViewController shareController] reloadDataSource];
//    
//    
//    
//    [MCHttpTool getSearchUserDetailInfoWithYulinStr:@"" hxKey:username succeesBlock:^(id responseObject) {
//        
//        
//        FriendData *data = (FriendData *)responseObject;
//        
//        NSDictionary *dic = data.keyValues;
//        
//        
//        
//        //1.更新本地数据库数据
//        [MCHttpTool UpdateLocalBuddyTabelByhxKey:username AndUserInfo:dic WithUpdateType:addType];
//        
//        NSDictionary *paramter = @{@"hxKey":username};
//        
//        
//        
//        //2.更新本地服务器数据
//        [MCHttpTool requestPOSTWithURL:@"friend/addByKey" WithParameter:paramter success:^(id responseObject) {
//            
//            
//            
//            if ([responseObject[@"success"] integerValue] == 1) {
//                
//                
//                [self showHint:[NSString stringWithFormat:@"%@ 同意添加你为好友",data.userName]];
//                
//            }
//            
//        } failure:^(NSError *error) {
//            
//            MCLog(@"%@",error);
//            
//            
//            [self showHint:@"网络错误"];
//            
//        }];
//        
//        
//        
//        
//    } failedBlock:^(NSError *error) {
//        
//    }];
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
//

#pragma mark - 好友请求被拒绝的回调
//- (void)didRejectedByBuddy:(NSString *)username
//{

    
    //TODO: 不给用户提醒  静默
    
    //    [MCHttpTool getSearchUserDetailInfoWithYulinStr:@"" hxKey:username succeesBlock:^(id responseObject) {
    //
    //
    //        FriendData *data = (FriendData *)responseObject;
    //
    //
    //        NSString *message = [NSString stringWithFormat:NSLocalizedString(@"friend.beRefusedToAdd", @"you are shameless refused by '%@'"), data.userName];
    //        TTAlertNoTitle(message);
    //
    //
    //
    //    } failedBlock:^(NSError *error) {
    //
    //    }];
    
    
//}


//- (void)didAcceptBuddySucceed:(NSString *)username
//{
//    [_contactsVC reloadDataSource];
//    //    [[ContactsViewController shareController] reloadDataSource];
//    
//    //FIXME: 接受好友请求 或者好友请求被接受 是否需要插一条新消息到消息列表界面？
//    
//    //    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_ADDFRIENDSUCCEED object:username];
//}
//

#pragma mark - IChatManagerDelegate 群组变化

//- (void)didReceiveGroupInvitationFrom:(NSString *)groupId
//                              inviter:(NSString *)username
//                              message:(NSString *)message
//{
//#if !TARGET_IPHONE_SIMULATOR
//    [self playSoundAndVibration];
//#endif
//    
//    //        [_contactsVC reloadGroupView];
//    
//    [[ContactsViewController shareController] reloadGroupView];
//}
//
////接收到入群申请
//- (void)didReceiveApplyToJoinGroup:(NSString *)groupId
//                         groupname:(NSString *)groupname
//                     applyUsername:(NSString *)username
//                            reason:(NSString *)reason
//                             error:(EMError *)error
//{
//    if (!error) {
//#if !TARGET_IPHONE_SIMULATOR
//        [self playSoundAndVibration];
//#endif
//        
//        
//        //                [_contactsVC  reloadGroupView];
//        
//        [[ContactsViewController shareController] reloadGroupView];
//    }
//}
//
//- (void)didReceiveGroupRejectFrom:(NSString *)groupId
//                          invitee:(NSString *)username
//                           reason:(NSString *)reason
//{
//    NSString *message = [NSString stringWithFormat:NSLocalizedString(@"friend.beRefusedToAdd", @"you are shameless refused by '%@'"), username];
//    TTAlertNoTitle(message);
//}
//
//
//- (void)didReceiveAcceptApplyToJoinGroup:(NSString *)groupId
//                               groupname:(NSString *)groupname
//{
//    NSString *message = [NSString stringWithFormat:NSLocalizedString(@"group.agreedAndJoined", @"agreed to join the group of \'%@\'"), groupname];
//    [self showHint:message];
//}
//

#pragma mark - IChatManagerDelegate 登录状态变化

//从其他设备登陆  强行进入到登陆界面重新登陆

//- (void)didLoginFromOtherDevice
//{
//    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"loginAtOtherDevice", @"your login account has been in other places") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//        alertView.tag = 100;
//        [alertView show];
//        
//        
//        [MCuserInfoTool logout];
//        
//        //TODO: 如果被强退 不清除本地的用户信息
//        
//        //        [MCuserInfoTool ClearUserInfo];
//
//        
//        
//    } onQueue:nil];
//}
//
//
////账号从服务器删除  进入到登陆界面
//- (void)didRemovedFromServer
//{
//    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"loginUserRemoveFromServer", @"your account has been removed from the server side") delegate:self cancelButtonTitle:NSLocalizedString(@"ok", @"OK") otherButtonTitles:nil, nil];
//        alertView.tag = 101;
//        [alertView show];
//    } onQueue:nil];
//}
//
//
//- (void)didServersChanged
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
//}
//
//- (void)didAppkeyChanged
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
//}
//
//
//- (EMConversationType)conversationTypeFromMessageType:(EMMessageType)type
//{
//    EMConversationType conversatinType = eConversationTypeChat;
//    switch (type) {
//        case eMessageTypeChat:
//            conversatinType = eConversationTypeChat;
//            break;
//        case eMessageTypeGroupChat:
//            conversatinType = eConversationTypeGroupChat;
//            break;
//        case eMessageTypeChatRoom:
//            conversatinType = eConversationTypeChatRoom;
//            break;
//        default:
//            break;
//    }
//    return conversatinType;
//}
//
//
//
//#pragma mark - 本地推送设置 并发送本地推送
//- (void)showNotificationWithMessage:(EMMessage *)message
//{
//    EMPushNotificationOptions *options = [[EaseMob sharedInstance].chatManager pushNotificationOptions];
//    //发送本地推送
//    UILocalNotification *notification = [[UILocalNotification alloc] init];
//    notification.fireDate = [NSDate date]; //触发通知的时间
//    
//    
//    //判断推送样式
//    
//    if (options.displayStyle == ePushNotificationDisplayStyle_messageSummary) {
//        id<IEMMessageBody> messageBody = [message.messageBodies firstObject];
//        NSString *messageStr = nil;
//        switch (messageBody.messageBodyType) {
//            case eMessageBodyType_Text:
//            {
//                
//                //TODO: 表情转换
//                
//                messageStr = [ConvertToCommonEmoticonsHelper convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
//                
//                
//            }
//                break;
//            case eMessageBodyType_Image:
//            {
//                messageStr = NSLocalizedString(@"message.image", @"Image");
//            }
//                break;
//            case eMessageBodyType_Location:
//            {
//                messageStr = NSLocalizedString(@"message.location", @"Location");
//            }
//                break;
//            case eMessageBodyType_Voice:
//            {
//                messageStr = NSLocalizedString(@"message.voice", @"Voice");
//            }
//                break;
//            case eMessageBodyType_Video:{
//                messageStr = NSLocalizedString(@"message.video", @"Video");
//            }
//                break;
//            default:
//                break;
//        }
//        
//        NSString *title = message.from;
//        
//        
//        
//        
//        if (message.messageType == eMessageTypeGroupChat) {
//            NSArray *groupArray = [[EaseMob sharedInstance].chatManager groupList];
//            for (EMGroup *group in groupArray) {
//                if ([group.groupId isEqualToString:message.conversationChatter]) {
//                    title = [NSString stringWithFormat:@"%@(%@)", message.groupSenderName, group.groupSubject];
//                    break;
//                }
//            }
//        }
//        else if (message.messageType == eMessageTypeChatRoom)
//        {
//            NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//            NSString *key = [NSString stringWithFormat:@"OnceJoinedChatrooms_%@", [[[EaseMob sharedInstance].chatManager loginInfo] objectForKey:@"username" ]];
//            NSMutableDictionary *chatrooms = [NSMutableDictionary dictionaryWithDictionary:[ud objectForKey:key]];
//            NSString *chatroomName = [chatrooms objectForKey:message.conversationChatter];
//            if (chatroomName)
//            {
//                title = [NSString stringWithFormat:@"%@(%@)", message.groupSenderName, chatroomName];
//            }
//        }
//        
//        //        notification.alertBody = [NSString stringWithFormat:@"%@:%@", title, messageStr];
//        
//        [MCTools getOneUserInfomationByHxKey:message.from success:^(FriendData *data, NSString *faileReason) {
//            
//            
//            notification.alertBody = [NSString stringWithFormat:@"%@:%@", data.userName, messageStr];
//            
//            
//            
//        } fail:^(NSError *error) {
//            
//        }];
//     
//        
//    }
//    else{
//        notification.alertBody = NSLocalizedString(@"receiveMessage", @"you have a new message");
//    }
//    
//#warning 去掉注释会显示[本地]开头, 方便在开发中区分是否为本地推送
//    //notification.alertBody = [[NSString alloc] initWithFormat:@"[本地]%@", notification.alertBody];
//    
//    notification.alertAction = NSLocalizedString(@"open", @"Open");
//    notification.timeZone = [NSTimeZone defaultTimeZone];
//    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:self.lastPlaySoundDate];
//    if (timeInterval < kDefaultPlaySoundInterval) {
//        NSLog(@"skip ringing & vibration %@, %@", [NSDate date], self.lastPlaySoundDate);
//    } else {
//        notification.soundName = UILocalNotificationDefaultSoundName;
//        self.lastPlaySoundDate = [NSDate date];
//    }
//    
//    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
//    [userInfo setObject:[NSNumber numberWithInt:message.messageType] forKey:kMessageType];
//    [userInfo setObject:message.conversationChatter forKey:kConversationChatter];
//    notification.userInfo = userInfo;
//    
//    
//    //发送通知
//    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//    //    UIApplication *application = [UIApplication sharedApplication];
//    //    application.applicationIconBadgeNumber += 1;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
- (void)dealloc
{
    
    [self unregisterNotification];
    
    
}


#pragma mark - UIAlertViewDelegate  跳转到登陆界面
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    //login form other device tag == 100
    if (alertView.tag == 100) {
        
        if (buttonIndex == 0) {
            
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationLoginStateChange object:@NO];
            
            
    
        
//            [MCTools needPushedViewController:self  WithLoggedSelection:OtherVC];
            

        }
        
        
        
    }
    
   
}

#pragma mark - 远程通知的跳转

// 跳转到回复列表
- (void)jumpToForumNotice{

//    MCNavigationController *nav = (MCNavigationController *)self.selectedViewController;
//    
//    ForumNoticeViewController *notice = [[ForumNoticeViewController alloc]init];
//    
//    if (nav.topViewController.presentedViewController) {
//        
//        MCNavigationController *nav1 = (MCNavigationController *)nav.topViewController.presentedViewController;
//        [nav1 pushViewController:notice animated:YES];
//        
//    }else{
//        
//        if ([nav.topViewController isKindOfClass:[ForumNoticeViewController class]]) {
//            
//            //刷新论坛通知界面
//            [notice refreshData];
//            
//        }else{
//        
//         [nav pushViewController:notice animated:YES];
//        
//        }
//        
//    }
    
}




- (void)jumpToStrategyDetail:(NSDictionary *)data
{
//    StrategyDetailViewController *strategyVC = [[StrategyDetailViewController alloc] init];
//    
//    strategyVC.strategyModel = [QSStrategyListModel objectWithKeyValues:data];
//    
//    [self jumptoViewController:strategyVC];
    
}

- (void)jumpToAttackDetail:(NSDictionary *)data
{
//    AttackDetailViewController *detailVC = [[AttackDetailViewController alloc] init];
//    
//    AttackHomeListModel *model = [AttackHomeListModel objectWithKeyValues:data];
//    
//    QSDetailModel *detailModel = [QSDetailModel qsDetailModelWithURL:model.url img:nil title:model.title introduction:model.introduction detailId:model.ID detailType:DetailTypeAttack];
//    
//    detailVC.detailModel = detailModel;
//
//    
//    [self jumptoViewController:detailVC];
}

- (void)jumpToQADetail:(NSDictionary *)data
{
//    JHQADetailViewController *qaDetailVC = [[JHQADetailViewController alloc] init];
//    
//    JHQAHomeListDataModel *model = [JHQAHomeListDataModel objectWithKeyValues:data];
//    qaDetailVC.listDataModel = model;
//    
//    [self jumptoViewController:qaDetailVC];
    
}

- (void)jumpToNewsDetail:(NSDictionary *)data
{
//    JhH5NewsViewController *newsVC = [[JhH5NewsViewController alloc] init];
//    newsVC.model = [newsDataModel objectWithKeyValues:data];
//    newsVC.type = NewsType;
//    
//    [self jumptoViewController:newsVC];
}

- (void)jumpToTestDetail:(NSDictionary *)data
{
//    AttackDetailViewController *detailVC = [[AttackDetailViewController alloc] init];
//    
//    TestHomeListModel *model = [TestHomeListModel objectWithKeyValues:data];
//    
//    QSDetailModel *detailModel = [QSDetailModel qsDetailModelWithURL:model.url img:model.img title:model.title introduction:model.introduction detailId:model.ID detailType:DetailTypeTest];
//    
//    detailVC.detailModel = detailModel;
//   
//    
//    [self jumptoViewController:detailVC];
}

- (void)jumpToFMDetail:(NSDictionary *)data
{
    
//    NSString *audioId = data[@"broadcastId"];
//    
//    if (self.viewControllers.count > 0) {
//        
//        MCNavigationController *nav = self.viewControllers[0];
//        
//        UIViewController *superVC = nil;
//        
//        if (nav.viewControllers.count > 0) {
//            
//            // 设置音频切换时的 背景控制器
//            MCNavigationController *showNav = (MCNavigationController *)self.selectedViewController;
//            if (showNav.topViewController.presentedViewController) {
//                
//                MCNavigationController *mcnav = (MCNavigationController *)showNav.topViewController.presentedViewController;
//            
//                if (mcnav.viewControllers.count > 0) {
//                    
//                    UIViewController *vc = mcnav.viewControllers[0];
//                    
//                    if ([vc isKindOfClass:[QSAudioPlayerViewController class]]) {
//                        
//                        QSAudioPlayerViewController *audioPlayVC = [QSAudioPlayerViewController defaultAudioPlayerViewController];
//                        
//                        [audioPlayVC playAudioNotOtherAudioWithAudioModel:[AudioModel objectWithKeyValues:data]];
//                        
//                        return;
//                        
//                    }
//                    
//                }
//                
//            }
//            
//            MCNavigationController *nav = (MCNavigationController *)self.selectedViewController;
//            
//            if (nav.topViewController.presentedViewController) {
//                
//                superVC = (MCNavigationController *)nav.topViewController.presentedViewController;
//                
//            }else{
//                
//               superVC = showNav.topViewController;
//            }
//            
//            HomeViewController *homeVC = nav.viewControllers[0];
//            
//            if ([homeVC isKindOfClass:[HomeViewController class]]) {
//                
//                AudioModel *model = [homeVC currentShowModelWithAudioID:audioId];
//                
//                if (model) {
//                    
//                    QSAudioPlayerViewController *audioPlayVC = [QSAudioPlayerViewController defaultAudioPlayerViewController];
//                    
//                    if (audioPlayVC.currentAudioModel) {
//                        
//                        if (![audioPlayVC.currentAudioModel.broadcastId isEqualToString:model.broadcastId]) {
//                            
//                            [audioPlayVC newUIStatus];
//                            audioPlayVC.homeViewController = homeVC;
//                            audioPlayVC.allAudioArray = [NSMutableArray arrayWithArray:homeVC.audioDataModel.data];
//                            [audioPlayVC playAudioWithAudioModel:model];
//                        }
//                        
//                    }else {
//                        
//                        audioPlayVC.homeViewController = superVC;
//                        audioPlayVC.allAudioArray = [NSMutableArray arrayWithArray:homeVC.audioDataModel.data];
//                        [audioPlayVC playAudioWithAudioModel:model];
//                    }
//                    
//                    // 设置跳转动画类型
//                    audioPlayVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//                    
//                    MCNavigationController *nav = nil;
//                    if (audioPlayVC.navigationController) {
//                        nav = (MCNavigationController *)audioPlayVC.navigationController;
//                    }else {
//                        nav = [[MCNavigationController alloc] initWithRootViewController:audioPlayVC];
//                    }
//                    [superVC presentViewController:nav animated:YES completion:nil];
//                    
//                }else {
//                    
//                    
//                    QSAudioPlayerViewController *audioPlayVC = [QSAudioPlayerViewController defaultAudioPlayerViewController];
//                    audioPlayVC.homeViewController = superVC;
//                    [audioPlayVC playAudioNotOtherAudioWithAudioModel:[AudioModel objectWithKeyValues:data]];
//                    
//                    audioPlayVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//                    
//                    MCNavigationController *nav = nil;
//                    if (audioPlayVC.navigationController) {
//                        nav = (MCNavigationController *)audioPlayVC.navigationController;
//                    }else {
//                        nav = [[MCNavigationController alloc] initWithRootViewController:audioPlayVC];
//                    }
//                    [superVC presentViewController:nav animated:YES completion:nil];
//                }
//                
//            }
//        }
//    }
}




// 跳转到指定视图控制器
- (void)jumptoViewController:(UIViewController *)vc
{
    MCNavigationController *nav = (MCNavigationController *)self.selectedViewController;
    
    if (nav.topViewController.presentedViewController) {
        
        MCNavigationController *nav1 = (MCNavigationController *)nav.topViewController.presentedViewController;
        [nav1 pushViewController:vc animated:YES];
        
    }else{
        
        [nav pushViewController:vc animated:YES];
        
    }
}

- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}

@end
