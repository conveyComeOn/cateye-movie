//
//  ViewController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "ViewController.h"
#import "movieController.h"
#import "cinemaController.h"
#import "foundController.h"

#import "kwtabbar.h"
#import "KWbutton.h"

@interface ViewController ()
@property(nonatomic,strong)kwtabbar *tabbar;
@property(nonatomic,strong)KWbutton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    NSMutableDictionary *selectedTextAttrs1 = [NSMutableDictionary dictionary];
    selectedTextAttrs1[UITextAttributeTextColor] = [UIColor blackColor];
   
    NSMutableDictionary *selectedTextAttrs2 = [NSMutableDictionary dictionary];
    selectedTextAttrs2[UITextAttributeTextColor] = [UIColor redColor];
    
    for (int i=0; i<=self.tabBar.items.count-1; i++) {
         UITabBarItem* item = [self.tabBar.items objectAtIndex:i];
        [item setTitleTextAttributes:selectedTextAttrs1 forState:UIControlStateNormal];
        [item setTitleTextAttributes:selectedTextAttrs2 forState:UIControlStateSelected];
        [item setFinishedSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",2*i+2]] withFinishedUnselectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",2*i+1]]];
    }
    
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
//    kwtabbar *tabbar=[[kwtabbar alloc]init];
// tabbar.frame=self.tabBar.frame;
// 
// 
//    [self.view addSubview:tabbar];
//    //[self.tabBar removeFromSuperview];
//    self.tabbar=tabbar;
//    [self creattoorBarBtn:@"电影"];
//    [self creattoorBarBtn:@"影院"];
//    [self creattoorBarBtn:@"发现"];
//    [self creattoorBarBtn:@"我的"];
//  //  [self setValue:self.tabbar forKey:@"tabBar"];
//   [self.tabBarController setValue:self.tabbar forKey:@"tabBar"];
//    NSLog(@"%@,%@",self.tabBarController.tabBar,self.tabBar);
}
-(void)creattoorBarBtn:(NSString *)title{
   
        KWbutton *button=[[KWbutton alloc]init];

        button.tag=self.tabbar.subviews.count;
       int i=(int)self.tabbar.subviews.count;
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",2*i+1]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",2*i+2]] forState:UIControlStateDisabled];
         [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    
    CGFloat weith=[UIScreen mainScreen].bounds.size.width/4;
    CGFloat height=self.tabbar.frame.size.height;
    button.frame=CGRectMake(i*weith, 0, weith, height);

    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateDisabled];
    [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchDown];
        [self.tabbar addSubview:button];
    if (button.tag==0) {

        
        [self buttonclick:button];
        
    }
}


-(void)buttonclick:(KWbutton *)btn{
    self.button.enabled=YES;
    
    btn.enabled=NO;
    self.button=btn;
    self.selectedIndex=btn.tag;
   
    
}

@end
