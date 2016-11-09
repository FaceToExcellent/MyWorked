//
//  mylabeltestViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "mylabeltestViewController.h"
#import "mylabeldiy.h"
@interface mylabeltestViewController ()

@end

@implementation mylabeltestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title=@"自己封装label";
    
    mylabeldiy * label =[[mylabeldiy alloc]initWithFrame:CGRectMake(0, 10, View_WIDTH, 100)];
    label.backgroundColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:10];
     //[label relandstringwithColor:[UIColor purpleColor] range:NSMakeRange(0, 3) string:@"测试来反正，巴拉巴拉巴拉拉拔"];
    label.text= @"共10000款珠宝";
    //[label relandstringwithColorred:0.5 green:0 blue:0.5 alpha:1 range:NSMakeRange(2, 5)];
    [label relandstringwithColor:[UIColor purpleColor] range:NSMakeRange(2,label.text.length-3)];
    
//    [label setlabelfontwithRang:NSMakeRange(2, 15) font:[UIFont systemFontOfSize:25]];
//    [label setHollowwordsWtihRang:NSMakeRange(7, 10)];
    
    
    [self.view addSubview:label];
    
   
    
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
