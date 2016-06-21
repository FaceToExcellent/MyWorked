//
//  UIRootViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/21.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "UIRootViewController.h"

#import "FXBLurViewController.h"

@interface UIRootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)NSArray *listArray;
@end

@implementation UIRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor blueColor];
    self.title=@"UI";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       
       NSForegroundColorAttributeName:[UIColor blueColor]}];
    //加了背景图片就不用加 64 位移了
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"11"] forBarMetrics:UIBarMetricsDefault];
    [self makeUI];
}
-(void)makeUI
{
    
    _listArray = @[@"模糊",@""];
    
    _tableview=[[UITableView alloc]init];
    _tableview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableview.delegate=self;
    _tableview.dataSource=self;
    //去掉多余cell
    _tableview.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:_tableview];
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        //cell 的选中样式
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        cell.textLabel.text= _listArray[indexPath.row];
        cell.tintColor=[UIColor blackColor];
        
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        FXBLurViewController *vc =[[FXBLurViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    
}

//补全 下划线
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
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
