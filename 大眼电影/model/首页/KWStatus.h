//
//  KWStatus.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/8.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWStatus : NSObject
@property(nonatomic,assign)int recentShowNum;
@property(nonatomic,assign)int recentShowDate;
@property(nonatomic,assign)int pubShowNum;
@property(nonatomic,assign)int pubDate;
@property(nonatomic,copy)NSString *late;
@property(nonatomic,assign)int pn;

@property(nonatomic,copy)NSString *cat;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,copy)NSString *dir;
@property(nonatomic,copy)NSString *fra;
@property(nonatomic,assign)int id;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,strong)NSString *mk;
@property(nonatomic,copy)NSString *nm;
@property(nonatomic,assign)CGFloat sc;
@property(nonatomic,copy)NSString *scm;
@property(nonatomic,copy)NSString *showInfo;
@property(nonatomic,assign)int showNum;
@property(nonatomic,copy)NSString *star;
@property(nonatomic,copy)NSString *ver;
@property(nonatomic,assign)int videoId;
@property(nonatomic,copy)NSString *videoName;
@property(nonatomic,copy)NSString *videourl;


@property(nonatomic,copy)NSString *rt;

@property(nonatomic,assign)int showst;
@property(nonatomic,assign)int vnum;
@property(nonatomic,assign)int weight;
@property(nonatomic,assign)int wishst;
@property(nonatomic,assign)BOOL localPubSt;
@property(nonatomic,assign)int wish;
@property(nonatomic,assign)int  Id;


@property(nonatomic,assign)int dealsum;
@property(nonatomic,copy)NSString *dra;

@property(nonatomic,assign)BOOL isShowing;


@property(nonatomic,assign)int preSale;
@property(nonatomic,assign)int showSnum;
@property(nonatomic,assign)int snum;
@property(nonatomic,copy)NSString *src;
@property(nonatomic,copy)NSString *vd;


@property(nonatomic,assign)int dur;


@property(nonatomic,strong)NSArray *photos;



+(instancetype)headlineWithDict:(NSDictionary *)dict;
@end
