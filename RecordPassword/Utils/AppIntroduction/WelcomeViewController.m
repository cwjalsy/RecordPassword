//
//  WelcomeViewController.m
//  MyCommunity
//
//  Created by Junheng on 15/9/20.
//  Copyright © 2015年 XiaoNingLe. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MCTabBarViewController.h"

#import "CoreLaunchLite.h"

//#import "IndicatorViewController.h"
#import "MCNavigationController.h"


@interface WelcomeViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
//    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.contentSize = CGSizeMake(KScreenWidth*5, KScreenHeight);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    
    NSArray *imageArr_4 = @[
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory1_iPhone4" ofType:@"png"]],
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory2_iPhone4" ofType:@"png"]],
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory3_iPhone4" ofType:@"png"]],
                            
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory4_iPhone4" ofType:@"png"]],
                            
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone4" ofType:@"png"]],
                            
                            ];
    

    NSArray *imageArr_5 = @[
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory1_iPhone5s" ofType:@"png"]],
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory2_iPhone5s" ofType:@"png"]],
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory3_iPhone5s" ofType:@"png"]],
                            
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory4_iPhone5s" ofType:@"png"]],
                            
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone5s" ofType:@"png"]],
                            
                            ];
    
   NSArray *imageArr_6 = @[
                   [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory1_iPhone6" ofType:@"png"]],
                    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory2_iPhone6" ofType:@"png"]],
                    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory3_iPhone6" ofType:@"png"]],
                         
                    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory4_iPhone6" ofType:@"png"]],
                   
                    [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone6" ofType:@"png"]],
                         ];
    
    NSArray *imageArr_6plus = @[
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory1_iPhone6plus" ofType:@"png"]],
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory2_iPhone6plus" ofType:@"png"]],
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory3_iPhone6plus" ofType:@"png"]],
                            
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory4_iPhone6plus" ofType:@"png"]],
                            
                            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone6plus" ofType:@"png"]],
                            
                            ];

    
    
    [self.view addSubview:_scrollView];
    
    
    
    
    for (int i= 0; i<5; i++) {
        
        
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth * i, 0, KScreenWidth, KScreenHeight)];
        
        if (FOURSSCREEN) {
            
            imageView.image = imageArr_4[i];
            
            
        }else if (FIVESCREEN){
            
            imageView.image = imageArr_5[i];
            
            
        }else if (SIXSCREEN){
            
           imageView.image = imageArr_6[i];
            
        }else
        {
            
            imageView.image = imageArr_6plus[i];
            
            
            
        }

        
        //        imageView.contentMode =   UIViewContentModeScaleAspectFit;
        //        imageView.clipsToBounds = YES;
        
      
        
        
        
        
        if (i == 4) {
            
            
            
            imageView.userInteractionEnabled = YES;
            
            
            UIButton *showbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, KScreenHeight-200, KScreenWidth, 200)];
            
            showbtn.centerX = self.view.centerX;
            
            showbtn.backgroundColor = [UIColor clearColor];
            
            [showbtn addTarget:self action:@selector(GotoMainVc:) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:showbtn];
            
            
            
            
        }
        
        
        [_scrollView addSubview:imageView];
        
    }
    

    
    
    
}


- (void)GotoMainVc:(UIButton *)bt
{

    
    //FIXME: 记录第一次运行是否成功应该放在登录成功或者注册成功
     [AppManager recordFirstRunning]; //记录第一次运行
    
    
    //游客模式 直接进去主界面
      
//        IndicatorViewController *indicator = [[IndicatorViewController alloc]init];
    
    MCTabBarViewController *tabVc = [[MCTabBarViewController alloc]init];
    
    
    
//        MCNavigationController *nav = [[MCNavigationController alloc]initWithRootViewController:tabVc];
    
    
        
        self.view.window.rootViewController = tabVc;
        
    
    
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        
        
        if (FOURSSCREEN) {
            
            [CoreLaunchLite animationWithWindow:tabVc.view.window image: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone4" ofType:@"png"]]];
            
            
        }else if (FIVESCREEN){
            
            [CoreLaunchLite animationWithWindow:tabVc.view.window image: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone5s" ofType:@"png"]]];
            
            
        }else if (SIXSCREEN){
            
            [CoreLaunchLite animationWithWindow:tabVc.view.window image: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone6" ofType:@"png"]]];
            
            
            
        }else
        {
            
            [CoreLaunchLite animationWithWindow:tabVc.view.window image: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"introductory5_iPhone6plus" ofType:@"png"]]];
            
            
        }

    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)prefersStatusBarHidden{


    return YES;
    

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
