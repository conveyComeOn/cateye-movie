//
//  moviceDetileController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/12.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "moviceDetileController.h"
#import "UIImage+Extension.h"
#import "KWMoviceComment.h"
#import "KWMoviceDetile.h"
#import "kWcommentFrame.h"
#import "NSString+log.h"
#import "KWcommentCell.h"
#import "videoViewController.h"
#import "KWphotoView.h"
#import "PYPhotosView.h"
#import "PYPhotoView.h"


@interface moviceDetileController ()<KWMoviceDetileDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) KWStatus *kstatus;
@property(nonatomic,strong) NSArray *first ;

@property(nonatomic,strong)UIView *writeview;
@property(nonatomic,strong)UILabel *contentlabel;
@property(nonatomic,assign)CGSize labelsize;
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)UIView *arrorBtn;
@property(nonatomic,strong)UIView *view1 ;
@property(nonatomic,strong)UIScrollView *scroll ;
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,assign)CGFloat tableviewheight;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *photos;
@property(nonatomic,strong) KWMoviceDetile *movice ;


@end

@implementation moviceDetileController


-(NSArray *)first{
    if (_first==nil) {
        _first=[NSArray array];
    }
    return _first;
}
-(NSMutableArray *)photos{
    if (_photos==nil) {
        _photos=[NSMutableArray array];
    }
    return _photos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UIScrollView *scroll=[[UIScrollView alloc]init];
    scroll.delegate=self;
    self.scroll=scroll;
    scroll.scrollEnabled=YES;
    
    [self.view addSubview:scroll];
    self.view.backgroundColor=[UIColor lightGrayColor];
  
    
 
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0]] forBarMetrics:UIBarMetricsCompact] ;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(void)setStatus:(KWStatus *)status{
    AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
   
    self.kstatus=status;
    
    manger.responseSerializer=[AFJSONResponseSerializer serializer];
    [manger.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"application/x-javascript", nil]];

    [manger GET:[NSString stringWithFormat:@"http://m.maoyan.com/movie/%d.json#type=movies",status.id] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        
      NSDictionary *dict=responseObject[@"data"];
        NSDictionary *dict1=dict[@"CommentResponseModel"];
        NSArray *array=dict1[@"hcmts"];
        NSDictionary *arraytwo=dict[@"MovieDetailModel"];
        KWStatus *kstatus=[KWStatus mj_objectWithKeyValues:arraytwo];
      //  self.kstatus=kstatus;
      
       
        
      NSArray *first=[KWMoviceComment mj_objectArrayWithKeyValuesArray:array];
        self.first=[self statusFramesWithStatuses:first];
      
    
        
        KWMoviceDetile *movice=[KWMoviceDetile detile];
        self.movice=movice;
        
        
        movice.delegate=self;
      movice.image=status.img;
       
       movice.status=kstatus;
        self.name=status.nm;
        
        
  

        [self.scroll addSubview:movice];
        
        
        
        UIView *writeview=[[UIView alloc]init];
        self.writeview=writeview;
        writeview.frame=CGRectMake(0, CGRectGetMaxY(movice.frame)+10, KWWidth, 135);
        writeview.backgroundColor=[UIColor whiteColor];
      [self.scroll addSubview:writeview];
        
        
      
        UIScrollView *scrollview=[[UIScrollView alloc]init];
        scrollview.backgroundColor=[UIColor whiteColor];
        
            
        int a=(int)kstatus.photos.count;
        for (int i=0; i<=a-1; i++) {
//            UIImageView *imageview=[[UIImageView alloc]init];
//            imageview.userInteractionEnabled=YES;
//            imageview.tag=i;
            NSString *string=kstatus.photos[i];
            NSString *realstring=[NSString substringWithString:string];
           
            [self.photos addObject:realstring];
          //  [imageview sd_setImageWithURL:[NSURL URLWithString:realstring]];
//            imageview.frame=CGRectMake(125*i+5, 0, 120, 85);
//            [scrollview addSubview:imageview];
//            
//            
//            UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]init];
//            [tap addTarget:self action:@selector(imageisClick:)];
//            [imageview addGestureRecognizer:tap];
        }
        scrollview.frame=CGRectMake(0, 25, 120*a+20, 85);
   scrollview.showsHorizontalScrollIndicator=NO;
       scrollview.contentSize=CGSizeMake(120*a*1.9+50, 85);
       
        scrollview.autoresizesSubviews=NO;
        scrollview.userInteractionEnabled=YES;
        
        scrollview.scrollEnabled=YES;
        
        self.scrollview=scrollview;
        PYPhotosView *photo=[PYPhotosView photosView:self.photos];
        
        
        [scrollview addSubview:photo];
        
#pragma 添加剧照的label
        
        UILabel *media=[[UILabel alloc]init];
        media.text=@"媒体库";
        [media setTextColor:[UIColor blackColor]];
        media.frame=CGRectMake(5, 5, KWWidth-5, 15);
        
        UILabel *picture=[[UILabel alloc]init];
        [picture setText:@"剧照"];
        [picture setTextColor:[UIColor grayColor]];
        picture.frame=CGRectMake(5, 115, 100, 15);
        [picture setFont:[UIFont systemFontOfSize:15]];
        
        UIButton *button=[[UIButton alloc]init];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:[NSString stringWithFormat:@"%d",kstatus.pn] forState:UIControlStateNormal];
        [button setFont:picture.font];
        [button setImage:[UIImage imageNamed:@"icon_cell_rightArrow_disabled"] forState:UIControlStateNormal];
        button.imageEdgeInsets=UIEdgeInsetsMake(0, 75, 0, 0);
        button.frame=CGRectMake(KWWidth-100, 115, 100, 15);
        [writeview addSubview:button];
        
        [writeview addSubview:media];
        [writeview addSubview:picture];
        
        
       
        [writeview addSubview:scrollview];
      //  [self.scroll addSubview:scrollview];
        [self addcommentViewWith:writeview.frame];
        [self.tableview reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    

}

#pragma movice的代理方法

-(void)arrorwBtnClicked:(int)i andhigger:(CGFloat)higger andbutton:(UIButton *)btn{
    for (UIView *view in self.scroll.subviews) {
        if (![view isKindOfClass:[KWMoviceDetile class]]) {
            if (i) {
                view.y=view.y-higger;
           
                self.tableviewheight=self.tableviewheight-higger;
              
            }
            else{
                view.y=view.y+higger;
                self.tableviewheight=self.tableviewheight+higger;
            
                
                
                             }
        }
    }
   
    
  self.view.height=CGRectGetMaxY(self.tableview.frame);
    
 
   
}

-(void)movieBtnClicked{
  
    videoViewController *video=[[videoViewController alloc]init];
    video.status=self.kstatus;
    [self.navigationController pushViewController:video animated:YES];
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
   
    self.tableview.frame=CGRectMake(0, CGRectGetMaxY(self.writeview.frame)+20, KWWidth, self.tableviewheight);
    self.view.height=CGRectGetMaxY(self.tableview.frame);
    
    self.scroll.frame=CGRectMake(0, 0, KWWidth, self.view.height);
    self.scroll.showsVerticalScrollIndicator=NO;
    
    if (self.view.height) {
         self.scroll.contentSize=CGSizeMake(KWWidth,1.2*CGRectGetMaxY(self.tableview.frame)-120);
    }
    
   
  
    self.scroll.backgroundColor=[UIColor clearColor];
   
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset=scrollView.contentInset.top+scrollView.contentOffset.y;
   // NSLog(@"%F,%F",scrollView.contentInset.top,scrollView.contentOffset.y);
   // NSLog(@"%f",offset);
    CGFloat progress=offset/(self.movice.height-20);
    if (progress<=0) {
//        self.scroll.y=offset;
//        self.scroll.height=self.scroll.height-offset;
       // self.movice.y=offset;
        self.movice.y=offset;
        self.movice.height=self.movice.height-offset;
//
//        self.movice.backgroundImage1.contentMode=UIViewContentModeScaleToFill;
    }
    
  NSLog(@"%F,%F",scrollView.contentInset.top,scrollView.contentOffset.y);
    // 1.差距
    CGFloat delta = scrollView.contentOffset.y;
   
    // 刚好能完整看到footer的高度
    CGFloat sawFooterH = 222;
    if (sawFooterH<=delta) {
        self.title=self.name;
       
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault] ;
    }else{
       self.title=nil;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.0]] forBarMetrics:UIBarMetricsDefault] ;
    }

}
-(void)addcommentViewWith:(CGRect)first{
   
    UITableView *tableview=[[UITableView alloc]init];
    tableview.showsVerticalScrollIndicator=NO;
    tableview.scrollEnabled=NO;
    self.tableview=tableview;
   
   
    tableview.x=0;
    tableview.y=CGRectGetMaxY(first)+20;
    self.view.height=CGRectGetMaxY(tableview.frame);
   
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.scroll addSubview:tableview];
    
    
}
#pragma 数据源方法和代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.first.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  KWcommentCell *cell = [KWcommentCell cellWithTableView:tableView];
    cell.commentframe=self.first[indexPath.row];
  
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWcommentFrame *comment=self.first[indexPath.row];
    self.tableviewheight=self.tableviewheight+comment.cellheight;
   
    return comment.cellheight;
}


#pragma mark - 加载微博数据

/**
 *  根据微博模型数组 转成 微博frame模型数据
 *
 *  @param statuses 微博模型数组
 *
 */
- (NSArray *)statusFramesWithStatuses:(NSArray *)statuses
{
    NSMutableArray *frames = [NSMutableArray array];
    for (KWMoviceComment *status in statuses) {
        kWcommentFrame *frame = [[kWcommentFrame alloc] init];
        // 传递微博模型数据，计算所有子控件的frame
        frame.comment= status;
        [frames addObject:frame];
    }
    return frames;
}



-(void)imageisClick:(UITapGestureRecognizer *)recognizer{
    
//    KWphotoView *photo=[[KWphotoView alloc]init];
   
//    photo.currentIndex=i;
//    photo.photos=(NSArray *)self.photos;
//        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:photo];
//    [self presentViewController:nav animated:YES completion:nil];
    
    // 2.1 创建一个photosView
    //int i=(int)recognizer.view.tag;
  
    
//    PYPhotoView *photoview=[[PYPhotoView alloc]init];
//    photoview.photos=self.photos;
//    
//    [self.view addSubview:photoview];
    
    // 设置图片
//    for(int i = 0; i < photosView.subviews.count; i++)
//    {
//        PYPhotoView *photoView = photosView.subviews[i];
//        // 设置标记
//        photoView.tag = i;
//        photoView.photos = self.photos;
//        if (i < self.photos.count) {
//            photoView.hidden = NO;
//            // 设置图片
//            photoView.photo = self.photos[i];
//        }else{
//            photoView.hidden = YES;
//        }
//    
//    }
    
    
}

@end
