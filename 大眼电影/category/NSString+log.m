//
//  NSString+log.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/13.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "NSString+log.h"

@implementation NSString (log)
+(NSString *)substringWithString:(NSString *)string{
    NSRange rang=[string rangeOfString:@"/w"];
    
    NSRange rangetwo=[string rangeOfString:@"h/"];
    NSString *one=[string substringWithRange:NSMakeRange(0, rang.location+1)];
    NSString *two=[string substringWithRange:NSMakeRange(rangetwo.location+2, string.length-rangetwo.location-2)];
    NSString *image=[NSString stringWithFormat:@"%@%@",one,two];
    return image;
}
@end
