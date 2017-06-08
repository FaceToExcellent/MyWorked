//
//  mylabeldiy.h
//  MyWorked
//
//  Created by HYZ on 16/6/27.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mylabeldiy : UILabel

//改变颜色
-(UILabel *)relandstringwithColor:(UIColor*)color range:(NSRange)range ;
-(UILabel *)relandstringwithColor:(UIColor*)color range:(NSRange)range string:(NSString *)string;
-(UILabel *)relandstringwithColorred:(CGFloat)R green:(CGFloat)G blue:(CGFloat)B alpha:(CGFloat)A range:(NSRange)range;

//改变大小
-(UILabel *)setlabelfontwithRang:(NSRange)range font:(UIFont*)font;
//设置空心
-(UILabel *)setHollowwordsWtihRang:(NSRange)range;
-(UILabel *)setHollowwordsWtihRang:(NSRange)range fNum:(CGFloat)fNum;
//添加图片
-(UILabel*)addimageViewWithImage:(NSString*)imageName size:(CGSize)imagesize;
@end
