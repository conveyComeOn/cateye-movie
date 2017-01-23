//
//  KWheadlineCell.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/7.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWStatus.h"
@class KWheadlineCell;
@protocol KWheadlineCellDelegate <NSObject>

-(void)AcellIsclick:(KWheadlineCell *)cell withtag:(NSInteger)tag;

@end

@interface KWheadlineCell : UITableViewCell
@property(nonatomic,strong)KWStatus *status;

+(instancetype)headline;
@property(nonatomic,weak)id<KWheadlineCellDelegate>delegate;
@end
