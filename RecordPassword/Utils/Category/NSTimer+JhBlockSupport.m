//
//  NSTimer+JhBlockSupport.m
//  MyCommunity
//
//  Created by Junheng on 16/9/13.
//  Base on Tof Templates
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import "NSTimer+JhBlockSupport.h"

#pragma mark -
#pragma mark Category JhBlockSupport for NSTimer 
#pragma mark -

@implementation NSTimer (JhBlockSupport)



+ (NSTimer *)jh_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)())block repeats:(BOOL)repeats
{


    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(jh_blockInvoke:) userInfo:[block copy] repeats:repeats];
    
    
    

  

}


+ (void)jh_blockInvoke:(NSTimer *)timer{

   
    void (^block)() = timer.userInfo;
    
    if (block) {
        
        
        block();
        
    }
}

@end
