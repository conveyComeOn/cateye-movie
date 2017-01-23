//
//  kWcommentFrame.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/17.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "kWcommentFrame.h"

@implementation kWcommentFrame



-(void)setComment:(KWMoviceComment *)comment{
    _comment=comment;
   
   

  NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGSize maxsize=CGSizeMake(KWWidth-20,CGFLOAT_MAX);
    
    
    //CGSize labelsize=[comment.content sizeWithFont:[UIFont systemFontOfSize:13]];
    CGSize labelsize=[comment.content boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
   
    self.textFrame=CGRectMake(10, 20, KWWidth-20, labelsize.height);
    
    
    
       
    
    self.iconFrame=CGRectMake(10, CGRectGetMaxY(self.textFrame)+10, 20, 20);
    
    
    
   
    
      CGSize maxsize1=CGSizeMake(CGFLOAT_MAX,self.iconFrame.size.height);
    CGSize labelsize1=[comment.nickName boundingRectWithSize:maxsize1 options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    self.nameFrame=CGRectMake(CGRectGetMaxX(self.iconFrame)+10, self.iconFrame.origin.y, labelsize1.width, labelsize1.height);
    
   
    
    
   

    self.replayFrame=CGRectMake(KWWidth-100, self.nameFrame.origin.y, 100,labelsize1.height);
    
    
    
   
   
    self.appvoeFrame=CGRectMake(KWWidth-150, self.nameFrame.origin.y, 100, labelsize1.height);
    
    
    self.frame=CGRectMake(0, 10, KWWidth, CGRectGetMaxY(self.iconFrame)+10);
    
    
    self.cellheight=CGRectGetMaxY(self.iconFrame)+20;
   }
@end
