//
//  headerView.h
//  QQ聊天分组
//
//  Created by kangweihexiaocong on 15/11/16.
//  Copyright © 2015年 kangweihexiaocong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class qqGroupModel,headerView,kwmodelmoview;


@protocol headerViewDelegate <NSObject>

-(void)headViewDidClickHeaderView:(headerView *)headerView;

@end





@interface headerView : UITableViewHeaderFooterView


+(instancetype)headeViewWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)kwmodelmoview *qqheadeviewGroup;
@property(nonatomic,weak)id<headerViewDelegate> delegate;
@end
