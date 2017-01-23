//
//  myTableViewController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/3.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "myTableViewController.h"
#import "SEttingmodel.h"
#import "COmentgroup.h"
#import "TableHeaderView.h"
#import "KWbackgroundview.h"
#import "loadinginController.h"
#import "KWHeaderView.h"

@interface myTableViewController ()<KWHeaderViewdelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *option;


@property(nonatomic,strong)UITableView *tableView;

@end

@implementation myTableViewController


-(NSMutableArray *)option{
    if (_option==nil) {
        _option=[[NSMutableArray alloc]init];
        
    }
    return _option;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpgroupItem];
    
    self.tableView     = [[UITableView alloc] initWithFrame:CGRectMake(0,0, KWWidth, KWheight) style:UITableViewStylePlain];

    self.tableView.delegate=self;
    self.tableView.dataSource=self;
   
    self.tableView.showsVerticalScrollIndicator=NO;
   self.tableView.alwaysBounceVertical=NO;
    self.tableView.separatorStyle                 = UITableViewCellSeparatorStyleNone;
  //  [self.tableView registerClass:[KWWeatherCell class] forCellReuseIdentifier:@"ForecastCell"];
    TableHeaderView *view=[TableHeaderView headerview];
    
    
    view.backgroundColor=[UIColor colorWithRed:210.0/255.0  green:38.0/255.0 blue:44.0/255.0 alpha:1.0];
    
    self.tableView.tableHeaderView=view;
    
    KWHeaderView *viewtwo=[[KWHeaderView alloc]initWithFrame:CGRectMake(0, 140, KWWidth, 120)];
    viewtwo.delegate=self;
    
 //   view.frame=CGRectMake(0,140, KWWidth, 200);
    
    
    [view addSubview:viewtwo];
    
   [self.view addSubview:self.tableView];
    
   
    }

-(void)buttonclick:(NSString *)string{
    [self setloadingcontrollerandstring:string];
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
    
     SEttingmodel *item=[SEttingmodel initWithicon:@"ic_mine_my_message" title:@"我的消息"];
    group.item=@[item];
    
    
}
-(void)setUpgroupItem2{
    COmentgroup  *group=[[ COmentgroup  alloc]init];
    [self.option addObject:group];
    SEttingmodel *item=[SEttingmodel initWithicon:@"ic_mine_vip" title:@"猫眼会员"];
    item.detile=@"查看我的特权";
    SEttingmodel * item1=[SEttingmodel initWithicon:@"ic_mine_task" title:@"电影成就"];
    
    group.item=@[item,item1];
}

-(void)setUpgroupItem3{
    COmentgroup  *group=[[COmentgroup  alloc]init];
    [self.option addObject:group];
    SEttingmodel*item=[SEttingmodel initWithicon:@"wallet" title:@"美团钱包"];
    SEttingmodel *item1=[SEttingmodel initWithicon:@"icon_bank" title:@"我的优惠券"];
    SEttingmodel*item2=[SEttingmodel initWithicon:@"ic_mine_my_shopping_center" title:@"商城"];
    SEttingmodel*item3=[SEttingmodel initWithicon:@"wallet__ic_add_item_default" title:@"我购买的商品"];
    
    group.item=@[item,item3,item2,item1];
}
-(void)setUpgroupItem4{
    COmentgroup   *group=[[COmentgroup  alloc]init];
    [self.option addObject:group];
    SEttingmodel*item=[SEttingmodel initWithicon:@"ic_mine_setting" title:@"设置"];
    group.item=@[item];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    COmentgroup  *group=self.option[section];
    
    return group.item.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *id=@"id";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:id];
        
        
    }
    
    COmentgroup  *group=self.option[indexPath.section];
    SEttingmodel *model=group.item[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:model.icon];
    cell.textLabel.text=model.title;
    [cell.detailTextLabel setTextColor:[UIColor redColor]];
    cell.detailTextLabel.text=model.detile;
    cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_cell_rightArrow"]];
        return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==3) {
        return 80;
    }else
        return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 20;
    }
    return 0;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.tableView.tableHeaderView.backgroundColor=kwbackgroundcolor;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    COmentgroup  *group=self.option[indexPath.section];
    SEttingmodel *item=group.item[indexPath.row];
    
    NSLog(@"%@",item.title);
    [self setloadingcontrollerandstring:item.title];
}
-(void)setloadingcontrollerandstring:(NSString *)string{
   

    
 
    loadinginController *newVc = [loadinginController loadingWithString:string];
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:newVc];
   
    [self presentViewController:nav animated:YES completion:nil];
    
  
    
}



@end
