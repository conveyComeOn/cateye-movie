//
//  foundController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//

#import "foundController.h"
#import "FoundCollectionCell.h"
#import "KWNewstool.h"
#import "KWNew.h"
#import "OnePictureCell.h"
#import "ThreePictureCell.h"
#import "AFNetworking.h"
#import "KWloadMorefooter.h"
#import "labelViewController.h"
#import "DetileViewController.h"
#import "logoview.h"

@interface foundController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property(nonatomic,strong)NSTimer *time;
@property(nonatomic,strong)NSMutableArray *option;
@property(nonatomic,strong)NSMutableArray *commonTitle;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property(nonatomic,strong)NSMutableArray *foundArray;
@property(nonatomic,strong)KWloadMorefooter *footer;
@property(nonatomic,strong)NSArray *url;
@property(nonatomic,assign)int i;
@property (weak, nonatomic) IBOutlet UIView *tableHeaderView;
@property(nonatomic,strong)logoview *logo;

@end

@implementation foundController
-(NSArray *)url{
    if (_url==nil) {
        _url=[[NSArray alloc]init];
        self.url=@[@"http://api.meituan.com/sns/v1/feed.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=RIoWaiqNjn5OR4j3WzDZkqGn%2FIU%3D&__skno=D8DE6304-82AB-401B-B4C1-C611ABA0E579&__skts=1457439752.685991&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&limit=10&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-08-20-14957&offset=0&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2",@"http://api.meituan.com/sns/v1/feed.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=%2FKEjwnTOavDoMARbc7e4X91c0qQ%3D&__skno=B23F48FE-7EC0-4ED1-934D-151D1F6453B9&__skts=1457592930.677299&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&limit=10&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-10-13-5047&offset=10&timestamp=1457592688686&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2",@"http://api.meituan.com/sns/v1/feed.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=FPI3zXrRZXHOaShicMA%2FS5lNQNE%3D&__skno=4C010E01-16B8-4F16-A1CF-449780D3AE33&__skts=1457592980.721773&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&limit=10&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-10-13-5047&offset=20&timestamp=1457592688686&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2",@"http://api.meituan.com/sns/v1/feed.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=v5Z5ETU8Va4HQS2HpZGGrN2SAmM%3D&__skno=DA0791BE-8922-41B5-A316-21F3A740E5B4&__skts=1457593022.532952&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&limit=10&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-10-13-5047&offset=30&timestamp=1457592688686&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2"];
    }
    return _url;
}
-(NSMutableArray *)foundArray{
    if (_foundArray==nil) {
        _foundArray=[NSMutableArray array];
    }
    return _foundArray;
}
-(NSMutableArray *)option{
    if (_option==nil) {
        _option=[NSMutableArray array];
    }
    return _option;
}
-(NSMutableArray *)commonTitle{
    if (_commonTitle==nil) {
        _commonTitle=[[NSMutableArray alloc]init];
    }
    return _commonTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [self addbackgroundimage];
       self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0];
    self.i=0;
    [self loadingData];
    [self addheadviewData];
   
    self.view.backgroundColor=[UIColor whiteColor];
   // self.tableView.tableFooterView.hidden=YES;
 
    
}
     
     
     -(void)addbackgroundimage{
         logoview *logo=[[logoview alloc]initWithFrame:self.view.bounds];
         [self.tableView addSubview:logo];
         self.logo=logo;
         
         
       //  logoview *logo1=[[logoview alloc]initWithFrame:CGRectMake(0, 0, KWheight, 62)];
         
         [self.view addSubview:logo];
                 

     }
-(void)viewWillAppear:(BOOL)animated{
    [self setUpRefeach];
    [self addScollView];
}
-(void)addheadviewData{
    NSArray *array=[KWNewstool news];
    for (KWNew *new in array) {
        if (new.standIdList.count) {
            CGFloat i=(int)new.standIdList[0];
            
            if ( i==227) {
                [self.option addObject:new.imgUrl];
                [self.commonTitle addObject:new.commonTitle];
                
            }
        }

        }
        
        
        }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addScollView{
    self.tableView.tableHeaderView=self.tableHeaderView;
    self.collection.delegate=self;
    self.collection.dataSource=self;
    self.pagecontrol.numberOfPages=self.commonTitle.count;
    [self.collection registerNib:[UINib nibWithNibName:@"FoundCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"collectionCell"];
     [self addtimer];
    
   
}
-(void)setUpRefeach{
    KWloadMorefooter *footer=[KWloadMorefooter footer];
    self.tableView.tableFooterView=footer;
    self.footer=footer;
    
    
}
-(void)addtimer{
    NSTimer *time=[NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(next) userInfo:nil repeats:YES];
   [[NSRunLoop mainRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    self.time=time;
}
-(void)next{
    NSIndexPath *indexpath=[[self.collection indexPathsForVisibleItems]lastObject];
    int item=(int)indexpath.item;
    int row=(int)indexpath.section;
    item++;
    
    if (item>=self.option.count) {
        item=0;
        row++;
        if (row>=10) {
            row=5;
        }
        
    }
   
   
    NSIndexPath *newpath=[NSIndexPath indexPathForItem:item inSection:row];
    [self.collection scrollToItemAtIndexPath:newpath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.option.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FoundCollectionCell *cell=[self.collection dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.icon=self.option[indexPath.row];
    cell.commonTitle=self.commonTitle[indexPath.row];
    return cell;
}
#pragma 添加手式
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.time invalidate];
    self.time=nil;
}


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    [self addtimer];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
     int i= (int)(self.collection.contentOffset.x/KWWidth+0.5);
   
   // self.pagecontrol.currentPage=i%self.option.count;
    
    if ( self.foundArray.count <= 0||self.footer.isRefreshing) return;
    
    
    if (self.i>=self.url.count){
        self.footer.title=@"暂无更多数据";
    }else{
    CGFloat middle=scrollView.contentSize.height-scrollView.contentOffset.y;
    CGFloat sawFooter=self.view.height-self.tabBarController.tabBar.height;
   
    
    if (middle==sawFooter) {
        [self.footer beginRefeach];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self loadingData];
            
        });
    }
    }

    
}


#pragma 数据源方法和代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return  self.foundArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
         KWFoundNews *news=self.foundArray[indexPath.row];
   
        if (news.images.count<3) {
            static NSString *id=@"tg";
            OnePictureCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
            if (cell==nil) {
                cell=[OnePictureCell onePicture];
            }
            cell.foundnew=news;
           return cell;
        }else{
            static NSString *id=@"guodang";
            ThreePictureCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
            if (cell==nil) {
                cell=[ThreePictureCell threePicture];
                
            }
            cell.foundNew=news;
            return cell;
        }
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    KWFoundNews *news=self.foundArray[indexPath.row];
    if (news.images.count<3) {
        return 123;
    }else{
        return 156;
    }
}


-(void)loadingData{
    
    
    NSString *string=self.url[self.i];
    self.i++;
    
    if (self.i>self.url.count) return;
    
    //    [MBProgressHUD showMessage:@"正在努力加载中"];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        
        NSDictionary *dicttwo=responseObject[@"data"];
        NSArray *array=dicttwo[@"feeds"];
       
        
     
      
        
        
      NSArray *arraytwo=[KWFoundNews mj_objectArrayWithKeyValuesArray:array];
        
        for (int i=0; i<arraytwo.count; i++) {
            NSArray *arraythree=arraytwo[i];
            [self.foundArray addObject:arraythree];
        }
       
        self.tableView.tableFooterView.hidden=NO;
        
        [self.footer endRefeach];
      
        self.logo.hidden=YES;
        [self.tableView reloadData];
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     KWFoundNews *news=self.foundArray[indexPath.row];
     self.navigationController.tabBarController.tabBar.hidden=YES;
    if (news.tag) {
        labelViewController *label=[[labelViewController alloc]init];
        
        [self.navigationController pushViewController:label animated:YES];
    }else{
        DetileViewController *detile=[[DetileViewController alloc]init];
        detile.news=news;
        [self.navigationController pushViewController:detile animated:YES];
    }
   
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [self endtime];
}
-(void)endtime{
    [self.time invalidate];
    self.time=nil;
}
@end
