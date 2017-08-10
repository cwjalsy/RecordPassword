//
//  UIImage+image.m
//  MyCommunity
//
//  Created by wenjim on 15/10/12.
//  Copyright (c) 2015年 WenJim. All rights reserved.
//

#import "UIImage+image.h"


@implementation UIImage (image)

+(instancetype)imageOriginallyWithName:(NSString *)imageName
{
    UIImage *image =[UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


- (UIImage *)imageWithRoundedCornerRadius:(CGFloat)radius{

    CGRect rect = (CGRect){0.f, 0.f, self.size};
    
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, UIScreen.mainScreen.scale);
    
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();

    
    UIGraphicsEndImageContext();

    return output;
    
}

- (UIImage *)jh_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}

@end
