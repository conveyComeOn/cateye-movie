//
//  kwcellADress.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/28.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "kwcellADress.h"

@interface kwcellADress()
@property (weak, nonatomic) IBOutlet UILabel *textlabel;
@property (weak, nonatomic) IBOutlet UILabel *detiltlabel;

@end

@implementation kwcellADress

- (void)awakeFromNib {
    // Initialization code
}


+(instancetype)modelcell{
    return [[[NSBundle mainBundle]loadNibNamed:@"kwcellADress" owner:self options:nil]lastObject];
}
-(void)setModelview:(kwmodelmoview *)modelview{
    CGSize size=[modelview.nm sizeWithFont:self.textlabel.font];
    self.textlabel.width=size.width;
    
    self.textlabel.text=modelview.nm;
    self.detiltlabel.text=modelview.addr;
    NSDictionary *dict=@{NSFontAttributeName:self.textlabel.font};
    CGSize maxsize=CGSizeMake(self.textlabel.width,MAXFLOAT);

    UILabel *label=[[UILabel alloc]init];
    label.font=[UIFont systemFontOfSize:12];
    CGFloat dlozt=[modelview.distance floatValue];
    label.text=[NSString stringWithFormat:@"距您%0.f米",dlozt];
    CGSize labelsize=[label.text boundingRectWithSize:maxsize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    label.frame=CGRectMake(CGRectGetMaxX(self.textlabel.frame)+5, 0, labelsize.width, labelsize.height);
    
    [self addSubview:label];
    
    
    
}


@end
