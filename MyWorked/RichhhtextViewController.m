//
//  RichhhtextViewController.m
//  MyWorked
//
//  Created by HYZ on 16/6/23.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "RichhhtextViewController.h"
#import "TYAttributedLabel.h"
@interface RichhhtextViewController ()

@end

@implementation RichhhtextViewController
{
    UIScrollView * myScrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeUI];
    
}
-(void)makeUI
{
    myScrollView =[[UIScrollView alloc]init];
    myScrollView.contentOffset=CGPointMake(0, 0);
    myScrollView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    myScrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3);
    myScrollView.bounces= NO;
    myScrollView.scrollEnabled=YES;
    myScrollView.showsHorizontalScrollIndicator=YES;
    myScrollView.showsVerticalScrollIndicator = YES;
    myScrollView.userInteractionEnabled=YES;
    myScrollView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:myScrollView];
    
    [self addlabels];
}


-(void)addlabels
{
    //1. 简单label
    [self addsimpleLabel];
    //2. 属性文本
    [self addTextAttributedLabel];
    //3. 链接文本
    [self addLinkLabel];
    
    
}

-(void)addsimpleLabel
{
    
    TYAttributedLabel *label =[[TYAttributedLabel alloc]init];
    label.text=@"";
    
    label.characterSpacing =2 ;//文字间隙
    label.linesSpacing = 2;//文本行间隙
    label.lineBreakMode=NSLineBreakByTruncatingMiddle;
    //label.numberOfLines = 3;
    // 文本字体
    label.font = [UIFont systemFontOfSize:17];
    [label  appendImageWithName:@"icon0.jpg" size:CGSizeMake(15, 15)];
    [label appendText:@"简单label简单label简单label简单label"];
    // 设置view的位置和宽，会自动计算高度
    [label setFrameWithOrign:CGPointMake(0,20) Width:CGRectGetWidth(self.view.frame)];
    [myScrollView  addSubview:label];
    
    
    
}

-(void)addTextAttributedLabel
{
    TYAttributedLabel *label1 = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(0, 60, CGRectGetWidth(self.view.frame), 0)];
    
   
    NSString *text = @"\t总有一天你将破蛹而出，成长得比人们期待的还要美丽。\n\t但这个过程会很痛，会很辛苦，有时候还会觉得灰心。\n\t面对着汹涌而来的现实，觉得自己渺小无力。\n\t但这，也是生命的一部分，做好现在你能做的，然后，一切都会好的。\n\t我们都将孤独地长大，不要害怕。";
    
    NSArray *textArray = [text componentsSeparatedByString:@"\n\t"];
    NSArray *colorArray = @[RGB(213, 0, 0, 1),RGB(0, 155, 0, 1),RGB(103, 0, 207, 1),RGB(209, 162, 74, 1),RGB(206, 39, 206, 1)];
    NSInteger index = 0;
    for (NSString *text in textArray) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
        // 设置当前文本颜色
        [attributedString addAttributeTextColor:colorArray[index%5]];
        // 设置当前文本大小
        [attributedString addAttributeFont:[UIFont systemFontOfSize:15+arc4random()%4]];
        if (index == 2) {
            // 当前文本添加下划线
            [attributedString addAttributeUnderlineStyle:kCTUnderlineStyleSingle modifier:kCTUnderlinePatternSolid];
        }
        if (index == 4) {
            [attributedString addAttributeUnderlineStyle:kCTUnderlineStyleSingle modifier:kCTUnderlinePatternDot];
        }
        
        // 追加(添加到最后)属性文本
        [label1 appendTextAttributedString:attributedString];
        [label1 appendText:@"\n\t"];
        index++;
    }
    // 设置空心字
    label1.strokeWidth = 2;
    
    [label1 sizeToFit];
    //[label1 setFrameWithOrign:CGPointMake(0, 64) Width:CGRectGetWidth(self.view.frame)];
    
    
     [myScrollView addSubview:label1];

}

-(void)addLinkLabel
{
    TYAttributedLabel *label1 = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 0)];
    label1.delegate = self;
    label1.highlightedLinkColor = [UIColor orangeColor];
   
    NSString *text = @"\t总有一天你将破蛹而出，成长得比人们期待的还要美丽。\n\t但这个过程会很痛，会很辛苦，有时候还会觉得灰心。\n\t面对着汹涌而来的现实，觉得自己渺小无力。\n\t但这，也是生命的一部分，做好现在你能做的，然后，一切都会好的。\n\t我们都将孤独地长大，不要害怕。";
    
    NSArray *textArray = [text componentsSeparatedByString:@"\n\t"];
    NSArray *colorArray = @[RGB(213, 0, 0, 1),RGB(0, 155, 0, 1),RGB(103, 0, 207, 1),RGB(209, 162, 74, 1),RGB(206, 39, 206, 1)];
    NSInteger index = 0;
    
    for (NSString *text in textArray) {
        
        if (index == 2) {
            // 追加链接信息
            [label1 appendLinkWithText:text linkFont:[UIFont systemFontOfSize:15+arc4random()%4] linkData:@"http://www.baidu.com"];
        }else {
            // 追加文本属性
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:text];
            [attributedString addAttributeTextColor:colorArray[index%5]];
            [attributedString addAttributeFont:[UIFont systemFontOfSize:15+arc4random()%4]];
            [label1 appendTextAttributedString:attributedString];
        }
        [label1 appendText:@"\n\t"];
        index++;
    }
    
    [label1 appendLinkWithText:@"百度一下" linkFont:[UIFont systemFontOfSize:15+arc4random()%4] linkData:@"http://www.baidu.com"];
    
    [label1 sizeToFit];
     [myScrollView addSubview:label1];
}
#pragma mark - TYAttributedLabelDelegate

- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)TextRun atPoint:(CGPoint)point
{
    NSLog(@"textStorageClickedAtPoint");
    if ([TextRun isKindOfClass:[TYLinkTextStorage class]]) {
        
        NSString *linkStr = ((TYLinkTextStorage*)TextRun).linkData;
        
        if ([linkStr hasPrefix:@"http:"]) {
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
