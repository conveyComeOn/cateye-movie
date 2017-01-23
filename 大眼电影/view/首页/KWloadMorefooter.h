//
//  KWloadMorefooter.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/10.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KWloadMorefooter : UIView
+(instancetype)footer;
-(void)beginRefeach;
-(void)endRefeach;
@property(nonatomic,copy)NSString *title;

@property (nonatomic, assign, getter = isRefreshing) BOOL refreshing;
@end
