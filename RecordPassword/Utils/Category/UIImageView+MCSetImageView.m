//
//  UIImageView+MCSetImageView.m
//  MyCommunity
//
//  Created by Junheng on 15/10/27.
//  Copyright © 2015年 WenJim. All rights reserved.
//

#import "UIImageView+MCSetImageView.h"

@implementation UIImageView (MCSetImageView)


- (void)MCSetImageWithUrl:(NSString *)URLStr placeHolderImage:(UIImage *)placeHolderImage WithAnimated:(BOOL)animated{


    if (animated) {
        
        
        
        
        [self sd_setImageWithURL:[NSURL URLWithString:URLStr] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            
            self.alpha = 0.0;
            [UIView animateWithDuration:0.3 animations:^{
                self.alpha = 1.0;
                
            } completion:^(BOOL finished) {
                
                
            }];
            
            
        }];
    }else{
    
        [self sd_setImageWithURL:[NSURL URLWithString:URLStr] placeholderImage:placeHolderImage];
        
     
    
    
    }


}
- (void)MCSetImageWithUrl:(NSString *)URLStr placeHolderImage:(UIImage *)placeHolderImage
{


    
        
      self.alpha = 0.0;

    
    [self sd_setImageWithURL:[NSURL URLWithString:URLStr] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
       
        
        
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1.0;
            
        } completion:^(BOOL finished) {
            
            
        }];
        
    
    }];

}


- (void)MCSetImageWithUrl:(NSString *)URLStr placeholderImage:(UIImage *)placeHolderImage completed:(void (^)(UIImage *, NSURL *))completedBlock
{


    [self sd_setImageWithURL:[NSURL URLWithString:URLStr] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
              if (completedBlock) {
        
        
                  completedBlock(image,imageURL);
        
                  
              }
              
              
          }];




}


- (void)MCSetImageWithUrl:(NSString *)URLStr placeholderImage:(UIImage *)placeHolderImage options:(SDWebImageOptions)loadOptions progress:(void (^)(NSInteger, NSInteger))progressBlock complete:(void (^)(UIImage *, NSError *, SDImageCacheType, NSURL *))completedBlock
{


    
    [self sd_setImageWithURL:[NSURL URLWithString:URLStr] placeholderImage:placeHolderImage options:loadOptions progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        if (progressBlock) {
            
            
            
            progressBlock(receivedSize,expectedSize);
        }
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        
        
        if (completedBlock) {
            
            
            completedBlock(image,error,cacheType,imageURL);
            
        }
    }];
    


}


@end
