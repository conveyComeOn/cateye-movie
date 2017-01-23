//
//  FoundCollectionCell.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "FoundCollectionCell.h"

@interface FoundCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation FoundCollectionCell




-(void)setIcon:(NSString *)icon{
    _icon=icon;
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:icon]];
    
}
-(void)setCommonTitle:(NSString *)commonTitle{
    _commonTitle=commonTitle;
    self.label.text=[NSString stringWithFormat:@"%@",commonTitle];
    
    
}
- (void)awakeFromNib {
    
}

@end
