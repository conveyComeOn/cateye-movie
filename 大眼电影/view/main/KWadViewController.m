//
//  KWadViewController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/6.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "KWadViewController.h"
#import "KWbeginCarton.h"
#import "UIImageView+WebCache.h"
#import "ViewController.h"
#import "movieController.h"
#import "KWNew.h"
#import "KWNewstool.h"
#import "AFNetworking.h"

@interface KWadViewController ()
@property(nonatomic,strong)NSArray *begincarton;
@end

@implementation KWadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupJsonData];
    [self saveNesDate];
    
  
    
   
    
}



-(void)setupJsonData{
    NSURL *url=[NSURL URLWithString:@"http://api.meituan.com/dianying/posters.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=wjDb0QHGZZMioCDnayBZ%2FKHvDtE%3D&__skno=7C696E83-79FA-4A95-B862-35A2A1A0EFE8&__skts=1457105438.315305&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&city_id=73&client=iphone&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-04-20-56289&poster_type=3&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2"];
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url];
    
    
    
    NSOperationQueue *queue=[NSOperationQueue mainQueue];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if (data) {
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            
            NSMutableArray *array=[[NSMutableArray alloc]init];
            NSArray *array1=dict[@"posters"];
            if (array1.count==0) {
                [self addTwoSecends:0.0];
                return ;
            }
            
            for (NSDictionary *dict in array1 ) {
                KWbeginCarton *model=[KWbeginCarton KWbeginCartonWithDict:dict];
                
                [array addObject:model];
                
                [self addimageWithAd:model.pic];
                
            }
            
            self.begincarton=[array copy];
            
        }
        
        else{
           
        }
    
    }];
}

-(void)addimageWithAd:(NSString *)string{
    UIImageView *imge=[[UIImageView alloc]init];
    CGRect rect=self.view.bounds;
   
    imge.frame=self.view.bounds;
    [imge sd_setImageWithURL:[NSURL URLWithString:string]];
    
    [self.view addSubview:imge];
    
    UIImageView *imageview=[[UIImageView alloc]init];
    UIImage *image=[UIImage imageNamed:@"bg_welcome_logo_red"];
    imageview.frame=CGRectMake((KWWidth-image.size.width/2)/2, KWheight-100, image.size.width/2, image.size.height/2);
    imageview.image=image;
    [imge addSubview:imageview];
    [UIView animateWithDuration:1.5 animations:^{
        CGFloat w=5/KWWidth*KWheight;
        CGRect rect2=CGRectMake(rect.origin.x-5, rect.origin.y-w, KWWidth+10, KWheight+2*w);
        imge.frame=rect2;
    }];
    [self addTwoSecends:4.0];
    
}
-(void)addTwoSecends:(CGFloat)time{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *window=[UIApplication sharedApplication].keyWindow;
        UIStoryboard *stroryboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
        window.rootViewController=[stroryboard instantiateViewControllerWithIdentifier:@"Main"];
    });
}
-(void)saveNesDate{
    NSString *string=@"http://advert.mobile.meituan.com/api/v3/adverts?app=movie&category=all&channelId=1&ci=73&cityid=73&clientType=ios&clienttp=iphone&devid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-08-17-4374&uid=&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version=6.5.2&version_name=6.5.2";
    
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array=responseObject[@"data"];
     
        NSArray *arreytwo=[KWNew mj_objectArrayWithKeyValuesArray:array];
        
        [KWNewstool save:arreytwo];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}



@end
