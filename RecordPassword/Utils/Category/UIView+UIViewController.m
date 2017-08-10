//
//  UIView+UIViewController.m
//  XiaoShi
//
//  Created by Junheng on 15/7/11.
//  Copyright (c) 2015年 CG. All rights reserved.
//

#import "UIView+UIViewController.h"

@implementation UIView (UIViewController)

- (UIViewController *)ViewController
{
    UIResponder *next = [self nextResponder];
    
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
}

@end
