//
//  UIImage+image.h
//  MyCommunity
//
//  Created by wenjim on 15/10/12.
//  Copyright (c) 2015年 WenJim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

+(instancetype)imageOriginallyWithName:(NSString *)imageName;



- (UIImage *)imageWithRoundedCornerRadius:(CGFloat)radius;

- (UIImage *)jh_imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius;

@end
