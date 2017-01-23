//
//  movieController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/2/15.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//
static NSString *kcellIdentifier = @"collectionCellID";
#import "movieController.h"
#import "SQCollectionCell.h"
#import "KWbeginCarton.h"
#import "FIrstCellFootview.h"
#import "KWheadLines.h"
#import "KWheadlineCell.h"
#import "AFNetworking.h"
#import "KWStatus.h"
#import "MBProgressHUD+MJ.h"
#import "KWNewstool.h"
#import "KWNew.h"
#import "KWloadMorefooter.h"
#import "videoViewController.h"
#import "moviceDetileController.h"
#import "logoview.h"

@interface movieController ()<UICollectionViewDelegate,UICollectionViewDataSource,KWheadlineCellDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;

@property(nonatomic,strong)NSMutableArray *option;
@property(nonatomic,strong)NSTimer *time ;
@property(nonatomic,strong)NSArray *headlineArray;
@property(nonatomic,strong)NSMutableArray *importStatus;
@property(nonatomic,strong) KWloadMorefooter *footer;
@property(nonatomic,assign)int i ;
@property(nonatomic,strong)NSArray *url;
@property(nonatomic,strong)logoview *logo;
@end

@implementation movieController
-(NSArray *)url{
    if (_url==nil) {
        _url=[[NSArray alloc]init];
        self.url=@[@"http://api.meituan.com/mmdb/movie/v2/list/hot.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=qai%2FpNaSwl9FAss77PBgGcPzXhk%3D&__skno=C63790D9-4E23-449C-B967-317D89A885F4&__skts=1457269687.288413&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&ct=%E9%83%91%E5%B7%9E&dt=2016.03.06&lat=34.83297092525219&limit=12&lng=113.5384876400541&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-06-20-54601&net=255&offset=0&order=show_desc&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2",@"http://api.meituan.com/mmdb/movie/v2/list/hot.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=TpPsdo90O1zr7ynKXFKixRYYhmg%3D&__skno=BC4C07D3-9810-46D6-9AF3-DD576817157A&__skts=1457589206.643016&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&ct=%E9%83%91%E5%B7%9E&dt=2016.03.10&lat=34.83307376595896&limit=12&lng=113.5385014058382&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-10-13-5047&net=255&offset=12&order=show_desc&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2",@"http://api.meituan.com/mmdb/movie/v2/list/hot.json?__skck=3c0cf64e4b039997339ed8fec4cddf05&__skcy=BNm9ePSz%2FrWOJcO9KyVDhGuOHlo%3D&__skno=104675B0-1D3F-409F-A200-98BBE90FCEA7&__skts=1457589994.120675&__skua=ad525be9c1650b700e3989b91b32fb4d&__vhost=api.maoyan.com&ci=73&client=iphone&ct=%E9%83%91%E5%B7%9E&dt=2016.03.10&lat=34.83309885064695&limit=12&lng=113.5385084128098&movieBundleVersion=100&msid=D4ECE835-C800-4155-B7B4-03AA67024A0B2016-03-10-13-5047&net=255&offset=24&order=show_desc&utm_campaign=AmovieBmovie&utm_content=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&utm_medium=iphone&utm_source=AppStore&utm_term=6.5.2&uuid=ACC0C5F051DA7137FC53FDF4A851E5A658755DE911BF5F929988F3B15DA949A5&version_name=6.5.2"];
        
    }
    return _url;
}

-(NSMutableArray *)importStatus{
    if (_importStatus==nil) {
        _importStatus=[[NSMutableArray alloc]init];
    }
    return _importStatus;
}
-(NSMutableArray *)option{
    if (_option==nil) {
      self.option=[[NSMutableArray alloc]init];
        
    }
    return _option;
}
-(NSArray *)headlineArray{
    if (_headlineArray==nil) {
        self.headlineArray=[[NSArray alloc]init];

        
   }
    return _headlineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addbackgroundimage];
    self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:210.0/255.0 green:38.0/255.0 blue:44.0/255.0 alpha:1.0];
    self.i=0;
        [self loadingData];
    [self addheadviewData];
    
    
   
   
}

-(void)addbackgroundimage{
    logoview *logo=[[logoview alloc]initWithFrame:self.view.bounds];
    logoview *logo1=[[logoview alloc]initWithFrame:CGRectMake(0, 0, KWheight, 62)];
   
    [logo1 insertSubview:self.tableView atIndex:1];
    
    
    
    [self.navigationController.view insertSubview:logo1 belowSubview:self.tableView.tableHeaderView];
    
    //[self.tableView addSubview:logo1];
    [self.tableView addSubview:logo];
    self.logo=logo;
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
         
            if ( i==179) {
                [self.option addObject:new.imgUrl];
                
            }

        }
 }
}
    
-(void)addScollView{
    self.tableView.tableHeaderView=self.collection;
    
    //通过Nib生成cell，然后注册 Nib的view需要继承 UICollectionViewCell
   [self.collection registerNib:[UINib nibWithNibName:@"SQCollectionCell" bundle:nil] forCellWithReuseIdentifier:kcellIdentifier];
    self.collection.dataSource=self;
    self.collection.delegate=self;
    NSIndexPath *path=[NSIndexPath indexPathForItem:0 inSection:4];
    [self.collection scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
     [self addtimer];
    
}



-(void)setUpRefeach{
   
    KWloadMorefooter *footer1=[KWloadMorefooter footer];
    [footer1 beginRefeach];
    self.tableView.tableFooterView=footer1;
    self.footer=footer1;
   // self.tableView.tableFooterView.hidden=YES;
}


-(void)addtimer{
    NSTimer *time1=[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(next1) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:time1 forMode:NSRunLoopCommonModes];
    self.time=time1;
}

-(void)next1{
    NSIndexPath *indexpath=[[self.collection indexPathsForVisibleItems]lastObject];
    int item=(int)indexpath.item;
    int row=(int)indexpath.section;
    item++;
   
   
    if (item>=self.option.count) {
        
        item=0;
        row++;
        if (row>=10) {
            row=0;
        }
        
    }

    NSIndexPath *newpath=[NSIndexPath indexPathForItem:item inSection:row];
     [self.collection scrollToItemAtIndexPath:newpath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
   
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.option.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SQCollectionCell *cell=[self.collection dequeueReusableCellWithReuseIdentifier:kcellIdentifier forIndexPath:indexPath];
    cell.icon=self.option[indexPath.row];
    return cell;
}
-(void)endtime{
    [self.time invalidate];
    self.time=nil;
}
-(void)viewDidDisappear:(BOOL)animated{
    [self endtime];
}

#pragma 添加手式
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    [self endtime];
}


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    [self addtimer];
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ( self.importStatus.count == 0)
        return;
    if (self.i>=self.url.count){
        self.footer.title=@"暂无更多数据";
    }else{
    // 1.差距
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    // 刚好能完整看到footer的高度
    CGFloat sawFooterH = self.view.height - self.tabBarController.tabBar.height;
    
    // 2.如果能看见整个footer
    if (delta == (sawFooterH - 0)) {
        // 进入上拉刷新状态
        [self.footer beginRefeach];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 加载更多的微博数据
         [self loadingData];
           
        });
    }
    }
}
#pragma tableview的数据源方法和代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
        return self.importStatus.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *array=self.importStatus[section];
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *id=@"cell";
    KWheadlineCell *cell=[tableView dequeueReusableCellWithIdentifier:id];
    
    if (cell==nil) {
        cell=[KWheadlineCell headline];
        cell.delegate=self;
        NSArray *array=self.importStatus[indexPath.section];
     
       
        KWStatus *status=array[indexPath.row];
    
        cell.status=status;
        
        cell.tag=status.id;
        
        
         
   }
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 132;
    
}


-(void)loadingData{
    
//    if (self.i>=self.url.count)
//     
//                  return ;
    
    
    NSString *string=self.url[self.i];
    
   
  
    if (self.i+1>self.url.count) return;

    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"application/x-javascript", nil]];
       [manager GET:string parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
         
                NSDictionary *dicttwo=responseObject[@"data"];
                NSArray *array=dicttwo[@"hot"];
        
         NSArray *arraythree=[KWStatus mj_objectArrayWithKeyValuesArray:array];
        NSMutableArray *mutable=[[NSMutableArray alloc]init];
        
       
        if (self.i==0) {
            self.i++;
        
            NSDictionary *dictthree=array[0];
            self.headlineArray=dictthree[@"newsHeadlines"];
            
            
            NSArray *ar=arraythree[0];
            
            NSMutableArray *mutab=[[NSMutableArray alloc]init];
            [mutab addObject:ar];
            [self.importStatus addObject:mutab];
            
            for (int i=1; i<=array.count-1; i++) {
                NSArray *arr=arraythree[i];
                
                [mutable addObject:arr];
                
            }
      
        }else{
            self.i++;
           
            for (int i=0; i<=array.count-1; i++) {
                NSArray *arr=arraythree[i];
                [mutable addObject:arr];
            }
        }
        
        
        [self.importStatus addObject:mutable];
    
           self.logo.hidden=YES;
        
          
      [self.footer endRefeach];
           [self.tableView reloadData];
    
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    

    
   
    

}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   
    if (section==0) {
      
        FIrstCellFootview *view=[FIrstCellFootview footview];
        
        
        
        view.headline=self.headlineArray;
          return view;
    }else{
        
        KWloadMorefooter *footer=[KWloadMorefooter footer];
        return footer;
    }
  
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height=0.0;
    
    
    while (section==0) {
        
        height=80.0;
       
        return height;
        break;
    }
     return height;
    
   }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 //   [self endtime];
    moviceDetileController *detile=[[moviceDetileController alloc]init];
    NSArray *array=self.importStatus[indexPath.section];
    
    
    KWStatus *status=array[indexPath.row];
    detile.status=status;
    self.navigationController.tabBarController.tabBar.hidden=YES;
    [self.navigationController pushViewController:detile animated:YES];
}

#pragma cell的代理方法
-(void)AcellIsclick:(KWheadlineCell *)cell withtag:(NSInteger)tag{
    KWheadlineCell *cell1=(KWheadlineCell *)[self.view viewWithTag:tag];
    
   
    
    
   videoViewController *viewcontrol=[[videoViewController alloc]init];
    viewcontrol.status=cell1.status;
   
    self.navigationController.tabBarController.tabBar.hidden=YES;
 //  self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:viewcontrol animated:YES];
}

@end
