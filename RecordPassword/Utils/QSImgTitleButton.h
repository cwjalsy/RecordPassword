//
//  QSImgTitleButton.h
//  MyCommunity
//
//  Created by JosQiao on 2016/12/23.
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSImgTitleButton : UIButton

/** 常态标题 */
@property (nonatomic ,copy) NSString *qsTitle;

+(instancetype)qsImgTitleButtionWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle normalImg:(NSString *)img selectedImg:(NSString *)selectedImg;

@end
