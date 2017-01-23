//
//  KWheadLines.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/6.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWheadLines : NSObject
//"movieId" = 76365,
//"title" = 除了武打，满满都是50年代香港元素,
//"type" = 专题,
//"url" = meituanmovie://www.meituan.com/web?url=http://m.maoyan.com/newGuide/ykyw3djbj,


@property(nonatomic,assign)int movieId;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *url;
@end
