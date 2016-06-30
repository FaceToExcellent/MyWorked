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
{
    NSMutableDictionary *_eventsByDate;
    
    NSDate *_todayDate;
    NSDate *_minDate;
    NSDate *_maxDate;
    
    NSDate *_dateSelected;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
-(void)makeUI
{
    _calendarMenuView=[[JTCalendarMenuView alloc]init];
    _calendarMenuView.frame=CGRectMake(0, 0, View_WIDTH, 64);
    [self.view addSubview:_calendarMenuView];
    
    _calendarContentView=[[JTHorizontalCalendarView alloc]init];
    
    _calendarContentView.frame=CGRectMake(0, 64, View_WIDTH, 400);
    [self.view addSubview:_calendarContentView];
    
    _calendarManager = [[JTCalendarManager alloc]init];
    _calendarManager.delegate=self;
    
    [self createRandomEvents];
    
    [self createMinAndMaxDate];
    
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:_todayDate];
    
    
}

-(void)createRandomEvents
{
    _eventsByDate=[NSMutableDictionary new];
    for (int i=0; i<30; ++i) {
        NSDate *randdomDate = [NSDate dateWithTimeInterval:(rand()%(3600*24*60)) sinceDate:[NSDate date]];
        NSString * key =[[self dateFormatter] stringFromDate:randdomDate];
        if (!_eventsByDate[key]) {
            _eventsByDate[key]= [NSMutableArray new];
            
        }
        [_eventsByDate[key]addObject:randdomDate];
        
        
    }
    
}
-(NSDateFormatter *)dateFormatter
{
    static NSDateFormatter * dateFormatter;
    if (!dateFormatter) {
        dateFormatter =[NSDateFormatter new];
        dateFormatter.dateFormat= @"dd-MM-yyyy";
        
    }
    
    return dateFormatter;
}

- (void)createMinAndMaxDate
{
    _todayDate=[NSDate date];
    _maxDate =[_calendarManager.dateHelper addToDate:_todayDate months:-2];
    _maxDate =[_calendarManager.dateHelper addToDate:_todayDate months:2];
    
    
}
- (BOOL)haveEventForDay:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    
    if(_eventsByDate[key] && [_eventsByDate[key] count] > 0){
        return YES;
    }
    
    return NO;
    
}
#pragma mark - CalendarManager delegate

// Exemple of implementation of prepareDayView method
// Used to customize the appearance of dayView
- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(JTCalendarDayView *)dayView
{
    // Today
    if([_calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor blueColor];
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Selected date
    else if(_dateSelected && [_calendarManager.dateHelper date:_dateSelected isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor redColor];
        dayView.dotView.backgroundColor = [UIColor whiteColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Other month
    else if(![_calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = [UIColor lightGrayColor];
    }
    // Another day of the current month
    else{
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = [UIColor blackColor];
    }
    
    if([self haveEventForDay:dayView.date]){
        dayView.dotView.hidden = NO;
    }
    else{
        dayView.dotView.hidden = YES;
    }
}

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(JTCalendarDayView *)dayView
{
    _dateSelected = dayView.date;
    
    // Animation for the circleView
    dayView.circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:dayView
                      duration:.3
                       options:0
                    animations:^{
                        dayView.circleView.transform = CGAffineTransformIdentity;
                        [_calendarManager reload];
                    } completion:nil];
    
    
    // Don't change page in week mode because block the selection of days in first and last weeks of the month
    if(_calendarManager.settings.weekModeEnabled){
        return;
    }
    
    // Load the previous or next page if touch a day from another month
    
    if(![_calendarManager.dateHelper date:_calendarContentView.date isTheSameMonthThan:dayView.date]){
        if([_calendarContentView.date compare:dayView.date] == NSOrderedAscending){
            [_calendarContentView loadNextPageWithAnimation];
        }
        else{
            [_calendarContentView loadPreviousPageWithAnimation];
        }
    }
}


#pragma mark calendarManager delegate Page mangement
-(BOOL)calendar:(JTCalendarManager *)calendar canDisplayPageWithDate:(NSDate *)date
{
    return [_calendarManager.dateHelper date:date isEqualOrAfter:_minDate andEqualOrBefore:_maxDate];
    
}

-(void)calendarDidLoadNextPage:(JTCalendarManager *)calendar
{
      //    NSLog(@"Next page loaded");
}
-(void)calendarDidLoadPreviousPage:(JTCalendarManager *)calendar
{
    //    NSLog(@"Previous page loaded");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
