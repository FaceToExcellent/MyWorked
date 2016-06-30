//
//  CalenderViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/30.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "CalenderViewController.h"
#import "JTCalendar.h"
@interface CalenderViewController ()<JTCalendarDelegate>
@property (strong, nonatomic)  JTCalendarMenuView *calendarMenuView;
@property (strong, nonatomic)  JTHorizontalCalendarView *calendarContentView;

@property (strong, nonatomic) JTCalendarManager *calendarManager;

@property (strong, nonatomic)  NSLayoutConstraint *calendarContentViewHeight;
@end

@implementation CalenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
   
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
