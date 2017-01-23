//
//  OnePictureCell.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWFoundNews.h"
@interface OnePictureCell : UITableViewCell
+(instancetype)onePicture;

@property(nonatomic,strong)KWFoundNews *foundnew;
@end
