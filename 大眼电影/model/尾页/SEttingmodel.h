//
//  SEttingmodel.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/2.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEttingmodel : NSObject
+(instancetype)initWithicon:(NSString *)icon title:(NSString *)title;
@property(nonatomic,copy)NSString *icon;

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *accessory;

@property(nonatomic,copy)NSString *detile;
@end
