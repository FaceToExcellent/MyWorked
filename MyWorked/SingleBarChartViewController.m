//
//  SingleBarChartViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "SingleBarChartViewController.h"
#import "ZFChart.h"
@interface SingleBarChartViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>

@end

@implementation SingleBarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"简单柱状图";
    ZFBarChart *barChart =[[ZFBarChart alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    barChart.delegate=self;
    barChart.dataSource=self;
    barChart.topic=@"XX小学各年级人数";
    barChart.unit=@"人";
//    barChart.isAnimated=NO;
//    barChart.isResetAxisLineMinValue=YES;
//    barChart.isShowAxisLineValue=NO;
//    barChart.valueLabelPattern = kPopoverLabelPatternPopover;
    barChart.isShowSeparate=YES;
 //   barChart.topicColor =[UIColor purpleColor];
//    barChart.unitColor=[UIColor whiteColor];
//    barChart.axisColor=[UIColor redColor];
//    barChart.axisLineNameColor=[UIColor greenColor];
//    barChart.axisLineValueColor=[UIColor blackColor];
//    barChart.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:barChart];
    [barChart strokePath];
    
    
}
#pragma mark - ZFGenericChartDataSource
/*//返回value数据
 //当只有1组数据时，NSArray存储 @[@"1", @"2", @"3", @"4"]
 当有多组数据时，NSArray存储 @[@[@"123", @"300", @"490", @"380", @"167", @"235"], @[@"256", @"283", @"236", @"240", @"183", @"200"], @[@"256", @"256", @"256", @"256", @"256", @"256"]]
 //barChart: 代表有6组，每组有3个item
 //lineChart: 代表有6组，每组有3个item（另一种理解就是有3条线，每条线上有6个点）*/
-(NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart
{
    return @[@"123", @"256", @"300", @"283", @"490", @"236"];
}
  //返回名称数组(NSArray必须存储NSString类型)
- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"一年级", @"二年级", @"三年级", @"四年级", @"五年级", @"六年级"];
}
- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFMagenta];
}
//y轴(普通图表) 或 x轴(横向图表) 数值显示的最大值(若不设置，默认返回数据源最大值)
- (CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 500;
}
 //y轴(普通图表) 或 x轴(横向图表) 数值显示的段数(若不设置,默认5段)
- (NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return 10;
}

#pragma mark - ZFBarChartDelegate
  //bar宽度(若不设置，默认为25.f)
- (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart{
    return 15;
}
- (void)barChart:(ZFBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)barIndex);
}

- (void)barChart:(ZFBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)labelIndex);
}

//- (CGFloat)barWidthInBarChart:(ZFBarChart *)barChart{
//    return 40.f;
//}
//
//- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
//    return 40.f;
//}
//
//- (id)valueTextColorArrayInBarChart:(ZFGenericChart *)barChart{
//    return ZFBlue;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
