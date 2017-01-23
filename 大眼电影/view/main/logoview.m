//
//  logoview.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/18.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "logoview.h"

@interface logoview()
@property(nonatomic,strong)UIImageView *imageview1 ;

@end
@implementation logoview


-(void)beginScoll{
    
    
    self.imageview1.transform=CGAffineTransformRotate(self.imageview1.transform, M_PI/50);
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        UIImageView *imageview=[[UIImageView alloc]init];
        imageview.image=[UIImage imageNamed:@"bg_welcome_logo_red-1"];
        
        imageview.frame=CGRectMake(100, 100, 55, 55);
        imageview.center=self.center;
        UIImageView *imageview1=[[UIImageView alloc]init];
        self.imageview1=imageview1;
        imageview1.image=[UIImage imageNamed:@"pull_process_out副本"];
        
        imageview1.frame=CGRectMake(100, 100, 62, 62);
        imageview1.center=self.center;
        
        CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(beginScoll)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        [self addSubview:imageview];
        [self addSubview:imageview1];

    }
    return self;
}
@end
