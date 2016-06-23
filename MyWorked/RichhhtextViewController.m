//
//  RichhhtextViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/23.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "RichhhtextViewController.h"
#import "TYAttributedLabel.h"
@interface RichhhtextViewController ()

@end

@implementation RichhhtextViewController
{
    UIScrollView * myScrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeUI];
    
}
-(void)makeUI
{
    myScrollView =[[UIScrollView alloc]init];
    myScrollView.contentOffset=CGPointMake(0, 0);
    myScrollView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    myScrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
    myScrollView.bounces= NO;
    myScrollView.scrollEnabled=YES;
    myScrollView.showsHorizontalScrollIndicator=YES;
    myScrollView.showsVerticalScrollIndicator = YES;
    myScrollView.userInteractionEnabled=YES;
    myScrollView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:myScrollView];
    
    [self addlabels];
}


-(void)addlabels
{
    //1. 简单label
    [self addsimpleLabel];
    
    
    
    
    
    
}

-(void)addsimpleLabel
{
    
    TYAttributedLabel *label =[[TYAttributedLabel alloc]init];
    label.text=@"";
    
    label.characterSpacing =2 ;//文字间隙
    label.linesSpacing = 2;//文本行间隙
    label.lineBreakMode=NSLineBreakByTruncatingMiddle;
    //label.numberOfLines = 3;
    // 文本字体
    label.font = [UIFont systemFontOfSize:17];
    [label  appendImageWithName:@"icon0.jpg" size:CGSizeMake(15, 15)];
    [label appendText:@"简单label简单label简单label简单label"];
    // 设置view的位置和宽，会自动计算高度
    [label setFrameWithOrign:CGPointMake(0,20) Width:CGRectGetWidth(self.view.frame)];
    [myScrollView  addSubview:label];
    
    
    
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
