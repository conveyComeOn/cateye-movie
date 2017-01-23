//
//  KWbeginCarton.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/6.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWbeginCarton.h"

@implementation KWbeginCarton
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)KWbeginCartonWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
