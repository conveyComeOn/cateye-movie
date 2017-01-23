//
//  SQCollectionCell.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/6.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "SQCollectionCell.h"
#import "UIImageView+WebCache.h"

@interface SQCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end
@implementation SQCollectionCell


-(void)setIcon:(NSString *)icon{
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:icon]];
}
@end
