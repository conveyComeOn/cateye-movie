//
//  KWcommentCell.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/17.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kWcommentFrame.h"

@interface KWcommentCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableview;
@property(nonatomic,strong)kWcommentFrame *commentframe;
@end
