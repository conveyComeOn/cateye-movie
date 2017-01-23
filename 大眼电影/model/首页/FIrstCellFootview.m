
//
//  FIrstCellFootview.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/7.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "FIrstCellFootview.h"
#import "KWheadLines.h"


@interface FIrstCellFootview()

@property (weak, nonatomic) IBOutlet UIButton *typebutton2;

@property (weak, nonatomic) IBOutlet UIButton *typebutton;

@property (weak, nonatomic) IBOutlet UIButton *OneTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *TwoTitleButton;
@end

@implementation FIrstCellFootview

+(instancetype)footview{
    return [[[NSBundle mainBundle]loadNibNamed:@"FIrstCellFootview" owner:self options:nil]lastObject];
}

-(void)setHeadline:(NSArray *)headline{
    
    NSArray *array=[KWheadLines mj_objectArrayWithKeyValuesArray:headline];
  
    KWheadLines *model1=array[0];
    [self.OneTitleButton setTitle:model1.title forState:UIControlStateNormal];
    
    [self.typebutton setTitle:model1.type forState:UIControlStateNormal];
    
    
   
//    KWheadLines *model2=array[1];
//    
//    [self.TwoTitleButton setTitle:model2.title forState:UIControlStateNormal];
//    [self.typebutton2 setTitle:model2.type forState:UIControlStateNormal];
  
    
}
- (IBAction)OneTitle:(UIButton *)sender {
}
- (IBAction)TwoTitle:(UIButton *)sender {
}


@end
