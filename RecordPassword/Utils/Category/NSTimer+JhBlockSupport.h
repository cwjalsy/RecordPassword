//
//  NSTimer+JhBlockSupport.h
//  MyCommunity
//
//  Created by Junheng on 16/9/13.
//  Base on Tof Templates
//  Copyright © 2016年 WenJim. All rights reserved.

//

#import <Foundation/Foundation.h>

#pragma mark -
#pragma mark Category JhBlockSupport for NSTimer 
#pragma mark -

@interface NSTimer (JhBlockSupport)






//计时器现在的target是计时器（NSTimer）类对象，这是个单例，因此计时器是否会保留它，其实都无所谓。此处依然有保留环（循环引用），然而因为类对class object）无须回收，所以不用担心。 这段代码将计时器所应执行的任务封装成“块”,在调用计时器函数时，把它作为userInfo参数传进去,该参数可以用来存放“不透明值”,只要计时器还有效，就会一直保存它。传入参数时要通过copy方法将block拷贝到“堆”上，否则等到稍后要执行它的时候，该块可能已经无效了。

+ (NSTimer *)jh_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;

@end
