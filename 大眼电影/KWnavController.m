//
//  KWnavController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWnavController.h"
#import "UIImage+Extension.h"

@interface KWnavController ()

@end

@implementation KWnavController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
+(void)initialize{
    UINavigationBar *nav=[UINavigationBar appearance];
 //   [nav setBackgroundColor:[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0]];
       
    
 [nav setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
  //[[nav setBackgroundColor:[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0]]forBarMetrics:UIBarMetricsDefault];
 //   [nav setTintColor:[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0]];
    NSMutableDictionary *md=[[NSMutableDictionary alloc]init];
    md[NSForegroundColorAttributeName]=[UIColor whiteColor];
    [nav setTitleTextAttributes:md];
    
}


/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航栏按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_cell_leftArrow_disabled" target:self action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"icon_share" target:self action:@selector(share)];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)share{
    
}

-(void)back{
    [self popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden=NO;
//    UINavigationBar *nav=[UINavigationBar appearance];
//    [nav setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
