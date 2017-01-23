//
//  ThreePictureCell.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/9.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "ThreePictureCell.h"
#import "KWImage.h"

@interface ThreePictureCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *oneImageView;

@property (weak, nonatomic) IBOutlet UIImageView *twoImageview;
@property (weak, nonatomic) IBOutlet UIImageView *threeImageView;
@property (weak, nonatomic) IBOutlet UIButton *goodbutton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation ThreePictureCell

+(instancetype)threePicture{
    return [[[NSBundle mainBundle]loadNibNamed:@"ThreePictureCell" owner:self options:nil]lastObject];
}
-(void)setFoundNew:(KWFoundNews *)foundNew{
    NSArray *imageArray=[KWImage mj_objectArrayWithKeyValuesArray:foundNew.images];
    KWImage *image=imageArray[0];
    [self.oneImageView sd_setImageWithURL:[NSURL URLWithString:image.url]];
    
    KWImage *image1=imageArray[1];
    [self.twoImageview sd_setImageWithURL:[NSURL URLWithString:image1.url]];
    
    KWImage *image2=imageArray[2];
    [self.threeImageView sd_setImageWithURL:[NSURL URLWithString:image2.url]];
    
    
    
    self.titleLabel.text=foundNew.title;
 
    [self.commentButton setTitle:[NSString stringWithFormat:@"%d",foundNew.commentCount] forState:UIControlStateNormal];
    
    [self.goodbutton setTitle:[NSString stringWithFormat:@"%d",foundNew.upCount] forState:UIControlStateNormal];
}

@end
