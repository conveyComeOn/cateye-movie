//
//  KWNewstool.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/8.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//
#define HMAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]
#import "KWNewstool.h"

@implementation KWNewstool

+(NSArray *)news{
    // 读取帐号
   // HMAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:HMAccountFilepath];
    NSArray *news=[NSKeyedUnarchiver unarchiveObjectWithFile:HMAccountFilepath];
  
    return news;
}



+(void)save:(NSArray *)news{
    [NSKeyedArchiver archiveRootObject:news toFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"account.data"]];
    
}
@end
