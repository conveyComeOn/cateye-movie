//
//  videoViewController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/11.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "videoViewController.h"
#import "UIImage+Extension.h"

@interface videoViewController ()

@end

@implementation videoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0]] forBarMetrics:UIBarMetricsCompact] ;

    
   // self.view.frame=self.view.bounds;
   self.view.backgroundColor=[UIColor orangeColor];
    
   // self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"icon_cell_leftArrow_disabled" target:self action:@selector(back)];
    [self adddate];
    
    

//    [self settabbarstyle];
}

-(void)setStatus:(KWStatus *)status{
    UIWebView *webview=[[UIWebView alloc]init];
    webview.frame=CGRectMake(0, -64, KWWidth, self.view.bounds.size.height);
  //  webview.frame=self.view.bounds;
    
    self.title=status.videoName;
    NSLog(status.videourl);
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:status.videourl]];
    [webview loadRequest:request];
    
    
    [self.view addSubview:webview];
   
}
-(void)adddate{
    
}

-(void)settabbarstyle{
   // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
  //  UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
//    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:15];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
//    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    
//    // 设置高亮状态的文字属性
//    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
//    highTextAttrs[UITextAttributeTextColor] = [UIColor redColor];
//    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
//    
//    // 设置不可用状态(disable)的文字属性
//    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
//    disableTextAttrs[UITextAttributeTextColor] = [UIColor lightGrayColor];
//    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
   // [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
 
    
}







-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
    
    
    [UIView animateWithDuration:0.1 animations:^{
        self.tabBarController.tabBar.hidden=NO;
    }];

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
