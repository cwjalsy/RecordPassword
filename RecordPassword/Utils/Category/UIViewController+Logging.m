//
//  UIViewController+Logging.m
//  MyCommunity
//
//  Created by Junheng on 16/3/1.
//  Base on Tof Templates
//  Copyright © 2016年 WenJim. All rights reserved.
//



#import "UIViewController+Logging.h"
#import <objc/runtime.h>


#pragma mark -
#pragma mark Category Logging for UIViewController 
#pragma mark -

@implementation UIViewController (Logging)


//+ (void)load{
//
//    
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        
//        swizzleMethod(class, @selector(viewDidLoad), @selector(swizzled_viewDidLoad));
//        swizzleMethod(class, @selector(viewWillAppear:), @selector(swizzled_viewWillAppear:));
//        swizzleMethod(class, @selector(viewWillDisappear:), @selector(swizzled_viewWillDisappear:));
//        
//        
//    });
//
//    
//    
//
//}

- (void)swizzled_viewDidLoad{


    
    [self swizzled_viewDidLoad];

  
#ifndef DEBUG
        
        
//        [MCTools logslogin];
    
#endif

    


}

- (void)swizzled_viewWillAppear:(BOOL)animated{

    
    [self swizzled_viewWillAppear:animated];
    
   
        
#ifndef DEBUG
        
        
//        [MobClick beginLogPageView:NSStringFromClass([self class])];
    
#endif
        
    
}

- (void)swizzled_viewWillDisappear:(BOOL)animated{

    [self swizzled_viewWillDisappear:animated];
    
    
        
#ifndef DEBUG
        
        
//         [MobClick endLogPageView:NSStringFromClass([self class])];
    
#endif
        
    

}


 void swizzleMethod(Class class,SEL originalSelector, SEL swizzledSelector){

     Method originalMethod = class_getInstanceMethod(class, originalSelector);
     
     Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
     
     
     
     BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
     
     if (didAddMethod) {
         
         
         class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
         
     }else{
     
     
         method_exchangeImplementations(originalMethod, swizzledMethod);
         
         
     
     
     }
     
     
     
    
    

}
@end
