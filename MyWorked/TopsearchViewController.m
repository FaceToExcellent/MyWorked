//
//  TopsearchViewController.m
//  MyIdeas
//
//  Created by HYZ on 16/6/2.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "TopsearchViewController.h"

@interface TopsearchViewController ()<UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property(strong, nonatomic) UISearchController * searchC;
@property(strong, nonatomic) NSMutableArray *allCities; // 所有城市
@property(strong, nonatomic) NSMutableArray *filteredCities; // 根据searchController搜索的城市
@property(strong,nonatomic)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * isOpen ;//展开状态记录
@end

@implementation TopsearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"顶部搜索";
    
    _tableView =[[UITableView alloc]init];
    self.tableView.frame =CGRectMake(0,0, self.view.frame.size.width
                                     , self.view.frame.size.height);
    
    _tableView.delegate =self;
    _tableView.dataSource=self;
    _tableView.separatorStyle= UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    
 
    _searchC = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    _searchC.searchBar.frame = CGRectMake(_searchC.searchBar.frame.origin.x, _searchC.searchBar.frame.origin.y, _searchC.searchBar.frame.size.width, 50);
    //[self.view addSubview:_searchC.searchBar];
    // 设置代理
    _searchC.searchResultsUpdater = self;
    _searchC.searchBar.delegate = self;
    
    // 不变灰
        _searchC.dimsBackgroundDuringPresentation = NO;
    
    [_searchC.searchBar sizeToFit];
    self.tableView.tableHeaderView = _searchC.searchBar;
   
    
   
    
    
    [self loadDataFormPlist];
    
    _filteredCities =[[NSMutableArray alloc]initWithCapacity:4];
    //关键是这句
     self.definesPresentationContext = YES;
    
}
-(void)loadDataFormPlist
{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"area" ofType:@"plist"];
    areaDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *components = [areaDic allKeys];
    NSArray *sortedArray = [components sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableArray *provinceTmp = [[NSMutableArray alloc] init];
    for (int i=0; i<[sortedArray count]; i++) {
        NSString *index = [sortedArray objectAtIndex:i];
        
        NSArray *tmp = [[areaDic objectForKey: index] allKeys];
        [provinceTmp addObject: [tmp objectAtIndex:0]];
        // NSLog(@"%@",[tmp objectAtIndex:0]);
    }
    //省级数组
    province = [[NSArray alloc] initWithArray: provinceTmp];
    
    _isOpen =[[NSMutableArray alloc]initWithCapacity:4];
    
    for (int m=0; m<province.count; m++) {
        [_isOpen addObject:@"1"];//展开
    }
    
    
    
    
    //NSLog(@"province%ld",province.count);
    NSMutableArray *cityTmp = [[NSMutableArray alloc] initWithCapacity:4];
   
        for (int j= 0; j<province.count; j++) {
            NSString *index = [sortedArray objectAtIndex:j];
            NSString *cityname = [province objectAtIndex:j];
            NSDictionary * dic =[areaDic objectForKey:index];
            //NSLog(@"%@",dic);
            NSDictionary * dic2 =[dic objectForKey:cityname];
            //NSLog(@"%@",dic2);
         
            NSArray * arr = [dic2 allKeys];
             NSMutableArray *cityTmp2 = [[NSMutableArray alloc] initWithCapacity:4];
            for (int h=0; h<arr.count; h++) {
            
               NSString *index = [arr objectAtIndex:h];
                NSDictionary * dic3 = [dic2 objectForKey:index];
                NSArray * arry =[dic3 allKeys];
                [cityTmp2 addObjectsFromArray:arry];
                
            }
            [cityTmp addObject:cityTmp2];
            
           
    }
    
    
    //所有城市列表
    allcitys =[[NSArray alloc]initWithArray:cityTmp];
    
 

}

- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    [self updateSearchResultsForSearchController:_searchC];
}
#pragma mark - searchController delegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    // 获取搜索框里输入的内容
    NSString *str = searchController.searchBar.text;
    NSLog(@"%@", str);
    
    // 过滤条件 [c] 不区分大小写 * 通配符
    NSString *p = [NSString stringWithFormat:@"SELF LIKE[c] '*%@*'", str];
    
    // 创建谓词
    NSPredicate *predicate = [NSPredicate predicateWithFormat:p];
    
    // 清空搜索数组
    [_filteredCities removeAllObjects];
    
    _filteredCities = [NSMutableArray arrayWithArray:[province filteredArrayUsingPredicate:predicate]];
    
    
    
    [self.tableView reloadData];
    
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  
    if (!_searchC.active) {
        return province.count;
    } else {
        return 1;
    }
   
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton * _head = [[UIButton alloc]init];
    
    if (!_searchC.active) {
       [_head setTitle:province[section] forState:UIControlStateNormal];
    } else {
        [_head setTitle:@"搜索结果" forState:UIControlStateNormal];
    }
   
    [_head setBackgroundColor:[UIColor grayColor]];
    [_head setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _head.tag = section;
    
    _head.frame=CGRectMake(0, 0, self.view.frame.size.width, 50);
    [_head addTarget:self action:@selector(ButClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return _head;
    
}
#pragma mark - headerView的代理方法

- (void)ButClick:(UIButton*)btt {
    // NSLog(@"%ld",btt.tag);
    
    //有问题 和收起是冲突的
    
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:btt.tag];
//    [_tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    
    
    if ([_isOpen[btt.tag] isEqual:@"1"]) {
        [_isOpen replaceObjectAtIndex:btt.tag withObject:@"0"];
    }else
    {
        [_isOpen replaceObjectAtIndex:btt.tag withObject:@"1"];
        
    }
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:btt.tag];
    
    [_tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (!_searchC.active) {
        
        
        static BOOL io  =YES;
        if ([_isOpen[section] isEqual:@"1"]) {
            io =NO;
        }else
        {
            io =YES;
        }
        
       
        
        NSArray *arr =allcitys[section];
        
        return  io?arr.count:0;
    } else {
        return _filteredCities.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        
       
        cell.tintColor=[UIColor blackColor];
    
    }
    
    if (!_searchC.active) {
        NSArray * arr =allcitys[indexPath.section];
        cell.textLabel.text= arr[indexPath.row];
    }
    else{
        cell.textLabel.text = self.filteredCities[indexPath.row];
    }
    
    
    return cell;
}
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (_searchC.active) {
        _searchC.active = NO;
        [_searchC.searchBar removeFromSuperview];
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
