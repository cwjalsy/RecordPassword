//
//  UIImage+Tailor.h
//  Quartz2DTestDemo
//
//  Created by JosQiao on 16/3/16.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tailor)


/**
 *  裁剪一个带圆环的图片
 *
 *  @param name      图片名称
 *  @param bordWidth 圆环宽度
 *  @param bordColor 圆环颜色
 *
 *  @return 圆环图片
 */
+ (instancetype)imageWithNamed:(NSString *)name bordWidth:(CGFloat)bordWidth bordColor:(UIColor *)bordColor;

/**
 *  圆形图片
 *
 *  @param name 图片名称
 *
 *  @return 圆形图片
 */
+ (instancetype)imageCircularWithNamed:(NSString *)name;


/**
 *  获取一个view的图片
 *
 *  @param captureView 当前View
 *
 *  @return view图片
 */
+ (instancetype)imageWithCaptureView:(UIView *)captureView;

+ (instancetype)cut_ImageFromImage:(UIImage *)image inRect:(CGRect)rect;


+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size;

@end
