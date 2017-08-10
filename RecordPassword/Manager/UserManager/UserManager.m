//
//  UserManager.m
//  ChokLife
//
//  Created by Junheng on 2017/7/18.
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import "UserManager.h"

#define USERLABEL   @"userLabel"

#define USERINFO    @"userInfo"

#define WECHATCODE  @"weChatCode"



#import "sys/utsname.h"
//#import "FriendInfo.h"
//#import "AudioSurveyModel.h"

static NSString *const SHOWMESSAGESUMMARY = @"showMessageSummary";

static NSString *const PLAYSOUND          = @"playSound";

static NSString *const PLAYVIBRATION      = @"playVibration";


static NSString *const arc4randomStr      = @"arc4randomStr";

static NSString *const ISLOGIN            = @"isLogin";


static NSString *const BOOTTIME           = @"BootTime";

static NSString *const WEIXINLOGIN         = @"weixinLogin";

static NSString *const AUDIOSURVEYMODEL    = @"audioSurveyModel";

static NSString *const ISMINEMODULECLICK    = @"isMineModuleClick";


static NSString *kIsReViewing  = @"kIsReViewing";

@implementation UserManager

+ (BOOL)isWeChatLogin{
    
    NSNumber *userDic = [[NSUserDefaults standardUserDefaults]objectForKey:WEIXINLOGIN];
    
    if (!userDic) {
        
        
        return NO;
    }else{
        
        
        
        return [userDic boolValue];
        
        
    }
    
    
    
    
}


+ (void)recordWeChatLogin:(BOOL)isWLogin{
    
    
    
    
    [kUserDefaults setObject:[NSNumber numberWithBool:isWLogin] forKey:WEIXINLOGIN];
    
    
    [kUserDefaults synchronize];
    
    
    
}

+ (void)SaveWeChatCode:(NSString *)WeChatCode
{

    [kUserDefaults setObject:WeChatCode forKey:WECHATCODE];
    
    [kUserDefaults synchronize];
    
    
}

+ (NSString *)GetWeChatCode
{
    
    NSString *weChatCodeStr = [kUserDefaults objectForKey:WECHATCODE];
    
    
    return weChatCodeStr;
    
    
    
}



+ (NSDictionary *)GetUserInfo
{
    
    
    NSDictionary *userDic = [kUserDefaults objectForKey:USERINFO];
    
    
    return userDic;
    
}

+ (void)SaveUserInfo:(NSDictionary *)userInfoDic
{
    
    
    [kUserDefaults setObject:userInfoDic forKey:USERINFO];
    
    [kUserDefaults synchronize];

}

+ (void)saveLoginUserData:(FriendData *)loginUserData{
    
    
//    //还是采用NSUserDefaults 存 model进来  通过MJExtension转换
//    
//    //取得时候先取model 在通过.语法获取
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    //模型转字典
//    
//    NSDictionary *modelDic = loginUserData.keyValues;
//    
//    //通过NSUserDefaults存进去
//    
//    
//    [defaults setObject:modelDic forKey:USERINFO];
//    
//    [defaults synchronize];
    
    
    
}

//+ (FriendData *)getLoginUserData{
//    
////    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
////    
////    NSDictionary *loginUserDicInfo = [defaults objectForKey:USERINFO];
////    
////    
////    //字典转模型
////    FriendData *loginUserData = [FriendData objectWithKeyValues:loginUserDicInfo];
////    
////    
////    return loginUserData;
//    
//    
//}


+ (NSMutableArray *)GetUserLabel
{
    
    NSMutableArray *UserLabelArr = [[NSUserDefaults standardUserDefaults]objectForKey:USERLABEL];
    
    return UserLabelArr;
    
    
}


+ (void)SaveUserLabel:(NSMutableArray *)userLabelArr
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:userLabelArr forKey:USERLABEL];
    
    [defaults synchronize];
    
    
    
    
    
    
}


+ (void)ClearUserInfo
{
    
    NSDictionary *removeDic = [NSDictionary dictionary];
    NSArray *labelArray = [NSArray array];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:removeDic forKey:USERINFO];
    
    [defaults setObject:labelArray forKey:USERLABEL];
    
    [defaults synchronize];
    
    
    
}

+ (BOOL)isLogin
{
    NSNumber *number = [[NSUserDefaults standardUserDefaults]objectForKey:ISLOGIN];
    
    
    if ([number boolValue] == YES) {
        
        return YES;
        
    }else
    {
        
        return NO;
        
    }

    
}


+ (void)logout
{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:ISLOGIN];
    
    
    [defaults synchronize];
    
    
}


+ (void)login
{
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:[NSNumber numberWithBool:YES] forKey:ISLOGIN];
    
    
    [defaults synchronize];
    
    
    
}







+ (BOOL)isSoundPlayOpened
{
    
    
    NSNumber *number = [[NSUserDefaults standardUserDefaults]objectForKey:PLAYSOUND];
    
    
    
    if ([number boolValue] == YES) {
        
        
        return YES;
    }else
    {
        
        return NO;
        
        
    }
    
    
    
}


+ (void)setPlaySound:(BOOL)isPlay
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:[NSNumber numberWithBool:isPlay] forKey:PLAYSOUND];
    
    [defaults synchronize];
    
    
    
}
+ (BOOL)isVibrationPlayOpened
{
    
    
    
    NSNumber *number = [[NSUserDefaults standardUserDefaults]objectForKey:PLAYVIBRATION];
    
    
    
    if ([number boolValue] == YES) {
        
        
        return YES;
    }else
    {
        
        return NO;
        
        
    }
    
    
}


+ (void)setPlayVibration:(BOOL)isPlay
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:[NSNumber numberWithBool:isPlay] forKey:PLAYVIBRATION];
    
    [defaults synchronize];
    
    
}



+ (NSString *)ret32bitString
{
    
    
    char data[32];
    
    
    for (int x = 0; x<32; data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    return [[NSString alloc]initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
    
    
    
    
    
}

+ (void)recordArc4RandomStr:(NSString *)str
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:str forKey:arc4randomStr];
    
    [defaults synchronize];
    
    
    
    
    
}

+ (NSString *)GetArc4randomStr
{
    
    NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:arc4randomStr];
    
    
    return str;
    
    
    
}


+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    return platform;
}



+ (void)recordBootTime
{
    
    
    /**
     *  记录应用启动时的系统时间 保存到本地
     */
    NSDate *senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYYMMdd"];
    
    NSString *locationString=[dateformatter stringFromDate:senddate];
    
    
    // 20160218
    //    DLog(@"locationString:%@",locationString);
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:locationString forKey:BOOTTIME];
    
    [defaults synchronize];
    
    
    
}

+ (BOOL)isEmptyBootTime
{
    
    
    
    NSString *bootTime = [[NSUserDefaults standardUserDefaults]objectForKey:BOOTTIME];
    
    
    
    if (bootTime == nil) {
        
        
        return YES;
    }else
    {
        
        return NO;
        
        
    }
    
    
}


+ (NSString *)getBootTime
{
    
    NSString *bootTime = [[NSUserDefaults standardUserDefaults]objectForKey:BOOTTIME];
    
    
    return bootTime;
    
}



//+ (void)saveAudioSurveyInfoData:(AudioSurveyModel *)audioSurveyModel
//{
//    //还是采用NSUserDefaults 存 model进来  通过MJExtension转换
//    
//    //取得时候先取model 在通过.语法获取
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    //模型转字典
//    
//    NSDictionary *modelDic = audioSurveyModel.keyValues;
//    
//    //通过NSUserDefaults存进去
//    
//    NSMutableArray *audioSurveyArr = [self GetAudioSurveyInfo];
//    [audioSurveyArr addObject:modelDic];
//    
//    [defaults setObject:audioSurveyArr forKey:AUDIOSURVEYMODEL];
//    
//    [defaults synchronize];
//}

+ (NSMutableArray *)GetAudioSurveyInfo
{
    NSMutableArray *audioSurveyArr = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:AUDIOSURVEYMODEL]];
    
    return audioSurveyArr;
}

+ (void)removeAllAudioSurveyInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //模型转字典
    
    [defaults removeObjectForKey:AUDIOSURVEYMODEL];
    
    [defaults synchronize];
}



+ (void)requestAudioSurveyInfo
{
    
    
//    NSArray *dataArr = [self GetAudioSurveyInfo];
//    
//    if (!dataArr || dataArr.count == 0 ) {
//        return;
//    }
//    
//    NSString *dataStr = [@{@"data":[self GetAudioSurveyInfo]}  JSONString];
//    
//    NSDictionary *dic = @{@"data":dataStr};
//    
//    [MCHttpTool requestPOSTWithURL:@"broadcast/re" WithParameter:dic success:^(id responseObject) {
//        
//        DLog(@"respons = %@",responseObject);
//        
//        if ([responseObject[@"code"] integerValue] == 1) {
//            
//            // 上传数据成果，删除以前的
//            [MCuserInfoTool removeAllAudioSurveyInfo];
//        }
//        
//    } failure:^(NSError *error) {
//        
//        DLog(@"error = %@",error);
//    }];
    
}

+ (void)recordMineButtonItemClickWithIsClick:(BOOL)isClick{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:[NSNumber numberWithBool:isClick] forKey:ISMINEMODULECLICK];
    
    [defaults synchronize];
    
    
}

+ (BOOL)isMineButtomItemClick{
    
    
    NSNumber *userDic = [[NSUserDefaults standardUserDefaults]objectForKey:ISMINEMODULECLICK];
    
    if (!userDic) {
        
        
        return NO;
    }else{
        
        
        return [userDic boolValue];
        
    }
    
}





+ (void)setReviewing:(BOOL)isReviewing{
    
    [kUserDefaults setObject:[NSString stringWithFormat:@"%d",isReviewing] forKey:kIsReViewing];
    
}

+ (BOOL)isReViewing{
    
    
    NSString *isVip = [kUserDefaults objectForKey:kIsReViewing];
    
    return [isVip boolValue];
    
    
}


@end
