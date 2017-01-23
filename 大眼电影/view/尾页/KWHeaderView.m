//
//  KWHeaderView.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/16.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWHeaderView.h"
#import "KWbutton.h"


@implementation KWHeaderView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
        [self creatbutton:@"我的电影票"withImageString:@"ic_mine_my_ticket"];
        [self creatbutton:@"想看的电影" withImageString:@"ic_mine_my_wish"];
        [self creatbutton:@"看过的电影" withImageString:@"ic_mine_my_seen"];
    }
    return self;
}

-(void)creatbutton:(NSString *)title withImageString:(NSString *)image{
    UIButton *button=[[UIButton alloc]init];
 
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
  
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleEdgeInsets=UIEdgeInsetsMake(button.currentImage.size.height/2+self.height/2, -80, 0, 0);
    button.imageEdgeInsets=UIEdgeInsetsMake(0, 12, 15, 0);
    int i=(int)self.subviews.count;
  
    CGFloat width=KWWidth/3;
    button.frame=CGRectMake(i*width, 0, width, self.height);
    [button addTarget:self action:@selector(butonclick:) forControlEvents:UIControlEventTouchUpInside];
   
    [self addSubview:button];
}

-(void)butonclick:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(buttonclick:)]) {
        [self.delegate buttonclick:btn.titleLabel.text];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i=1; i<=2; i++) {
        UIView *view=[[UIView alloc]init];
        view.width=1;
        view.height=self.height-20;
        view.y=10;
        view.x=KWWidth/3*i;
        view.backgroundColor=[UIColor lightGrayColor];
        [self addSubview:view];
    }
   
    
    
}



@end
