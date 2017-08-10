//
//  UIButton+Extension.m
//  MyCommunity
//
//  Created by Junheng on 16/1/25.
//  Base on Tof Templates
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>
#pragma mark -
#pragma mark Category Extension for UIButton 
#pragma mark -

@implementation UIButton (Extension)

/*
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

*/
/*
- (void) setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect) enlargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
    {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    }
    else
    {
        return self.bounds;
    }
}
 
*/

/*
- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}
*/


- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainCoclor:(UIColor *)mColor countColor:(UIColor *)color
{
    
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            int seconds = timeOut % 60;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
    
    
    
    
}



+ (instancetype)setImageUpTitleBottomButtonWithImage:(UIImage *)image placeTitle:(NSString *)title Frame:(CGRect)frame
{



    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    button.frame = frame;
    
//     button.frame = CGRectMake(100, 100,90, 90);//button的frame
    //    在UIButton中有三个对EdgeInsets的设置：ContentEdgeInsets、titleEdgeInsets、imageEdgeInsets
//    [button setImage:image forState:UIControlStateNormal];//给button添加image
    button.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,button.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
    
//    [button setTitle:title forState:UIControlStateNormal];//设置button的title
    button.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    button.titleEdgeInsets = UIEdgeInsetsMake(71, -button.titleLabel.bounds.size.width-50, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
    
    //    [button setContentEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];//
    
    
    //   button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//设置button的内容横向居中。。设置content是title和image一起变化
    
    
    
    return button;


}


+ (instancetype)buttonWithTarget:(id)target action:(SEL)action img:(NSString *)img highImg:(NSString *)highImg
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    UIImage *normalImg = [UIImage imageNamed:img];
    button.frame = CGRectMake(0, 0, normalImg.size.width, normalImg.size.height);
    
    [button setImage:normalImg forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:highImg] forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}




@end
