
#import "OOOPPPViewController.h"


@interface OOOPPPViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableview;
@property (nonatomic, strong) NSArray *friendGroup;
@property (nonatomic, strong) NSMutableArray * isOpen ;



@end

@implementation OOOPPPViewController

- (void)viewDidLoad {
    
    self.title=@"分组点击收起与展开";
    _tableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.sectionHeaderHeight = 44;
    [self.view addSubview:_tableview];
    
    _friendGroup=[[NSArray alloc]init];
    _friendGroup = @[@"sddddddddddddddd"];
    
    
    NSArray * array =@[@"1",@"1",@"1"];
    _isOpen =[[NSMutableArray alloc]initWithArray:array];
    
}

#pragma mark---------UITableViewDataSource, UITableViewDelegate 代理方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static BOOL io  =YES;
    if ([_isOpen[indexPath.section] isEqual:@"1"]) {
        io =NO;
    }else
    {
        io =YES;
    }
    
    return io? 50:150;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
   
    return 1;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        
    }
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    view.backgroundColor=[UIColor greenColor];
    for (int i =0; i<5; i++) {
        UIButton *view1 =[[UIButton alloc]initWithFrame:CGRectMake(0, 0+30*i, 200, 20)];
        [view1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [view1 setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [view1 setTitle:@"test" forState:UIControlStateNormal];
        [view1 addTarget:self action:@selector(butt:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:view1];
    }
    
    
    [cell addSubview:view];
    
    return cell;
    
}
-(void)butt:(UIButton *)butt
{
    
    if (butt.selected) {
        butt.selected=NO;
    }else
    {
        butt.selected=YES;
    }
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton * _head = [[UIButton alloc]init];
    _head.backgroundColor=[UIColor blueColor];
    _head.tag = section;
    
    _head.frame=CGRectMake(0, 0, self.view.frame.size.width, 50);
    [_head addTarget:self action:@selector(ButClick:) forControlEvents:UIControlEventTouchUpInside];
    
   
    
    return _head;
    
}


/*if (indexPath.section==0) {
 UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
 if (!cell) {
 MultipleChoiceModel *model =[_DataArray objectAtIndex:indexPath.section];
 NSArray * arr = model.list;
 static NSInteger A ;
 if (arr.count%4==0) {
 A= arr.count/4;
 }else
 {
 A= arr.count/4 +1;
 }
 UIView * view =[[UIView alloc]init];
 view.frame=CGRectMake(0, 0, SCREEN_WIDTH, 90*hb*A);
 [cell addSubview:view];
 
 
 for (int i =0; i<arr.count; i++) {
 MyButton * button =[[MyButton alloc]initWithFrame:CGRectMake(30*wb +175*wb*i, 20*hb + i/4 * 90* hb , 165*wb, 70*hb)];
 
 [view addSubview:button];
 }
 
 return cell;
 }
 }else
 {
 */
#pragma mark - headerView的代理方法

- (void)ButClick:(UIButton*)btt {
   // NSLog(@"%ld",btt.tag);
    
    if ([_isOpen[btt.tag] isEqual:@"1"]) {
        [_isOpen replaceObjectAtIndex:btt.tag withObject:@"0"];
    }else
    {
        [_isOpen replaceObjectAtIndex:btt.tag withObject:@"1"];
        
    }
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:btt.tag];
    
    [self.tableview reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
  
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end