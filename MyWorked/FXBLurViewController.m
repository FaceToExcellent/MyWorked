//
//  FXBLurViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/21.
//  Copyright © 2016年 HYZ. All rights reserved.
//

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
    image.frame=CGRectMake(20, 20, 100, 100);
    image.image=[UIImage imageNamed:@"11"];
    [self.view addSubview:image];
    
    _fView=[[FXBlurView alloc]init];
    _fView.frame=CGRectMake(20, 20, 100, 100);
    _fView.blurRadius=0;//模糊半径 越大越模糊 
    [self.view addSubview:_fView];
    
    
    _button = [[UIButton alloc]init];
    _button.frame = CGRectMake(20, 150, 50, 50);
    _button.backgroundColor =[UIColor grayColor];
    _button.tag=1;
    [_button addTarget:self action:@selector(buttonCLick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
    
}
-(void)buttonCLick:(UIButton*)sender
{
    if (_fView.blurRadius < 5)
    {
        [UIView animateWithDuration:0.5 animations:^{
            _fView.blurRadius = 10;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
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
