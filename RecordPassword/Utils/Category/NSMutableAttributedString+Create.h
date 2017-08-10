//
//  NSMutableAttributedString+Create.h
//  MyCommunity
//
//  Created by JosQiao on 2017/1/6.
//  Copyright © 2017年 WenJim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Create)


/** 
 * 创建一个 attributeStr： 宽度用来判断是不是只有一行，如果只有一行的内容，就设置行间距为0 
 */
+ (NSMutableAttributedString *)attributedStringWithStirng:(NSString *)string strWidth:(CGFloat)strWidth minHeight:(CGFloat)minHeight lineSpace:(CGFloat)lineSpace font:(UIFont *)font foregroundColor:(UIColor *)color;

@end
