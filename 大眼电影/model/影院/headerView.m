//
//  headerView.m
//  QQ聊天分组
//
//  Created by kangweihexiaocong on 15/11/16.
//  Copyright © 2015年 kangweihexiaocong. All rights reserved.
//

#import "headerView.h"

#import "kwmodelmoview.h"
@interface headerView()
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *label;
@end

@implementation headerView

+(instancetype)headeViewWithTableView:(UITableView *)tableView{
 // static NSString *string=@"headerview";
   // headerView *view=[tableView dequeueReusableHeaderFooterViewWithIdentifier:string];
    headerView *view=[[headerView alloc]init];
//    if (view==nil) {
//       // view=[[headerView alloc]initWithReuseIdentifier:string];
//        
//    }
    return view;
    
}



//-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
-(instancetype)init{
   // if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
    if (self = [super init]) {
     
        UIButton *btn=[[UIButton alloc]init];
        [btn addTarget:self action:@selector(btnOnClick) forControlEvents:UIControlEventTouchUpInside];
       
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        UIImage *image=[UIImage imageNamed:@"buddy_header_arrow"];
        self.imageView.image=image;
        [btn setImage:image forState:UIControlStateNormal];
        
        //设置按钮内容左对齐
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        //设置按钮的内边距，按钮距离左边一段距离
        [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
        //设置按钮和标题之间的距离
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        //不填充
        btn.imageView.contentMode=UIViewContentModeCenter;
        //不剪切
        btn.imageView.clipsToBounds=NO;
        [self addSubview:btn];
        self.btn=btn;
        
        
        UILabel *label=[[UILabel alloc]init];
     //   label.backgroundColor=[UIColor grayColor];
        [self addSubview:label];
        self.label=label;
    }
    return self;
}


-(void)btnOnClick{
    
    self.qqheadeviewGroup.open=!self.qqheadeviewGroup.isOpen;
    // 设置箭头状态
  

    if ([self.delegate respondsToSelector:@selector(headViewDidClickHeaderView:)]) {
        [self.delegate headViewDidClickHeaderView:self];
    }
    
   
    
  
   
    
 // NSLog(@"%p %@", self, self.qqheadeviewGroup.name);
}






-(void)layoutSubviews{
    [super layoutSubviews];
    self.btn.frame=self.bounds;
    
    
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat padding=10;
    CGFloat labelW=150;
    CGFloat labelY=0;
    CGFloat labelH=44;
    CGFloat labelX=screen.size.width-padding-labelW;
    self.label.frame=CGRectMake(labelX, labelY, labelW, labelH);
    
   
}

-(void)setQqheadeviewGroup:(kwmodelmoview *)qqheadeviewGroup{
    _qqheadeviewGroup=qqheadeviewGroup;
    
  [self.btn setTitle:qqheadeviewGroup.area forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
   self.btn.titleLabel.textAlignment=NSTextAlignmentLeft;
   // self.label.text=[NSString stringWithFormat:@"%@",qqheadeviewGroup];
    self.label.textColor=[UIColor grayColor];
    self.label.textAlignment=NSTextAlignmentRight;

  
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    // 设置箭头状态
    if (self.qqheadeviewGroup.open) {
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
       
    } else {
        self.btn.imageView.transform = CGAffineTransformIdentity;
        
    }
    
}



@end
