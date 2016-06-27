//
//  ChartRootViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "ChartRootViewController.h"
#import "SingleBarChartViewController.h"
#import "MultiBarChartViewController.h"
#import "SingleLineChartViewController.h"
#import "MultiLineChartViewController.h"
#import "PieChartViewController.h"
#import "WaveChartViewController.h"
#import "SingleHorizontalBarChartViewController.h"
#import "MultiHorizontalBarChartViewController.h"
@interface ChartRootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray * nameArray;
@property(nonatomic,strong)UITableView * tableview;
@end

@implementation ChartRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"图表";
    self.nameArray = @[@"柱状图:一组数据(SingleBarChartViewController)",
                       @"柱状图:多组数据(MultiBarChartViewController)",
                       @"线状图:一组数据(SingleLineChartViewController)",
                       @"线状图:多组数据(MultiLineChartViewController)",
                       @"饼图(PieChartViewController)",
                       @"波浪图(WaveChartViewController)",
                       @"柱状图(横向):一组数据(SingleHorizontalBarChartViewController)",
                       @"柱状图(横向):多组数据(MultiHorizontalBarChartViewController)"];
    
    _tableview=[[UITableView alloc]init];
    _tableview.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _tableview.delegate=self;
    _tableview.dataSource=self;
    //去掉多余cell
    _tableview.tableFooterView=[[UIView alloc]init];
    [self.view addSubview:_tableview];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.nameArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13.f];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SingleBarChartViewController * vc =[[SingleBarChartViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if (indexPath.row == 1) {
        MultiBarChartViewController * vc =[[MultiBarChartViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
   if (indexPath.row == 2){
        SingleLineChartViewController * vc = [[SingleLineChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 3){
        MultiLineChartViewController * vc = [[MultiLineChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    //懒得写了 剩下的是直接导入的
    
    if (indexPath.row == 4){
        PieChartViewController * vc = [[PieChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 5){
        WaveChartViewController * vc = [[WaveChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 6){
        SingleHorizontalBarChartViewController * vc = [[SingleHorizontalBarChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 7){
        MultiHorizontalBarChartViewController * vc = [[MultiHorizontalBarChartViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
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
