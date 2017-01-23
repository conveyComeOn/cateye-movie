//
//  KWcommentView.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/17.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWcommentView.h"
#import "KWMoviceComment.h"
#import "NSDate+MJ.h"

@implementation KWcommentView




-(void)setCommentFrame:(kWcommentFrame *)commentFrame{
    
    KWMoviceComment *comment=commentFrame.comment;
    
    for (int i=0; i<=4; i++) {
        UIImageView *scoreimage=[[UIImageView alloc]init];
        if (i<comment.score) {
            scoreimage.image=[UIImage imageNamed:@"movie_detail_score_start_all"];
        }else{
            scoreimage.image=[UIImage imageNamed:@"movie_detail_score_start_none"];
        }
        
        if (i==0) {
            scoreimage.frame=CGRectMake(10, 5, 10, 10);
        }else{
            scoreimage.frame=CGRectMake(12+10*i, 5, 10, 10);
        }
        [self addSubview:scoreimage];
    }
    
   NSString *string= [self setcommentTime:comment.time];
    
    UILabel *timelabel=[[UILabel alloc]init];
    [timelabel setTextColor:[UIColor grayColor]];
    timelabel.text=string;
    timelabel.frame=CGRectMake(75, 5, 100, 10);
    timelabel.font=[UIFont systemFontOfSize:12];
    
    [self addSubview:timelabel];
    
    
    
    UILabel *label=[[UILabel alloc]init];
    label.font=[UIFont systemFontOfSize:14];
    label.numberOfLines=0;
    
    label.text=comment.content;
    label.frame=commentFrame.textFrame;
    [self addSubview:label];
    UIImageView *imageview=[[UIImageView alloc]init];
    [imageview sd_setImageWithURL:[NSURL URLWithString:comment.avatarurl]];
    
    
    
    imageview.frame=commentFrame.iconFrame;
    
    imageview.layer.cornerRadius = imageview.frame.size.width / 2;
    imageview.clipsToBounds = YES;



    
    
    
    [self addSubview:imageview];
    
    UILabel *label1=[[UILabel alloc]init];
    [label1 setTextColor:[UIColor grayColor]];
    label1.text=comment.nickName;
    label1.font=timelabel.font;
    label1.frame=commentFrame.nameFrame;
    [self addSubview:label1];
    
    
    
    UIButton *buttont1=[[UIButton alloc]init];
    [buttont1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttont1.font=[UIFont systemFontOfSize:12];
    [buttont1 setImage:[UIImage imageNamed:@"timeline_icon_comment"] forState:UIControlStateNormal];
    [buttont1 setTitle:[NSString stringWithFormat:@"%d",comment.reply] forState:UIControlStateNormal];
    buttont1.frame=commentFrame.replayFrame;
    [self addSubview:buttont1];
    
    
    UIButton *buttont=[[UIButton alloc]init];
    buttont.font=[UIFont systemFontOfSize:12];
     [buttont setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttont setImage:[UIImage imageNamed:@"timeline_icon_unlike"] forState:UIControlStateNormal];
    [buttont setTitle:[NSString stringWithFormat:@"%d",comment.approve] forState:UIControlStateNormal];
    buttont.frame=commentFrame.appvoeFrame;
    [self addSubview:buttont];
    
    
}


-(NSString *)setcommentTime:(NSString *)time{
    //2016-03-11 15:07
    NSDateFormatter *formater=[[NSDateFormatter alloc]init];
    formater.dateFormat=@"yyyy-MM-dd HH:mm";
    NSDate *datetime=[formater dateFromString:time];
  
        if (datetime.isToday) {
            
       
         NSDateComponents *cmps = [datetime deltaWithNow];
        if (cmps.hour >= 1) { // 至少是1小时前发的
            return [NSString stringWithFormat:@"%ld小时前", cmps.hour];
        } else if (cmps.minute >= 1) { // 1~59分钟之前发的
            return [NSString stringWithFormat:@"%ld分钟前", cmps.minute];
        } else { // 1分钟内发的
            return @"刚刚";
        }
    
    
    } else if (datetime.isYesterday) { // 昨天
        formater.dateFormat = @"昨天 HH:mm";
        return [formater stringFromDate:datetime];
    } else { // 至少是前天
        formater.dateFormat = @"MM-dd HH:mm";
        return [formater stringFromDate:datetime];
    }
    
}






@end
