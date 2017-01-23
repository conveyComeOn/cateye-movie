//
//  labelViewController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/12.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "labelViewController.h"

@interface labelViewController ()

@end

@implementation labelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title=@"帖子详情";
    UIBarButtonItem *item=[UIBarButtonItem itemWithImageName:@"icon_collect" target:self action:@selector(collect)];
    
    UIBarButtonItem *item1=[UIBarButtonItem itemWithImageName:@"icon_share" target:self action:@selector(share)];
    self.navigationItem.rightBarButtonItems=@[item1,item];
    
}
-(void)collect{
    
}

-(void)share{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
