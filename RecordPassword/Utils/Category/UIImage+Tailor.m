//
//  UIImage+Tailor.m
//  Quartz2DTestDemo
//
//  Created by JosQiao on 16/3/16.
//  Copyright © 2016年 QiaoShi. All rights reserved.
//

#import "UIImage+Tailor.h"

@implementation UIImage (Tailor)


+ (instancetype)imageWithNamed:(NSString *)name bordWidth:(CGFloat)bordWidth bordColor:(UIColor *)bordColor
{

    // 外圆的宽度
    CGFloat borderW = bordWidth;
    
    // 加载旧图片
    UIImage *oldImg = [UIImage imageNamed:name];
    
    // 新图片的尺寸
    CGFloat imgW = oldImg.size.width + 2 * borderW;
    CGFloat imgH = oldImg.size.height + 2 *borderW;
    
    // 设置新图片的尺寸
    CGFloat circirW = imgW > imgH ? imgH : imgW;
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circirW, circirW), NO, 0.0);
    
    // 画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circirW, circirW)];
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(ctx, path.CGPath);
    
    [bordColor set];
    CGContextDrawPath(ctx, kCGPathFill);
    
    // 画圆：正切与旧图片的园
    
    CGRect clipR = CGRectMake(borderW, borderW, oldImg.size.width, oldImg.size.height);
    
    UIBezierPath *clipPaht = [UIBezierPath bezierPathWithOvalInRect:clipR];
    
    // 设置裁剪区域
    [clipPaht addClip];
    
    // 画图片
    [oldImg drawAtPoint:CGPointMake(borderW, borderW)];
    
    // 获取新图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    return newImg;
}

+ (instancetype)imageCircularWithNamed:(NSString *)name
{
    @autoreleasepool {

        // 加载旧图片
        UIImage *oldImg = [UIImage imageNamed:name];
        // 开启上下文
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(oldImg.size.width, oldImg.size.height), YES, 0.0);
        
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, oldImg.size.width, oldImg.size.height)];
        
        [clipPath addClip];
        
        [oldImg drawAtPoint:CGPointMake(0, 0)];
        
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImg;

    }

}


+ (instancetype)imageWithCaptureView:(UIView *)captureView
{

    @autoreleasepool {
       
        UIGraphicsBeginImageContextWithOptions(captureView.bounds.size, YES, 0.0);
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();

        [captureView.layer renderInContext:ctx];
        captureView.layer.contents = nil;
    
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
                
        return newImg;
    }
}


+ (instancetype)cut_ImageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}


+ (UIImage *)handleImage:(UIImage *)originalImage withSize:(CGSize)size
{
    CGSize originalsize = [originalImage size];
    NSLog(@"改变前图片的宽度为%f,图片的高度为%f",originalsize.width,originalsize.height);
    
    //原图长宽均小于标准长宽的，不作处理返回原图
    if (originalsize.width<size.width && originalsize.height<size.height)
    {
        return originalImage;
    }
    
    //原图长宽均大于标准长宽的，按比例缩小至最大适应值
    else if(originalsize.width>size.width && originalsize.height>size.height)
    {
        CGFloat rate = 1.0;
        CGFloat widthRate = originalsize.width/size.width;
        CGFloat heightRate = originalsize.height/size.height;
        
        rate = widthRate>heightRate?heightRate:widthRate;
        
        CGImageRef imageRef = nil;
        
        if (heightRate>widthRate)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height*rate/2, originalsize.width, size.height*rate));//获取图片整体部分
        }
        else
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width*rate/2, 0, size.width*rate, originalsize.height));//获取图片整体部分
        }
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
        NSLog(@"改变后图片的宽度为%f,图片的高度为%f",[standardImage size].width,[standardImage size].height);
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    }
    
    //原图长宽有一项大于标准长宽的，对大于标准的那一项进行裁剪，另一项保持不变
    else if(originalsize.height>size.height || originalsize.width>size.width)
    {
        CGImageRef imageRef = nil;
        
        if(originalsize.height>size.height)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(0, originalsize.height/2-size.height/2, originalsize.width, size.height));//获取图片整体部分
        }
        else if (originalsize.width>size.width)
        {
            imageRef = CGImageCreateWithImageInRect([originalImage CGImage], CGRectMake(originalsize.width/2-size.width/2, 0, size.width, originalsize.height));//获取图片整体部分
        }
        
        UIGraphicsBeginImageContext(size);//指定要绘画图片的大小
        CGContextRef con = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(con, 0.0, size.height);
        CGContextScaleCTM(con, 1.0, -1.0);
        
        CGContextDrawImage(con, CGRectMake(0, 0, size.width, size.height), imageRef);
        
        UIImage *standardImage = UIGraphicsGetImageFromCurrentImageContext();
        NSLog(@"改变后图片的宽度为%f,图片的高度为%f",[standardImage size].width,[standardImage size].height);
        
        UIGraphicsEndImageContext();
        CGImageRelease(imageRef);
        
        return standardImage;
    }
    
    //原图为标准长宽的，不做处理
    else
    {
        return originalImage;
    }
}
@end
