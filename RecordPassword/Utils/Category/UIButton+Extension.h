//
//  UIButton+Extension.h
//  MyCommunity
//
//  Created by Junheng on 16/1/25.
//  Base on Tof Templates
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark -
#pragma mark Category Extension for UIButton 
#pragma mark -

@interface UIButton (Extension)


- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainCoclor:(UIColor *)mColor countColor:(UIColor *)color;



/**
 *  设置图片在上，文字在下的Button
 *
 *  @param image 图片 UIImage
 *  @param title 文字 NSString
 */
+ (instancetype)setImageUpTitleBottomButtonWithImage:(UIImage *)image placeTitle:(NSString *)title Frame:(CGRect)frame;



/**
 * 快捷创建按钮
 */
+ (instancetype)buttonWithTarget:(id)target action:(SEL)action img:(NSString *)img highImg:(NSString *)highImg;


/*
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
*/
@end
