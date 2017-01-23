//
//  ThreePictureCell.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWFoundNews.h"
@interface ThreePictureCell : UITableViewCell
+(instancetype)threePicture;
@property(nonatomic,strong)KWFoundNews *foundNew;
@end
