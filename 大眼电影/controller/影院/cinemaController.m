//
//  cinemaController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "cinemaController.h"
#import "kwmodelmoview.h"
#import "headerView.h"
#import "kwcellADress.h"
#import <CoreLocation/CoreLocation.h>

@interface cinemaController ()<headerViewDelegate,CLLocationManagerDelegate>
@property(nonatomic,strong)NSMutableArray *arraytwo;
@property(nonatomic,strong)CLLocationManager *manger;
@property(nonatomic,strong)UILabel *jingdu;
@property(nonatomic,strong)UILabel *weidu;
@property(nonatomic,strong)CLLocation *clocation;
@end

@implementation cinemaController

-(NSMutableArray *)arraytwo{
    if (_arraytwo==nil) {
        self.arraytwo=[[NSMutableArray alloc]init];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Cities.plist" ofType:nil];
        NSDictionary *arrayM=[NSDictionary dictionaryWithContentsOfFile:path];
        NSMutableArray *muatable=[NSMutableArray array];
        
        
        for (NSArray *array in arrayM) {
            NSArray *array1=arrayM[array];
            NSArray *arr=[kwmodelmoview mj_objectArrayWithKeyValuesArray:array1];
            [muatable addObject:arr];
            
            
            
        }
        
        _arraytwo=[muatable copy];
        
    }
    return _arraytwo;
}
-(CLLocationManager *)manger{
    if (_manger==nil) {
        self.manger= [[CLLocationManager alloc]init];
        self.manger.delegate=self;
        [self.manger requestAlwaysAuthorization];
    }
    return _manger;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [self.manger startUpdatingLocation];
    [self adtableviewheade];
}
-(void)adtableviewheade{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, KWWidth, 70)];
    [self.view addSubview:view];
    view.backgroundColor=[UIColor whiteColor];
    self.tableView.tableHeaderView=view;
    UILabel *ninhao=[[UILabel alloc]init];
    ninhao.text=@"您当前的位置在:";
    CGSize size=[ninhao.text sizeWithFont:ninhao.font];
    ninhao.frame=CGRectMake(10, 10, size.width, size.height);
    
    UILabel *jingdu=[[UILabel alloc]init];
    jingdu.frame=CGRectMake(10, CGRectGetMaxY(ninhao.frame)+10, KWWidth/2-20, size.height);
    self.jingdu=jingdu;
    
    
    UILabel *weidu=[[UILabel alloc]init];
    weidu.frame=CGRectMake(KWWidth/2+10, CGRectGetMaxY(ninhao.frame)+10, KWWidth/2-20, size.height);
    self.weidu=weidu;
    [view addSubview:jingdu];
    [view addSubview:weidu];
    [view addSubview:ninhao];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arraytwo.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    
    NSArray *array=self.arraytwo[section];
    kwmodelmoview *model=array[0];
    if (model.isOpen) {
        return array.count;
        
    }else{
        return 0;
    }
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSArray *array=self.arraytwo[indexPath.section];
    kwmodelmoview *mode=array[indexPath.row];
    
    
    CLLocation *loc1 = [[CLLocation alloc] initWithLatitude:self.clocation.coordinate.latitude longitude:self.clocation.coordinate.longitude];
    CGFloat lat=[mode.lat floatValue];
    CGFloat longvalue=[mode.lng floatValue];
    
    CLLocation *loc2 = [[CLLocation alloc] initWithLatitude:lat longitude:longvalue];
    
    CLLocationDistance distance = [loc1 distanceFromLocation:loc2];
    
    mode.distance=[NSString stringWithFormat:@"%f",distance];
    
    
    
    
//    cell.textLabel.text=mode.nm;
//    cell.detailTextLabel.text=mode.addr;
    
    
    kwcellADress *cell=[kwcellADress modelcell];
    self.tableView.separatorStyle=UITableViewCellStyleDefault;
    cell.modelview=mode;
    
    return cell;
    
    
    
    
}
-(void)headViewDidClickHeaderView:(headerView *)headerView{
    [self.tableView reloadData];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    headerView *headeView=[headerView  headeViewWithTableView:tableView];
    NSArray *array=self.arraytwo[section];
    headeView.qqheadeviewGroup=array[0];
    
    
    headeView.delegate=self;
    return headeView;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *clocation=[locations lastObject];
    self.clocation=clocation;
    self.jingdu.text=[NSString stringWithFormat:@"经度%f",clocation.coordinate.latitude];
    self.weidu.text=[NSString stringWithFormat:@"纬度%f",clocation.coordinate.longitude];
    
}




@end
