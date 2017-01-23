//
//  KWMoviceComment.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/12.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWMoviceComment : NSObject


@property(nonatomic,assign)int id;
@property(nonatomic,assign)int oppose;
@property(nonatomic,copy)NSString *avatarurl;
@property(nonatomic,assign)int approve;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *nick;
@property(nonatomic,assign)int reply;
@property(nonatomic,assign)int userId;
@property(nonatomic,copy)NSString *nickName;

@property(nonatomic,assign)CGFloat score;
@property(nonatomic,copy)NSString *content;

@end
