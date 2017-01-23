//
//  TableHeaderView.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/2.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "TableHeaderView.h"
#import "KWHeaderView.h"

@interface TableHeaderView()



@end

@implementation TableHeaderView



+(instancetype)headerview{
    

    
 return [[[NSBundle mainBundle]loadNibNamed:@"TableHeaderView" owner:nil options:nil]lastObject];

     
}

@end
