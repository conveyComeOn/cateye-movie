//
//  DetileViewController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/11.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "DetileViewController.h"

@interface DetileViewController ()

@end

@implementation DetileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.title=@"资讯";
   
}


-(void)setNews:(KWFoundNews *)news{
    _news=news;
    AFHTTPRequestOperationManager *manger=[AFHTTPRequestOperationManager manager];
    [manger POST:news.url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
       
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    [manger POST:news.url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@--",error);
    }];
    
    
}

@end
