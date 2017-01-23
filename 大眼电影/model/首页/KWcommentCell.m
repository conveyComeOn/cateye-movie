//
//  KWcommentCell.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/17.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWcommentCell.h"
#import "KWcommentView.h"

@interface KWcommentCell()
@property(nonatomic,strong)KWcommentView *commentview;
@end

@implementation KWcommentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    KWcommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[KWcommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        KWcommentView *commentview=[[KWcommentView alloc]init];
        self.commentview=commentview;
        [self.contentView addSubview:commentview];
        
    }
    return self;
}


-(void)setCommentframe:(kWcommentFrame *)commentframe{
    _commentframe=commentframe;
    self.commentview.commentFrame=commentframe;
    self.commentview.frame=commentframe.frame;
 
}
@end
