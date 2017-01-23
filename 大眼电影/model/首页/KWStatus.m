//
//  KWStatus.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/8.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWStatus.h"

@implementation KWStatus

+(instancetype)headlineWithDict:(NSDictionary *)dict{
    KWStatus *status=[[self alloc]init];
    status.cat=dict[@"cat"];
    status.videourl=dict[@"videourl"];
   
    status.nm=dict[@"nm"];
    status.nm=dict[@"nm"];
    status.scm=dict[@"scm"];
  
    status.showInfo=dict[@"showInfo"];
    status.mk=dict[@"mk"];
    
       status.img=dict[@"img"];
    
   status.ver=dict[@"ver"];
    
    return status;
}
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"Id":@"id",
             @"Description" : @"description"
             };
}
@end
