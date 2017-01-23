//
//  myController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "myController.h"
#import "KWHeaderView.h"
#import "TableHeaderView.h"
#import "SEttingmodel.h"
#import "COmentgroup.h"

@interface myController ()
@property(nonatomic,strong)NSMutableArray *option;
@end

@implementation myController
//-(instancetype)init{
//   
//    return [self initWithStyle:UITableViewStyleGrouped];
//    
//}
-(NSMutableArray *)option{
    if (_option==nil) {
        _option=[NSMutableArray array];
        
    }
    return _option;
}

- (void)viewDidLoad {
    [super viewDidLoad];
[self setUpgroupItem];
  
//    self.tableView.sectionHeaderHeight=0;
//    self.tableView.sectionFooterHeight=0;
//    self.tableView.contentInset=UIEdgeInsetsMake(10, 0, 0, 0);
//
//    self.tableView.alwaysBounceVertical=NO;
    

    
 
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}
-(void)setUpgroupItem{
    [self setUpgroupItem1];
    [self setUpgroupItem2];
    [self setUpgroupItem3];
    [self setUpgroupItem4];
}

-(void)setUpgroupItem1{
    COmentgroup  *group=[[COmentgroup alloc]init];
    [self.option addObject:group];
    
    SEttingmodel *item=[SEttingmodel initWithicon:@"tabbar_message_center" title:@"我的消息"];
    group.item=@[item];
    
    
}
-(void)setUpgroupItem2{
    COmentgroup  *group=[[COmentgroup alloc]init];
    [self.option addObject:group];
    SEttingmodel *item=[SEttingmodel initWithicon:@"ic_mine_vip" title:@"猫眼会员"];
    SEttingmodel *item1=[SEttingmodel initWithicon:@"ic_mine_task" title:@"电影成就"];
    
    group.item=@[item,item1];
}

-(void)setUpgroupItem3{
    COmentgroup  *group=[[COmentgroup alloc]init];
    [self.option addObject:group];
    SEttingmodel *item=[SEttingmodel initWithicon:@"wallet" title:@"美团钱包"];
    SEttingmodel *item1=[SEttingmodel initWithicon:@"icon_bank" title:@"我的优惠券"];
    SEttingmodel *item2=[SEttingmodel initWithicon:@"ic_mine_my_shopping_center" title:@"商城"];
    SEttingmodel *item3=[SEttingmodel initWithicon:@"wallet__ic_add_item_default" title:@"我购买的商品"];

    group.item=@[item,item1,item2,item3];
}
-(void)setUpgroupItem4{
    COmentgroup  *group=[[COmentgroup alloc]init];
    [self.option addObject:group];
    SEttingmodel *item=[SEttingmodel initWithicon:@"ic_mine_setting" title:@"设置"];
    group.item=@[item];
}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    COmentgroup *group=self.option[section];

    return group.item.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *id=@"id";
   UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:id];
 
        
    }
    
    COmentgroup *group=self.option[indexPath.section];
    SEttingmodel *model=group.item[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:model.icon];
    cell.textLabel.text=model.title;
    
    return cell;
}

//
//-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 44;
//}


//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//   // UIView *view=[[UIView alloc]init];
// 
//
//    return view;
//}

@end
