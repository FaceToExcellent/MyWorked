//
//  TopsearchViewController.h
//  MyIdeas
//
//  Created by HYZ on 16/6/2.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TopsearchViewController : UIViewController
{
    UIPickerView *picker;
    UIButton *button;
    
    NSDictionary *areaDic;
    NSArray *province;
    NSArray *city;
    NSArray * allcitys;
    NSArray *district;
    
    NSString *selectedProvince;
}
@end
