//
//  KWFoundNews.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWFoundNews : NSObject
//"commentCount": 165,
//"description": "《叶问3》宣布捐票房成立关",
//"feedType": 7,
//"id": 10355,


@property(nonatomic,assign)int commentCount;
@property(nonatomic,copy)NSString *Description;
@property(nonatomic,copy)NSString *url;

@property(nonatomic,assign)int feedType;
@property(nonatomic,assign)int id;
@property(nonatomic,copy)NSString *tag;
@property(nonatomic,assign)int time;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSArray *images;

@property(nonatomic,assign)int upCount;


@end
