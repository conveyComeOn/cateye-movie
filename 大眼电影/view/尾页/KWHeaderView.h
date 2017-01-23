//
//  KWHeaderView.h
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/16.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KWHeaderViewdelegate <NSObject>


-(void)buttonclick:(NSString *)string;

@end


@interface KWHeaderView : UIView

@property(nonatomic,strong)id<KWHeaderViewdelegate> delegate;


@end
