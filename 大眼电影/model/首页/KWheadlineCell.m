//
//  KWheadlineCell.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/7.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWheadlineCell.h"
#import "UIImageView+WebCache.h"
#import "NSString+log.h"



@interface KWheadlineCell()
@property (weak, nonatomic) IBOutlet UIImageView *HeadImageView;
@property (weak, nonatomic) IBOutlet UILabel *HotNamelabel;


@property (weak, nonatomic) IBOutlet UILabel *TotalnumLabel;

@property (weak, nonatomic) IBOutlet UILabel *ScmLabel;
@property (weak, nonatomic) IBOutlet UILabel *ShowInfo;
@property (weak, nonatomic) IBOutlet UIButton *buyticket;


@property (weak, nonatomic) IBOutlet UIButton *imageViewButton;

@end

@implementation KWheadlineCell

+(instancetype)headline{
    return [[[NSBundle mainBundle]loadNibNamed:@"KWheadlineCell" owner:self options:nil]lastObject];
}
-(void)setStatus:(KWStatus *)status{
    _status=status;
    
    self.imageViewButton.tag=status.id;
  
    
    NSString *image=[NSString substringWithString:status.img];
   
    [self.HeadImageView sd_setImageWithURL:[NSURL URLWithString:image]];

  
  
   
    self.ShowInfo.text=status.showInfo;
    self.ScmLabel.text=status.scm;
     self.HotNamelabel.text=status.nm;
    CGSize size=[status.nm sizeWithFont:self.HotNamelabel.font];
    self.HotNamelabel.size=size;
    
    CGFloat num=[status.mk floatValue];
    if (num==0) {
        NSString *peppleWant=[NSString stringWithFormat:@"%d人想看",status.wish];
        CGSize peoplesize=[peppleWant sizeWithFont:self.TotalnumLabel.font];
        self.TotalnumLabel.frame=CGRectMake(KWWidth-peoplesize.width-2, self.TotalnumLabel.frame.origin.y, peoplesize.width, self.TotalnumLabel.frame.size.height);
        self.TotalnumLabel.text=peppleWant;
        [self.buyticket setBackgroundImage:[UIImage imageNamed:@"board_presell"] forState:UIControlStateNormal];
    }else{
  
   self.TotalnumLabel.text=[NSString stringWithFormat:@"%0.1f分",num];
        self.TotalnumLabel.hidden=NO;
    }
    
    [self addImax:status andsize:size];
    
    
    
}



-(void)addImax:(KWStatus *)status andsize:(CGSize)size{
    NSRange rang=[status.ver rangeOfString:@"IMAX 3D"];
    UIImage *image=[[UIImage alloc]init];
    if (!rang.length==0) {
        image=[UIImage imageNamed:@"ic_3d_imax"];
        
        
    }else{
        rang=[status.ver rangeOfString:@"3D"];
        if (!rang.length==0) {
            image=[UIImage imageNamed:@"ic_3d"];
        }else{
            image=nil;
        }
       
    }
    
    CGFloat limit=KWWidth-self.TotalnumLabel.width-2-self.HeadImageView.width-self.HeadImageView.x-2-image.size.width;
    
    if (size.width>limit) {
        self.HotNamelabel.width=limit;
        
      
    }

    UIImageView *imageview=[[UIImageView alloc]init];
    CGFloat x=CGRectGetMaxX(self.HotNamelabel.frame)+1;
    CGFloat w=image.size.width;
    CGFloat h=image.size.height;
    CGFloat y=self.HotNamelabel.y;
    imageview.image=image;
    imageview.frame=CGRectMake(x, y+2, w/2, h/2);
    
    
    
    [self addSubview:imageview];
    
}
- (IBAction)ImageviewButton:(UIButton *)sender {
   
    if ([self.delegate respondsToSelector:@selector(AcellIsclick:withtag:)]) {
        [self.delegate AcellIsclick:self withtag:sender.tag];
    }
   
}

-(IBAction)BuyTicket:(UIButton *)btn{
    
    
    
}
@end
