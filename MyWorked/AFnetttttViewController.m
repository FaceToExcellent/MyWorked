//
//  AFnetttttViewController.m
//  MyWorked
//
//  Created by HYZ on 16/7/6.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "AFnetttttViewController.h"
//#import "AFNetworking.h"
#import "UIColor+CustomColors.h"
@interface AFnetttttViewController ()

@end

@implementation AFnetttttViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"AFNetworking";
    
    UILabel * label =[[UILabel alloc]init];
    label.frame=CGRectMake(10, 0, self.view.frame.size.width-20, 300
                           );
    label.textColor=[UIColor customBlueColor];
    label.font=[UIFont systemFontOfSize:15];
    label.text=@"AFNetworking配置方法：\n\t 1.下载AFNetworking,将2个文件夹:AFNetworking和UIKit+AFNetworking拖入工程；\n\t 2.导入以下库文件:CFNetwork、Security、SystemConfiguration、MobileCoreServices \n\t3.如果你以前用的是1.0版本,那么AFNetworking 2.0 Migration Guide能帮助你 \n\t4.如果你是用CocoaPods配置的,那么 \n\tplatform:ios,'7.0' \n\tpod引号AFNetworking引号，引号~>2.0引号";
    label.lineBreakMode=0;
    label.numberOfLines =0;
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
