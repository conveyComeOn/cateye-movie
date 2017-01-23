//
//  KWbeginCarton.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/6.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWbeginCarton : NSObject



@property(nonatomic,assign)int end;
@property(nonatomic,assign)int id;
@property(nonatomic,assign)int isShowLogo;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,assign)int start;
@property(nonatomic,assign)int times;
@property(nonatomic,assign)CGFloat title;
@property(nonatomic,assign)int type;
@property(nonatomic,copy)NSString *url;
//end = 1457279940;
//id = 763;
//isShowLogo = 1;
//pic = "http://p1.meituan.net/movie/1da7a8a0ebbe187e5e3cabcd1c7c8309102742.jpg";
//start = 1457193600;
//times = 15;
//title = "3.6";
//type = 2;
//url = "";



-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)KWbeginCartonWithDict:(NSDictionary *)dict;
@end
