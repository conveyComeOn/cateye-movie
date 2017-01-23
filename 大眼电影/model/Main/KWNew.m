//
//  KWNew.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/8.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWNew.h"

@implementation KWNew
/**
 *  当从文件中解析出一个对象的时候调用
 *  在这个方法中写清楚：怎么解析文件中的数据
 */
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.commonTitle = [decoder decodeObjectForKey:@"commonTitle"];
        self.imgUrl = [decoder decodeObjectForKey:@"imgUrl"];
        self.imgUrlSize = [decoder decodeObjectForKey:@"imgUrlSize"];
        self.typeDesc = [decoder decodeObjectForKey:@"typeDesc"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.url=[decoder decodeObjectForKey:@"url"];
        self.standIdList=[decoder decodeObjectForKey:@"standIdList"];
    }
    return self;
}

/**
 *  将对象写入文件的时候调用
 *  在这个方法中写清楚：要存储哪些对象的哪些属性，以及怎样存储属性
 */
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.commonTitle forKey:@"commonTitle"];
    [encoder encodeObject:self.imgUrl forKey:@"imgUrl"];
    [encoder encodeObject:self.imgUrlSize forKey:@"imgUrlSize"];
    [encoder encodeObject:self.typeDesc forKey:@"typeDesc"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.url forKey:@"url"];
    [encoder encodeObject:self.standIdList forKey:@"standIdList"];
}

@end
