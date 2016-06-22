//
//  DemoVC1.m
//  MyWorked
//
//  Created by HYZ on 16/6/22.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "DemoVC1.h"

@interface DemoVC1 ()
{
    UILabel *_autoWidthLabel;
}

@end

@implementation DemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // demo1.内容自适应view
    [self setupautoHeightView];
    
    // demo2.宽度自适应label
    [self setupAutoWidthLabel];
    // demo3.高度自适应label
    [self setupAutoHeightLabel];
    
    // demo4.设置button根据文字size自适应
    [self setupAutoSizeButton];
}
#pragma mark 内容自适应view
-(void)setupautoHeightView
{
    /*
     设置view1高度根据子view而自适应(在view1中加入两个子view(testLabel和testView)
     ，然后设置view1高度根据子view内容自适应)
     */
    
    UILabel * subview1=[UILabel new];
    subview1.text=@"这个紫色的label会根据这些文字内容高度自适应；而这个灰色的父view会根据紫色的label和橙色的view具体情况实现高度自适应。****************^^^^^^^&&&&&&&&&&^^^^^^^^666666";
    subview1.backgroundColor=[UIColor purpleColor];
    UIView * subview2 =[UIView new];
    subview2.backgroundColor= [UIColor orangeColor];
    [self.view1 sd_addSubviews:@[subview1,subview2]];
    
    subview1.sd_layout.leftSpaceToView(self.view1,10)
    .rightSpaceToView(self.view1,10).topSpaceToView(self.view1,10).autoHeightRatio(0);//设置文本内容自适应，如果这里的参数为大于0的数值则会以此数值作为view的高宽比设置view的高度
    
    subview2.sd_layout.topSpaceToView(subview1,10).widthRatioToView(subview1,1).heightIs(30).leftEqualToView(subview1);
    // view1使用高度根据子view内容自适应，所以不需要设置高度，而是设置“[self.view1 setupAutoHeightWithBottomView:testView bottomMargin:10];”实现高度根据内容自适应
    
    self.view1.sd_layout.leftSpaceToView(self.view,10).topSpaceToView(self.view,80).rightSpaceToView(self.view,10);
     // 设置view1高度根据子其内容自适应
    [self.view1 setupAutoHeightWithBottomView:subview2 bottomMargin:10];
    
}
// demo2.宽度自适应label
- (void)setupAutoWidthLabel
{
    /*
     设置view1高度根据子view而自适应(在view1中加入两个子view(testLabel和testView)
     ，然后设置view1高度根据子view内容自适应)
     */
    
    UILabel * autoWidthlabel =[UILabel new];
    autoWidthlabel.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    _autoWidthLabel =autoWidthlabel;
    autoWidthlabel.font=[UIFont systemFontOfSize:12];
    autoWidthlabel.text=@"****宽度自适应(距离父view右边距10)";
    [self.view addSubview:autoWidthlabel];
    
    autoWidthlabel.sd_layout.rightSpaceToView(self.view,10).heightIs(20).bottomSpaceToView(self.view,160);
    [autoWidthlabel setSingleLineAutoResizeWithMaxWidth:400];
    
}
// demo3.高度自适应label
- (void)setupAutoHeightLabel
{
    UILabel *autoHeightlabel = [UILabel new];
    autoHeightlabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    autoHeightlabel.font = [UIFont systemFontOfSize:12];
    autoHeightlabel.text = @"高度自适应(距离父view左边距10，底部和其右侧label相同，宽度为100)";
    
    [self.view addSubview:autoHeightlabel];
    
    autoHeightlabel.sd_layout
    .bottomEqualToView(_autoWidthLabel)
    .leftSpaceToView(self.view, 10)
    .widthIs(100)
    .autoHeightRatio(0);
    
}

// demo4.设置button根据文字size自适应
- (void)setupAutoSizeButton
{
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"button根据文字自适应" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    btn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view1, 100);
    
    // 设置button根据文字size自适应
    [btn setupAutoSizeWithHorizontalPadding:10 buttonHeight:25];
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
