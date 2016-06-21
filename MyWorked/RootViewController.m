//
//  RootViewController.m
//  MyIdeas
//
//  Created by HYZ on 16/5/31.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "RootViewController.h"
#import "tieziceshiViewController.h"
#import "OOOPPPViewController.h"
#import "TopsearchViewController.h"
#import "ViewActionViewController.h"
#import "MideasTableViewController.h"
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)NSArray *listArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor blueColor];
    self.title=@"练习列表";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
    
    NSForegroundColorAttributeName:[UIColor blueColor]}];
    //加了背景图片就不用加 64 位移了
    
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"11"] forBarMetrics:UIBarMetricsDefault];
    [self makeUI];
}
-(void)makeUI
{
    
    _listArray = @[@"新人在开发初期遇到的各种问题",@"分组点击收起与展开",@"顶部搜索城市",@"改变图片颜色",@"知识点整理2"];
    
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
        tieziceshiViewController *vc =[[tieziceshiViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    if (indexPath.row==1) {
        OOOPPPViewController *vc =[[OOOPPPViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if (indexPath.row==2) {
        TopsearchViewController *vc =[[TopsearchViewController alloc]init];
       
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if (indexPath.row==3) {
        ViewActionViewController *vc =[[ViewActionViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    if (indexPath.row==4) {
        MideasTableViewController *vc =[[MideasTableViewController alloc]init];
        
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
