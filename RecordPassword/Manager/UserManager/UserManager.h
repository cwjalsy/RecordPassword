//
//  UserManager.h
//  ChokLife
//
//  Created by Junheng on 2017/7/18.
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FriendData;

@interface UserManager : NSObject

/**
 *  获取用户信息
 *
 *  @return 保存用户信息的字典
 */
+ (NSDictionary *)GetUserInfo;


/**
 *  获取登录用户信息
 *
 *  @return 保存用户信息的模型
 */
+ (FriendData *)getLoginUserData;


/**
 *  保存用户信息
 *
 *  @param userInfoDic 用户信息字典
 */
+ (void)SaveUserInfo:(NSDictionary *)userInfoDic;


/**
 *  保存用户信息
 *
 *  @param loginUserData 用户信息模型
 */
+ (void)saveLoginUserData:(FriendData *)loginUserData;



/**
 *  获取用户标签
 *
 *  @return 用户标签数组
 */
+ (NSMutableArray *)GetUserLabel;


/**
 *  保存用户标签
 *
 *  @param userLabelArr 需要保存的用户标签数组
 */
+ (void)SaveUserLabel:(NSMutableArray *)userLabelArr;


/**
 *  清除用户信息
 */
+ (void)ClearUserInfo;




/**
 *  是否登录
 *
 *  @return YES / NO
 */
+ (BOOL)isLogin;


/**
 *  退出登陆
 */
+ (void)logout;


/**
 *  登陆
 */
+ (void)login;


/**
 *  接受消息时是否播放声音
 *
 *  @return YES 播放  NO 静音
 */
+ (BOOL)isSoundPlayOpened;


/**
 *  接受消息时是否震动
 *
 *  @return YES 震动 NO 不震动
 */
+ (BOOL)isVibrationPlayOpened;


/**
 *  设置是否打开声音
 */
+ (void)setPlaySound:(BOOL)isPlay;


/**
 *  设置是否打开震动
 */
+ (void)setPlayVibration:(BOOL)isPlay;


//记录随机字符串
+ (void)recordArc4RandomStr:(NSString *)str;



//生成随机的32位字符串
+ (NSString *)ret32bitString;

//获得存好的随机字符串
+ (NSString *)GetArc4randomStr;

//获得设备型号名称
+ (NSString*)deviceString;



/**
 *  记录启动时间
 *
 *  @param bootTime 启动时间 e.g. 20160218
 */
+ (void)recordBootTime;


/**
 *  判断本地是否有关于启动时间的记录
 *
 *  @return return value description
 */
+ (BOOL)isEmptyBootTime;


/**
 *  获取保存的日期变量
 *
 *  @return 保存的日期变量
 */
+ (NSString *)getBootTime;


+ (BOOL)isWeChatLogin;


+ (void)recordWeChatLogin:(BOOL)isWLogin;

// 获取微信登录的Code
+ (NSString *)GetWeChatCode;
// 保存微信登录时的Code
+ (void)SaveWeChatCode:(NSString *)WeChatCode;

/**
 * 音频数据调查
 *
 */



/**
 *  提交音频播放信息到服务器
 *
 */

+ (void)requestAudioSurveyInfo;


/**
 *  保存音频播放信息
 *
 *  @param loginUserData 音频播放信息模型
 */
//+ (void)saveAudioSurveyInfoData:(AudioSurveyModel *)audioSurveyModel;


/**
 *  获取音频数据
 *
 *  @return 音频数据数组
 */
+ (NSMutableArray *)GetAudioSurveyInfo;

/**
 *  清除音频数据
 *
 */
+ (void)removeAllAudioSurveyInfo;

+ (void)recordMineButtonItemClickWithIsClick:(BOOL)isClick;

+ (BOOL)isMineButtomItemClick;





/**
 是否正在审核中
 
 @return YES 在审核中  NO 不在审核中
 */
+ (BOOL)isReViewing;


/**
 记录审核状态
 
 @param isReviewing YES 在审核中  NO 不在审核中
 */
+ (void)setReviewing:(BOOL)isReviewing;
@end
