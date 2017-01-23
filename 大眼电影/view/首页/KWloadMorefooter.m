//
//  KWloadMorefooter.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/10.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWloadMorefooter.h"

@interface KWloadMorefooter ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *grayRefeach;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation KWloadMorefooter

+(instancetype)footer{
    return [[[NSBundle mainBundle] loadNibNamed:@"KWloadMorefooter" owner:nil options:nil] lastObject];
}

-(void)beginRefeach{
    [self.grayRefeach startAnimating];
    self.grayRefeach.hidden=NO;
    
    self.refreshing=YES;
}
-(void)endRefeach{
    [self.grayRefeach stopAnimating];
    self.grayRefeach.hidden=YES;
    self.refreshing=NO;
}
-(void)setTitle:(NSString *)title{
    _title=title;
    self.titleLabel.text=title;
    
}

@end
