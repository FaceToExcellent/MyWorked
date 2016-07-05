//
//  AnimationsListViewController.m
//  MyWorked
//
//  Created by HYZ on 16/7/2.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "AnimationsListViewController.h"
#import "ButtonViewController.h"
#import "ImageViewController.h"
#import "ConstraintsViewController.h"
#import "CircleViewController.h"
#import "DecayViewController.h"
#import "FoldingViewController.h"
#import "MenuTableViewCell.h"
#import "UIColor+CustomColors.m"

static NSString * const kCellIdentifier = @"cellIdentifier";
@interface AnimationsListViewController ()
@property(nonatomic) NSArray *items;
- (NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)configureTableView;
- (void)configureTitleView;
@end

@implementation AnimationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"popping";
    [self configureTableView];
    [self configureTitleView];
}
- (void)configureTableView
{
    self.items = @[@[@"Button Animation", [ButtonViewController class]],
                   @[@"Decay Animation", [DecayViewController class]],
                   @[@"Circle Animation", [CircleViewController class]],
                   @[@"Image Animation", [ImageViewController class]],
                 
                   @[@"Folding Animation", [FoldingViewController class]],
                   @[@"Constraints Animation", [ConstraintsViewController class]]
                   ];
    [self.tableView registerClass:[MenuTableViewCell class]
           forCellReuseIdentifier:kCellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 50.f;
}

- (void)configureTitleView
{
    UILabel *headlinelabel = [UILabel new];
    headlinelabel.font = [UIFont fontWithName:@"Avenir-Light" size:28];
    headlinelabel.textAlignment = NSTextAlignmentCenter;
    headlinelabel.textColor = [UIColor customGrayColor];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.title];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor customBlueColor]
                             range:NSMakeRange(1, 1)];
    
    headlinelabel.attributedText = attributedString;
    [headlinelabel sizeToFit];
    
    [self.navigationItem setTitleView:headlinelabel];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [self viewControllerForRowAtIndexPath:indexPath];
    viewController.title = [self titleForRowAtIndexPath:indexPath];
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier
                                                              forIndexPath:indexPath];
    cell.textLabel.text = [self.items[indexPath.row] firstObject];
    return cell;
}

- (NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.items[indexPath.row] firstObject];
}

- (UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.items[indexPath.row] lastObject] new];
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
