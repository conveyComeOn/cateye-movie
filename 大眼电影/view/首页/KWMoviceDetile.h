//
//  KWMoviceDetile.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/13.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWStatus.h"

@protocol KWMoviceDetileDelegate <NSObject>

-(void)arrorwBtnClicked:(int )i andhigger:(CGFloat)higger andbutton:(UIButton *)btn;
-(void)movieBtnClicked;
@end

@interface KWMoviceDetile : UIView

@property(nonatomic,copy)NSString *image;
@property(nonatomic,strong)KWStatus *status;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage1;

+(instancetype)detile;



@property(nonatomic,strong)id<KWMoviceDetileDelegate> delegate;
@end
