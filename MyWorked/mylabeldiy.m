//
//  mylabeldiy.m
//  MyWorked
//
//  Created by HYZ on 16/6/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "mylabeldiy.h"
#import <CoreText/CoreText.h>
@implementation mylabeldiy

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
    }
    return self;
}
//设置范围内的字体颜色
-(UILabel *)relandstringwithColorred:(CGFloat)R green:(CGFloat)G blue:(CGFloat)B alpha:(CGFloat)A range:(NSRange)range{

    NSMutableAttributedString * str =[[NSMutableAttributedString alloc]initWithString:self.text];
    [str addAttribute:NSForegroundColorAttributeName value: [UIColor colorWithRed:R green:G blue:B alpha:A] range:range ];
    
    self.attributedText=str;
    
    return  self;
    
}
-(UILabel *)relandstringwithColor:(UIColor*)color range:(NSRange)range string:(NSString *)string{
  
    NSMutableAttributedString * str =[[NSMutableAttributedString alloc]initWithString:string];
    [str addAttribute:NSForegroundColorAttributeName value: color  range:range ];
    //NSLog(@"%@",str);
    self.attributedText=str;
    return  self;
}
-(UILabel *)relandstringwithColor:(UIColor*)color range:(NSRange)range {
    [self relandstringwithColor:color range:range string:self.text];
    
    return self;
}

-(UILabel *)setlabelfontwithRang:(NSRange)range font:(UIFont*)font{
     NSMutableAttributedString * str =(NSMutableAttributedString*)self.attributedText;
    //设置部分字段的字体大小与其他的不同 保持以前的参数基础下再修改
    if (font)
    {
        //[str removeAttribute:(NSString*)kCTFontAttributeName range:range]; 会吧颜色也去掉
        
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)font.fontName, font.pointSize, nil);
        if (nil != fontRef)
        {
            [str addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)fontRef range:range];
            CFRelease(fontRef);
        }
    }
    self.attributedText = str;
    return self;
}

-(UILabel *)setHollowwordsWtihRang:(NSRange)range{
    //空心字
    float fNum = 1.0;//边框粗细 默认为1
    CFNumberRef cfNum2 = CFNumberCreate(NULL, kCFNumberFloatType, &fNum);
     NSMutableAttributedString * str =(NSMutableAttributedString*)self.attributedText;
    [str addAttribute:(NSString *)kCTStrokeWidthAttributeName value:(__bridge id)cfNum2 range:range];
    self.attributedText = str;
    return self;
}
-(UILabel *)setHollowwordsWtihRang:(NSRange)range fNum:(CGFloat)fNum{
    CFNumberRef cfNum2 = CFNumberCreate(NULL, kCFNumberFloatType, &fNum);
    NSMutableAttributedString * str =(NSMutableAttributedString*)self.attributedText;
    [str addAttribute:(NSString *)kCTStrokeWidthAttributeName value:(__bridge id)cfNum2 range:range];
    self.attributedText = str;
    return self;
}

-(UILabel*)addimageViewWithImage:(NSString*)imageName size:(CGSize)imagesize{
   
    NSMutableAttributedString * string =(NSMutableAttributedString*)self.attributedText;
    NSTextAttachment * attch = [[NSTextAttachment alloc]init];
    attch.image = [UIImage imageNamed:imageName];
    attch.bounds = CGRectMake(0, 0,imagesize.width, imagesize.height);
    
    NSAttributedString * str  =[NSAttributedString attributedStringWithAttachment:attch];
    [string appendAttributedString:str];
    
    self.attributedText = string;
    
    
    return self;
}


- (UILabel*)changeLineSpaceForLabelSpace:(float)space {
    
   NSMutableAttributedString * string =(NSMutableAttributedString*)self.attributedText;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [string addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    self.attributedText = string;
    return self;
    
}

- (UILabel*)changeWordSpaceForLabelSpace:(float)space {
    
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    
    return self;
}

- (UILabel*)changeSpaceForLabelLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    return  self;
    
}


@end
