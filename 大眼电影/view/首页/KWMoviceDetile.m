//
//  KWMoviceDetile.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/13.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWMoviceDetile.h"
#import "NSString+log.h"
#import "UIImage+exption.h"

@interface KWMoviceDetile()

@property (weak, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UILabel *nm;
@property (weak, nonatomic) IBOutlet UILabel *EnghishNm;
@property (weak, nonatomic) IBOutlet UILabel *catLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property(nonatomic,strong)UIVisualEffectView *visualEfView;

@property (weak, nonatomic) IBOutlet UILabel *snumlabel;
@property (weak, nonatomic) IBOutlet UIButton *totlabtn;
@property (weak, nonatomic) IBOutlet UIButton *wantWatch;
@property (weak, nonatomic) IBOutlet UIButton *buyticket;
@property (weak, nonatomic) IBOutlet UILabel *contentlabel;

@property (weak, nonatomic) IBOutlet UIButton *arrorBtn;
@property (weak, nonatomic) IBOutlet UIView *writeView;
@property (weak, nonatomic) IBOutlet UIButton *moviebutton;

@property(nonatomic,assign)CGSize labelsize;
@property(nonatomic,assign)int i;

@end
@implementation KWMoviceDetile
+(instancetype)detile{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"KWMoviceDetile" owner:self options:nil]lastObject];
}
-(void)setStatus:(KWStatus *)status{
    self.backgroundImage1=self.backgroundImage;
    self.i=1;
    NSString *imagestring=[NSString substringWithString:self.image];
    
   
    
    for (int i=0; i<=4; i++) {
        UIImageView *scoreimage=[[UIImageView alloc]init];
        if (i+1<status.sc) {
           
            scoreimage.image=[UIImage imageNamed:@"movie_detail_score_start_all"];
            
            
            if (status.sc/2<i+0.5) {
                scoreimage.image=[UIImage imageNamed:@"Collage_Fotor-2"];
            }
        }else{
            scoreimage.image=[UIImage imageNamed:@"movie_detail_score_start_none"];
        }
        
        if (i==0) {
            scoreimage.frame=CGRectMake(122, 50, 20, 20);
        }else{
            scoreimage.frame=CGRectMake(124+20*i, 50, 20, 20);
        }
        [self addSubview:scoreimage];
    }

    self.EnghishNm.text=[NSString stringWithFormat:@"%0.1f",status.sc];
    
    
    
    
    
    
    
    // 图片
    [self.backgroundImage sd_setImageWithURL:[NSURL URLWithString:imagestring]];
   
    self.snumlabel.text=[NSString stringWithFormat:@"(%d人评分)",status.snum];
    
    [self.totlabtn setBackgroundImage:[UIImage talkBackimage:@"icon_promotion_background@2x副本 2"] forState:UIControlStateNormal];
 
    [self.wantWatch  setBackgroundImage:[UIImage talkBackimage:@"icon_promotion_background@2x副本 2"] forState:UIControlStateNormal];
    [self.buyticket setBackgroundImage:[UIImage talkBackimage:@"btn_route_switchmap_normal@2x副本"] forState:UIControlStateNormal];
    
   
   [self.ImageView sd_setImageWithURL:[NSURL URLWithString:status.img]];
    self.nm.text=status.nm;
    self.catLabel.text=status.cat;
    self.countryLabel.text=[NSString stringWithFormat:@"%@/%d分钟",status.src,(int)status.dur];
    self.timelabel.text=status.rt;
    CGSize size=[status.nm sizeWithFont:self.catLabel.font ];
    
    [self addImax:status andsize:size];
    
    
    NSRange rang;
    rang.location=[status.dra rangeOfString:@">"].location+1;
    rang.length=[status.dra rangeOfString:@"</"].location-rang.location;
    NSString *string=[status.dra substringWithRange:rang];
  
    
  
    self.contentlabel.text=string;
   
    
    
    NSDictionary *dict=@{NSFontAttributeName:self.contentlabel.font};
    CGSize maxsize=CGSizeMake(self.contentlabel.width,MAXFLOAT);
    CGSize labelsize=[status.dra boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    self.labelsize=labelsize;
    
    
    
   
    
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
    
    CGFloat limit=KWWidth-2-self.ImageView.width-self.ImageView.x-2-image.size.width;
    
    if (size.width>limit) {
        self.nm.width=limit;
        
        
    }
    
    UIImageView *imageview=[[UIImageView alloc]init];
    CGFloat x=CGRectGetMaxX(self.timelabel.frame);
    CGFloat w=image.size.width;
    CGFloat h=image.size.height;
    CGFloat y=self.timelabel.y-65;
    imageview.image=image;
    imageview.frame=CGRectMake(x, y+2, w/2, h/2);
    
    
    
    [self addSubview:imageview];
    
}

- (IBAction)arroW:(UIButton *)sender {
    
    [sender setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon_cell_downArrow%d",self.i]] forState:UIControlStateNormal];
    CGFloat higght=self.labelsize.height-71;
    
   
    if (self.i) {
        self.contentlabel.numberOfLines=0;
        
        
        self.contentlabel.height=self.labelsize.height;
        self.arrorBtn.y=self.arrorBtn.y+higght;
    
        self.height=CGRectGetMaxY(sender.frame)+222;
        self.writeView.height=self.writeView.height+higght;
      
       
        self.i--;
    }else{
        self.height=378;
        self.contentlabel.height=71;
        self.arrorBtn.y=142;
        self.writeView.height=158;
        self.i++;
    }
    
    
    if ([self.delegate respondsToSelector:@selector(arrorwBtnClicked:andhigger:andbutton:)]) {
        [self.delegate arrorwBtnClicked:self.i andhigger:higght andbutton:sender];
    }
    
}

- (IBAction)movieVideoBtn:(UIButton *)sender {
  
    if ([self.delegate respondsToSelector:@selector(movieBtnClicked)]) {
        [self.delegate movieBtnClicked];
    }
}

@end
