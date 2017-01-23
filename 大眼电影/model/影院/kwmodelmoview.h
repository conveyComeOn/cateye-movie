//
//  kwmodelmoview.h
//  请求附近的电影
//
//  Created by kangweihexiaocong on 16/3/28.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface kwmodelmoview : NSObject
//"follow": 0,
//"brd": "CGV星星国际影城",
//"dis": "",
//"lng": 113.66641,
//"lat": 34.756752,
//"imax": 1,
//"sellPrice": 38,
//"area": "金水区",
//"ct": "",
//"preferential": 0,
//"nm": "CGV星聚汇影城(大卫城店)",
//"sellmin": 0,
//"sell": true,
//"poiId": 52749928,
//"addr": "金水区太康路二七路交叉口丹尼斯大卫城6楼",
//"brdId": 23941,
//"deal": 1,
//"dealPrice": 35,
//"referencePrice": 0,
//"showCount": 0,
//"id": 14497
//
//
@property(nonatomic,assign,getter=isOpen)BOOL open;
@property(nonatomic,copy)NSString *brd;
@property(nonatomic,copy)NSString *lng;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *area;
@property(nonatomic,copy)NSString *nm;
@property(nonatomic,copy)NSString *addr;
@property(nonatomic,assign)int brdId;
@property(nonatomic,copy)NSString *distance;


@end
