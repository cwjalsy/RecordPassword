//
//  UIImageView+MCSetImageView.h
//  MyCommunity
//
//  Created by Junheng on 15/10/27.
//  Copyright © 2015年 WenJim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImageView+WebCache.h"

@interface UIImageView (MCSetImageView)



/**
 *  不带回调的异步加载图片
 *
 *  @param URLStr           要显示图片的URLStr
 *  @param placeHolderImage 占位图
 */
- (void)MCSetImageWithUrl:(NSString *)URLStr placeHolderImage:(UIImage *)placeHolderImage WithAnimated:(BOOL)animated;


/**
 *  带回调的异步加载图片
 *
 *  @param URLStr           要显示图片的URLStr
 *  @param placeHolderImage 占位图
 *  @param completedBlock   加载完的回调
 */
- (void)MCSetImageWithUrl:(NSString *)URLStr placeholderImage:(UIImage *)placeHolderImage completed:(void(^)(UIImage *image, NSURL *imageURL))completedBlock;





/**
 *  带回调的异步加载图片
 *
 *  @param URLStr           要显示图片的URLStr
 *  @param placeHolderImage 占位图
 *  @param loadOptions      加载图片选项
 *  @param progressBlock    图片加载进度回调
 *  @param completedBlock   图片加载完成时的回调
 */
- (void)MCSetImageWithUrl:(NSString *)URLStr placeholderImage:(UIImage *)placeHolderImage  options:(SDWebImageOptions)loadOptions progress:(void(^)(NSInteger receivedSize, NSInteger expectedSize))progressBlock complete:(void (^)(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL))completedBlock;








@end
