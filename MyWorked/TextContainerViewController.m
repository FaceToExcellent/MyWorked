//
//  TextContainerViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/24.
//  Copyright © 2016年 HYZ. All rights reserved.

#import "TextContainerViewController.h"
#import "TYAttributedLabel.h"
#import "TYTextStorageParser.h"
@interface TextContainerViewController ()<TYAttributedLabelDelegate>
@property (nonatomic, weak) TYAttributedLabel *label;

@property (nonatomic,strong) NSArray *answerArray;
@end

@implementation TextContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.title=@"没写containner,json格式解析";
    // appendAttributedText
    [self addTextAttributedLabel];
    
    // jsonPath
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
    
    // parseJson
    [self parseJsonFileWithPath:path];
    
    [_label sizeToFit];
    
}

- (void)addTextAttributedLabel
{
    TYAttributedLabel *label = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame), 0)];
    label.delegate = self;
    [self.view addSubview:label];
    _label = label;
}

- (void)parseJsonFileWithPath:(NSString *)filePath
{
    NSArray *textStorageArray = [TYTextStorageParser parseWithJsonFilePath:filePath];
    
    if (textStorageArray.count > 0) {
        [_label appendTextStorageArray:textStorageArray];
    }
}

#pragma mark - TYAttributedLabelDelegate

- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)TextStorage atPoint:(CGPoint)point
{
    NSLog(@"textStorageClickedAtPoint");
    if ([TextStorage isKindOfClass:[TYLinkTextStorage class]]) {
        NSString *linkStr = ((TYLinkTextStorage*)TextStorage).linkData;
        
        if ([linkStr hasPrefix:@"http"]) {
            [ [ UIApplication sharedApplication] openURL:[ NSURL URLWithString:linkStr]];
        }else {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"点击提示" message:linkStr delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
        }
    }
}

- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageLongPressed:(id<TYTextStorageProtocol>)textStorage onState:(UIGestureRecognizerState)state atPoint:(CGPoint)point
{
    NSLog(@"textStorageLongPressed");
}



-(void)makeUI
{
    
}
@end
