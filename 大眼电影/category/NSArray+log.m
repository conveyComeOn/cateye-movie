//
//  NSArray+log.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/6.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "NSArray+log.h"

@implementation NSArray (log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu (\n", (unsigned long)self.count];
    
    for (id obj in self) {
        [str appendFormat:@"\t%@, \n", obj];
    }
    
    [str appendString:@")"];
    
    return str;
}

@end
