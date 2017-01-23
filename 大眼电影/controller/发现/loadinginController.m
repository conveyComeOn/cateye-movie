//
//  loadinginController.m
//  大眼电影
//
//  Created by kangweihexiaocong on 16/3/3.
//  Copyright © 2016年 kangweihexiaocong. All rights reserved.
//
#define kwbackcolor [UIColor colorWithRed:244.0/255.0  green:244.0/255.0 blue:244.0/255.0 alpha:1.0]
#import "loadinginController.h"
#import "MBProgressHUD+MJ.h"

@interface loadinginController ()
@property(nonatomic,strong)UIImageView *imag;
@property(nonatomic,strong)UIImageView *imag1;
@property(nonatomic,strong)UITextField *field1;
@property(nonatomic,strong)UITextField *field;
@end

@implementation loadinginController

- (void)viewDidLoad {
    [super viewDidLoad];
      
    self.view.backgroundColor=kwbackcolor;
    
    self.title=@"登陆";
    [self setbarButtonitem];
    //添加图片以及各种label
    [self setupimageaAndlabel];
    
    [self addloadInButton];
    [self addqqIcon];
    
}
+(instancetype)loadingWithString:(NSString *)string{
    loadinginController *load=[[self alloc]init];
    string=[NSString stringWithFormat:@"登录之后查看%@",string];
  //  [MBProgressHUD showError:[NSString stringWithFormat:@"登录之后查看%@",string]];
    //[MBProgressHUD showMessage:[NSString stringWithFormat:@"登录之后查看%@",string] toView:nil];
    
    MBProgressHUD * HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText=string;
     [HUD hide:YES afterDelay:1.5];
    
    return load;
    
}


-(void)setbarButtonitem{
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"忘记密码" style:UIBarButtonItemStylePlain target:self action:@selector(composeMsg)];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"Icon_Web_Stop" target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithImageName:@"psbb" target:self action:@selector(composeMsg)];
}
-(void)setupimageaAndlabel{
    UIImage *image=[UIImage imageNamed:@"AppIcon60x60"];
    UIImageView *imageview=[[UIImageView alloc]init];
    imageview.image=image;
    imageview.x=KWWidth/2-image.size.width/2;
    imageview.y=20;
    imageview.size=image.size;
    [self.view addSubview:imageview];
    
    UILabel *label=[[UILabel alloc]init];
    label.text=@"美团账号登陆";
    label.font=[UIFont systemFontOfSize:12];
    CGSize size=[label.text sizeWithFont:label.font];
    label.frame=CGRectMake(10, imageview.y+imageview.height+15, size.width, size.height);
    [self.view addSubview:label];
    
    UITextField *field=[[UITextField alloc]init];
  
    self.field=field;
    field.backgroundColor=[UIColor whiteColor];
    field.placeholder=@"手机号/邮箱/用户名";
    
    field.y=CGRectGetMaxY(label.frame)+10;
    field.x=0;
    field.width=KWWidth;
    field.height=40;
    UIImageView *imag=[[UIImageView alloc]init];
    self.imag=imag;
    imag.image=[UIImage imageNamed:@"chat_ic_chat_info_pressed副本"];
    
    
    imag.frame=CGRectMake(0, 0, imag.width, field.height);
    field.leftViewMode=UITextFieldViewModeAlways;
    
    field.leftView=(UIView *)imag;
    [self.view addSubview:field];

  
    CGFloat writh=CGRectGetMaxY(field.frame);
    
    UITextField *field1=[[UITextField alloc]init];
    self.field1=field1;
    field1.backgroundColor=[UIColor whiteColor];
    field1.placeholder=@"密码";
    field1.y=writh+2;
    field1.x=0;
    field1.width=KWWidth;
    field1.height=40;
    UIImageView *imag1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wallet__ic_payment_password副本"]];
    
    
    self.imag1=imag1;
    
    imag.frame=CGRectMake(0, 0, imag1.width, imag1.height);
    field1.leftViewMode=UITextFieldViewModeAlways;
    field1.leftView=(UIView *)imag1;

    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(begineding:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(endeding1:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [self.view addSubview:field1];
}
-(void)composeMsg{
    NSLog(@"忘记密码");
}
-(void)back{
  
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)begineding:(NSNotification *) note{
    if (note.object==self.field1){
        self.imag1.image=[UIImage imageNamed:@"wallet__ic_payment_password副本1"];
    }else{
        self.imag.image=[UIImage imageNamed:@"chat_ic_chat_info_pressed副本1-1"];
    }
    
}


-(void)endeding1:(NSNotification *) note{
    if (note.object==self.field1) {
        self.imag1.image=[UIImage imageNamed:@"wallet__ic_payment_password副本"];
             }
    else{
         self.imag.image=[UIImage imageNamed:@"chat_ic_chat_info_pressed副本"];
    }
  
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   self.imag1.image=[UIImage imageNamed:@"wallet__ic_payment_password副本"];
    self.imag.image=[UIImage imageNamed:@"chat_ic_chat_info_pressed副本"];
 [self.field resignFirstResponder];
    [self.field1 resignFirstResponder];
}



-(void)addloadInButton{
    UIImage *image=[UIImage imageNamed:@"yellowButtonnomal"];
    UIImage *imageheight=[UIImage imageNamed:@"yellowButton"];
    CGFloat wetghe=image.size.width/2;
    CGFloat height=image.size.height/2;
    UIImage *image1=[image resizableImageWithCapInsets:UIEdgeInsetsMake(wetghe, height, wetghe, height) resizingMode:UIImageResizingModeStretch];
    UIImage *imageheight1=[imageheight resizableImageWithCapInsets:UIEdgeInsetsMake(wetghe, height, wetghe, height) resizingMode:UIImageResizingModeStretch];
    UIButton *button=[[UIButton alloc]init];
    CGFloat y=CGRectGetMaxY(self.field1.frame);
    button.frame=CGRectMake(10, y+15, KWWidth-20, 35);
    [button setBackgroundImage:image1 forState:UIControlStateNormal];
    [button setBackgroundImage:imageheight1 forState:UIControlStateHighlighted];
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:button];
  
    
    
    
    UIButton *btn=[[UIButton alloc]init];
    [btn setTitle:@"立即注册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
  
    btn.titleLabel.font=[UIFont systemFontOfSize:12];
    CGSize size=[btn.titleLabel.text sizeWithFont:btn.titleLabel.font];
    CGFloat btny=CGRectGetMaxY(button.frame)+5;
    btn.frame=CGRectMake(10, btny, size.width, size.height);

    
    [self.view addSubview:btn];
    
    UIButton *btntwo=[[UIButton alloc]init];
    [btntwo setTitle:@"手机快捷登录" forState:UIControlStateNormal];
    [btntwo setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    btntwo.titleLabel.font=[UIFont systemFontOfSize:12];
    CGSize size1=[btntwo.titleLabel.text sizeWithFont:btn.titleLabel.font];
    
    btntwo.frame=CGRectMake(KWWidth-size1.width-30, btny, size1.width+20, size1.height);
    [btntwo setImage:[UIImage imageNamed:@"icon_cell_rightArrow_disabled副本"] forState:UIControlStateNormal];
    btntwo.imageEdgeInsets=UIEdgeInsetsMake(0, size1.width+16, 0, 0);
    
    [self.view addSubview:btntwo];
  
}


-(void)addqqIcon{
    UIButton *qq=[[UIButton alloc]init];
    [qq setImage:[UIImage imageNamed:@"ic_share_qq"] forState:UIControlStateNormal];
    qq.frame=CGRectMake(KWWidth/2-40, KWheight-120, 30, 30);
    UIButton *weibo=[[UIButton alloc]init];
    [weibo setImage:[UIImage imageNamed:@"ic_share_sina"] forState:UIControlStateNormal];
    weibo.frame=CGRectMake(KWWidth/2+10, KWheight-120, 30, 30);
    
    [self.view addSubview:qq];
    [self.view addSubview:weibo];
    
}







-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
