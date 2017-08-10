//
//  JhTabbar.m
//  MyCommunity
//
//  Created by Junheng on 2016/11/30.
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import "JhTabbar.h"

@interface JhTabbar()

@property (strong, nonatomic) UIButton *mineButton;


@end

@implementation JhTabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{

    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        //改变UITabBarController的背景颜色
//        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
//        bgView.backgroundColor = [UIColor whiteColor];
        
        
        //    [UIColor colorWithRed:1 green:0.98 blue:0.98 alpha:1];
//        [self insertSubview:bgView atIndex:0];
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.barTintColor = [UIColor whiteColor];
        
        [[UITabBar appearance] setBarTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
        
    
        
        UIButton *mineBtn = [[UIButton alloc]init];
//
        mineBtn.backgroundColor = [UIColor clearColor];

        [mineBtn addTarget:self action:@selector(clickMineModule:) forControlEvents:UIControlEventTouchUpInside];
        

        
        
        self.mineButton = mineBtn;
        
        
        
        
        
    }
   
    return self;
}

- (void)clickMineModule:(UIButton *)btn{


    if (_jh_TabbarDelegate && [_jh_TabbarDelegate respondsToSelector:@selector(mineButtonDidClick)]) {
        
        
        [_jh_TabbarDelegate mineButtonDidClick];
        
        
    }
   
    
    


}
- (void)layoutSubviews{


    [super layoutSubviews];
    
    
//    DLog(@"%@",self.subviews);
    
//    CGFloat buttonY = 0;
//    CGFloat buttonW = self.width/3;
//    CGFloat buttonH = self.height;
//    
//    
//    //将透明的按钮frame设置为 第三个UITabBarButton的frame
    
    CGRect buttonFrame = CGRectMake(0, 0, 0, 0);
    
    
    for (UIView *button in self.subviews) {
        
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        
        
        buttonFrame = button.frame;
        
        
        
        
        
    }
    
    self.mineButton.frame = buttonFrame;
    
    
    [self addSubview:self.mineButton];
    



}
@end
