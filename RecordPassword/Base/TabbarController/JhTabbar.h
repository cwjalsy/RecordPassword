//
//  JhTabbar.h
//  MyCommunity
//
//  Created by Junheng on 2016/11/30.
//  Copyright © 2016年 WenJim. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JhTabbarDelegate <UITabBarDelegate>


- (void)mineButtonDidClick;

@end

@interface JhTabbar : UITabBar


@property (nonatomic,weak)id <JhTabbarDelegate>jh_TabbarDelegate;



@end
