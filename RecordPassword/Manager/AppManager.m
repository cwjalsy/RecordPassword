//
//  AppManager.m
//  ChokLife
//
//  Created by Junheng on 2017/7/19.
//  Copyright © 2017年 xiaoningle. All rights reserved.
//

#import "AppManager.h"
#import "YYFPSLabel.h"

static NSString *const FirstRuning = @"FirstRuning";


@implementation AppManager


+ (BOOL)isFirstRunning
{
    
    NSNumber *number = [kUserDefaults objectForKey:FirstRuning];
    
    
    
    if ([number boolValue] == YES) {
        
        
        return NO;
    }else
    {
        
        return YES;
        
        
    }
}

+ (void)recordFirstRunning
{
    
    
    [kUserDefaults setObject:[NSNumber numberWithBool:YES] forKey:FirstRuning];
    
    [kUserDefaults synchronize];
    
  
    
}

#pragma mark ————— FPS 监测 —————
+(void)showFPS{
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = KScreenHeight - 55;
    _fpsLabel.right = KScreenWidth - 10;
    //    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
}




@end
