//
//  kWcommentFrame.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/17.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"KWMoviceComment.h"
@interface kWcommentFrame : NSObject

@property(nonatomic,strong)KWMoviceComment *comment;
/** 昵称 */
@property (nonatomic, assign) CGRect nameFrame;
/** 正文 */
@property (nonatomic, assign) CGRect textFrame;
/** 头像 */
@property (nonatomic, assign) CGRect iconFrame;
/** 会员图标 */
@property (nonatomic, assign) CGRect vipFrame;
/** 配图相册  */
@property (nonatomic, assign) CGRect manFrame;

@property(nonatomic,assign)CGRect appvoeFrame;

@property(nonatomic,assign)CGRect replayFrame;

/** 自己的frame */
@property (nonatomic, assign) CGRect frame;
@property(nonatomic,assign)CGFloat cellheight;

@end
