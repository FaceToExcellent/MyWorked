//
//  TextContainerViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/24.
//  Copyright © 2016年 HYZ. All rights reserved.
//
#define kExamTextFieldWidth 80
#define kExamTextFieldHeight 20
#define kAttrLabelWidth (CGRectGetWidth(self.view.frame)-20)
#define kTextFieldTag 1000

#import "TextContainerViewController.h"
#import "TYAttributedLabel.h"
#import "RegexKitLite.h"
#import "TExamTextField.h"
#import "TPKeyboardAvoidingScrollView.h"
@interface TextContainerViewController ()
@property (nonatomic,strong) TYAttributedLabel *label;
@property (nonatomic,strong) TYTextContainer *textContainer;
@property (nonatomic,strong) NSAttributedString *attString;
@property (nonatomic,weak) TPKeyboardAvoidingScrollView *scrollView;

@property (nonatomic,strong) NSArray *answerArray;
@end

@implementation TextContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _answerArray = @[@"白露为霜",@"所谓伊人",@"道阻且跻",@"蒹葭采采",@"白露未已",@"宛在水中沚",@"企慕"];
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
