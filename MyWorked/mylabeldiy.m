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

@end
