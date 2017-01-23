//
//  KWNew.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/8.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWNew : NSObject
//"id": 12441,
//"name": "打包3.7-3.13",
//"commonTitle": "",
//"imgUrl": "http://p1.meituan.net/mmc/c514d8a4a73515897b1e7b193776961164446.jpg",
//"imgUrlSize": "(640, 150)",
//"bigImgTypeUrl": "http://p1.meituan.net/mmc/c514d8a4a73515897b1e7b193776961164446.jpg",
//"bigImgUrlSize": "(640, 150)",
//"app": "movie",
//"type": 3,
//"typeDesc": "链接到应用内部页面",
//"standIdList": [
//                11
//                ],
//"startTime": 1457280000000,
//"endTime": 1457884740000,
//"level": 2,
//"newUser": -1,
//"closable": 2,
//"channelType": 0,
//"channelListMap": {},
//"businessName": "",
//"businessIds": "",
//"url": "meituanmovie://www.meituan.com/web?url=http://m.maoyan.com/newGuide/MYPD0304",
//"movieIdList": []
//


@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *commonTitle;
@property(nonatomic,copy)NSString *imgUrl;
@property(nonatomic,copy)NSString *bigImgTypeUrl;
@property(nonatomic,assign)NSString *imgUrlSize;
@property(nonatomic,copy)NSString *typeDesc;
@property(nonatomic,strong)NSArray *standIdList;
@property(nonatomic,copy)NSString *url;


@end
