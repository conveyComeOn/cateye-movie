//
//  SEttingmodel.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/2.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "SEttingmodel.h"

@implementation SEttingmodel

+(instancetype)initWithicon:(NSString *)icon title:(NSString *)title{

    SEttingmodel *model=[[SEttingmodel alloc]init];
    model.title=title;
    model.icon=icon;
    return model;
}
@end
