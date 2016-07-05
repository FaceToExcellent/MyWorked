//
//  CircleView.h
//  MyWorked
//
//  Created by HYZ on 16/7/5.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
@property(nonatomic) UIColor * strokeColor;

@property(nonatomic) CAShapeLayer *circleLayer;
- (void)addCircleLayer;
- (void)animateToStrokeEnd:(CGFloat)strokeEnd;
- (void)setStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated;

@end
