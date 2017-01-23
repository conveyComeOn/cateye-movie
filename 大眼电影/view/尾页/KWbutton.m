//
//  KWbutton.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWbutton.h"


@implementation KWbutton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor whiteColor];
      
        self.imageEdgeInsets=UIEdgeInsetsMake(-15,0, 1, 0);
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
     self.titleLabel.hidden=NO;
    CGFloat top=(self.currentImage.size.height+1);
    self.titleLabel.font=[UIFont systemFontOfSize:10];
    
    self.titleLabel.textColor=[UIColor blackColor];
    CGFloat x=self.width/2;
    self.titleLabel.center=CGPointMake(x-8, top);
    self.titleLabel.size=CGSizeMake(20, 15);

}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    self.titleLabel.text=title;

}
@end
