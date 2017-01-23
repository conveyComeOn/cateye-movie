//
//  KWbackgroundview.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/3.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWbackgroundview.h"

@implementation KWbackgroundview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=kwbackgroundcolor;
    }
    return self;
}
@end
