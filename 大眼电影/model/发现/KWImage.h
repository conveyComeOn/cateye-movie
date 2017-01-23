//
//  KWImage.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWImage : NSObject
//"authorId": 0,
//"height": 149,
//"id": 2550093,
//"sizeType": 0,
//"targetId": 9336,
//"targetType": 13,
//"url": "http://p1.meituan.net/movie/718f5253ec3a2bc846949b8bc4c5db4628672.jpg",
//"width": 200

//"tag": "话题",
//"time": 1457494110000,
//"title": "甄子丹吴京张震 谁是你心中的武打男神",
//"url": "meituanmovie://www.meituan.com/forum/postDetail?postID=91622"

@property(nonatomic,assign)int authorId;
@property(nonatomic,assign)int height;
@property(nonatomic,assign)int id;
@property(nonatomic,assign)int sizeType;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,assign)int width;


//@property(nonatomic,copy)NSString *url;
@end
