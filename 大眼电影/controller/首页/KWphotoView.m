//
//  KWphotoView.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/19.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWphotoView.h"

@interface KWphotoView ()
@property(nonatomic,strong)UIScrollView *scrollview;
@property(nonatomic,strong)NSMutableArray *option;
@end

@implementation KWphotoView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"Icon_Web_Stop" target:self action:@selector(back)];
    
    
    UIScrollView *scrollview=[[UIScrollView alloc]init];
    scrollview.backgroundColor=[UIColor whiteColor];
   scrollview.frame=CGRectMake(0, 0, 20*KWWidth, KWheight);
    self.scrollview=scrollview;
     [self.view addSubview:scrollview];
    
    
    for (int i=0; i<20; i++) {
        
        UIImageView *imageview=[[UIImageView alloc]init];
        imageview.backgroundColor=[UIColor blueColor];
       // [imageview sd_setImageWithURL:self.photos[i]];
        imageview.frame=CGRectMake(KWWidth*i, (KWheight-200)/2-64, KWWidth,200 );
        [self.scrollview addSubview:imageview];
        [self.option addObject:imageview];
    }
    
    
   
    
}


-(void)setPhotos:(NSArray *)photos{
    
    
    _photos=photos;
    int a=(int)photos.count;
   ;
    
    self.scrollview.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
   
   
    self.scrollview.contentSize=CGSizeMake(KWWidth * _photos.count, 0);
    self.scrollview.pagingEnabled=YES;
    self.scrollview.showsHorizontalScrollIndicator=NO;
    self.scrollview.showsVerticalScrollIndicator=NO;
    
    for (int i=0; i<a; i++) {
        
        UIImageView *imageview=self.option[i];
        [imageview sd_setImageWithURL:photos[i]];
        //imageview.frame=CGRectMake(KWWidth*i, (KWheight-200)/2, KWWidth,200 );
        //[self.scrollview addSubview:imageview];
        NSLog(@"%@",imageview);
    }
    
    //self.scrollview.contentOffset=CGPointMake(KWWidth*self.currentIndex, 0);
    
   
    

    
   //
   // [self.view addSubview:imageview];

}
-(void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
