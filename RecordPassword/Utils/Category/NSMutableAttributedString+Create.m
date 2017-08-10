//
//  NSMutableAttributedString+Create.m
//  MyCommunity
//
//  Created by JosQiao on 2017/1/6.
//  Copyright © 2017年 WenJim. All rights reserved.
//

#import "NSMutableAttributedString+Create.h"

@implementation NSMutableAttributedString (Create)



+ (NSMutableAttributedString *)attributedStringWithStirng:(NSString *)string strWidth:(CGFloat)strWidth minHeight:(CGFloat)minHeight lineSpace:(CGFloat)lineSpace font:(UIFont *)font foregroundColor:(UIColor *)color
{
    // 先判断是否是一行
    CGFloat height = [self getHeight:string labelFont:font Width:strWidth];
    //CGFloat baselineOffset = 0.0f; // 基线偏移值，正值上偏
    
    if (height < (minHeight + minHeight/2.0)) {
        //baselineOffset = -1.0f;
        lineSpace = 0.0f;
    }
    
    
    return [self attributedStringWithStirng:string lineSpace:lineSpace font:font foregroundColor:color];
    
    
    
}


+ (NSMutableAttributedString *)attributedStringWithStirng:(NSString *)string lineSpace:(CGFloat)lineSpace font:(UIFont *)font foregroundColor:(UIColor *)color
{
    
    NSMutableAttributedString *attriIndroduce = [[NSMutableAttributedString alloc] initWithString:string];
    
    /*
     NSLineBreakByWordWrapping = 0,     	// Wrap at word boundaries, default
     NSLineBreakByCharWrapping,		// Wrap at character boundaries
     NSLineBreakByClipping,		// Simply clip
     NSLineBreakByTruncatingHead,	// Truncate at head of line: "...wxyz"
     NSLineBreakByTruncatingTail,	// Truncate at tail of line: "abcd..."
     NSLineBreakByTruncatingMiddle
     */
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [attriIndroduce setAttributes:@{
                                    NSParagraphStyleAttributeName :style,
                                    NSFontAttributeName:font,
                                    NSForegroundColorAttributeName:color
                                    } range:NSMakeRange(0, string.length)];
    
    return attriIndroduce;
}

+ (NSMutableAttributedString *)attributedStringWithStirng:(NSString *)string lineSpace:(CGFloat)lineSpace font:(UIFont *)font foregroundColor:(UIColor *)color baselineOffset:(CGFloat)lineOffset
{
    
    NSMutableAttributedString *attriIndroduce = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    
    [attriIndroduce setAttributes:@{
                                    NSParagraphStyleAttributeName :style,
                                    NSFontAttributeName:font,
                                    NSForegroundColorAttributeName:color,
                                    NSBaselineOffsetAttributeName:@(lineSpace)
                                    } range:NSMakeRange(0, string.length)];
    
    return attriIndroduce;
}




+ (CGFloat)getHeight:(NSString *)str labelFont:(UIFont *)font Width:(float)width
{
    
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    
    
    
    CGSize actualSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    
    return actualSize.height;
    
    
    
    
    
}

+ (CGFloat)getHeigt:(NSString *)str WithlabelFont:(UIFont *)font lineSpace:(CGFloat)lineSpace Width:(CGFloat)width{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    
    CGSize size = CGSizeMake(width, MAXFLOAT);
    
    NSDictionary *tdic = @{
                           NSFontAttributeName:font,
                           NSParagraphStyleAttributeName:style
                           
                           };
    
    
    //    [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil];
    
    
    
    CGSize actualSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
    
    return actualSize.height;
}

@end
