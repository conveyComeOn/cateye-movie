//
//  OnePictureCell.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "OnePictureCell.h"
#import "KWImage.h"

@interface OnePictureCell()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *DetilLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *LittleImage;


@end



@implementation OnePictureCell

+(instancetype)onePicture{
    return  [[[NSBundle mainBundle]loadNibNamed:@"OnePictureCell" owner:self options:nil]lastObject];
}



-(void)setFoundnew:(KWFoundNews *)foundnew{
    _foundnew=foundnew;
    NSArray *imagearray=[KWImage mj_objectArrayWithKeyValuesArray:foundnew.images];
    KWImage *image=imagearray[0];
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:image.url]];
    self.TitleLabel.text=foundnew.title;
    self.DetilLabel.text=foundnew.Description;
  //  NSLog(@"%@",foundnew.description);
    self.LittleImage.image=[UIImage imageNamed:foundnew.tag];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
