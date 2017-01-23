//
//  UIImage+exption.m
//  qq聊天
//
//  Created by kangweihexiaocong on 15/11/13.
//  Copyright © 2015年 kangweihexiaocong. All rights reserved.
//

#import "UIImage+exption.h"

@implementation UIImage (exption)

+(UIImage *)talkBackimage:(NSString *)imageName{
    
    UIImage *norImage = [UIImage imageNamed:imageName];
    CGFloat imageW=norImage.size.width*0.5;
    CGFloat imageH=norImage.size.height*0.5;
 
    
    
    UIImage *newimage=[norImage resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW) ];
    
  
    
    return newimage;
    
}
@end
