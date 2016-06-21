//
//  FXBLurViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/21.
//  Copyright © 2016年 HYZ. All rights reserved.
// https://github.com/Tim9Liu9/TimLiu-iOS#下拉刷新

#import "FXBLurViewController.h"
#import "FXBlurView.h"// 模糊效果 对于 UIView  需要 库 QuartzCore Accelerate uikit foundation CoreGraphics 
@interface FXBLurViewController ()
@property(nonatomic,strong)FXBlurView * fView;
@property(nonatomic,strong) UIButton * button;
@end

@implementation FXBLurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"模糊";
    [self makeUI];
    
}
-(void)makeUI
{
    UIImageView * image  =[[UIImageView alloc]init];
    image.frame=CGRectMake(20, 20, 200, 200);
    image.image=[UIImage imageNamed:@"11"];
    [self.view addSubview:image];
    
    _fView=[[FXBlurView alloc]init];
    _fView.frame=CGRectMake(20, 20, 200, 200);
    _fView.blurRadius=0;//模糊半径 越大越模糊
    _fView.dynamic=YES;//是否动态更新
    _fView.tintColor=[UIColor clearColor];//本身颜色
    //_fView.updateInterval= 1.0; 更新时间间隔
    [image addSubview:_fView];
    
    
    _button = [[UIButton alloc]init];
    _button.frame = CGRectMake(20, 250, 50, 50);
    _button.backgroundColor =[UIColor grayColor];
    _button.tag=1;
    [_button addTarget:self action:@selector(buttonCLick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
    
}
-(void)buttonCLick:(UIButton*)sender
{
    //模糊动画感觉并不很好 本身的模糊为 0 的时候 视图还是会有点不清晰 应该适用于那种 推上来的情况 由一侧推出 就像iPhone的底部上滑
    
    //个人觉得 另一个 swift版本的模糊写的更好 地址 ：https://github.com/szk-atmosphere/SABlurImageView或者 https://github.com/FlexMonkey/Blurable 
    if (_fView.blurRadius < 5)
    {
        [UIView animateWithDuration:0.01 animations:^{
            _fView.blurRadius = 40;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.01 animations:^{
           _fView.blurRadius = 0;
        }];
    }
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
