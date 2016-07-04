//
//  FlatButton.m
//  MyWorked
//
//  Created by HYZ on 16/7/4.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "FlatButton.h"
#import "POP.h"
#import "POPBasicAnimation.h"
@implementation FlatButton

+ (instancetype)button{
    return [self buttonWithType:UIButtonTypeCustom];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        
    
    }
    return self;
}

#pragma mark - Instance methods

- (UIEdgeInsets)titleEdgeInsets
{
    return UIEdgeInsetsMake(4.f,
                            28.f,
                            4.f,
                            28.f);
}

- (CGSize)intrinsicContentSize
{
    CGSize s = [super intrinsicContentSize];
    
    return CGSizeMake(s.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right,
                      s.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom);
    
}

-(void)setup{
    
    self.backgroundColor =self.tintColor;
    self.layer.cornerRadius = 4.f;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.titleLabel.font=[UIFont fontWithName:@"Avenir-Medium" size:22];
    
    
    
    [self addTarget:self action:@selector(scaleTosmall)
   forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
    [self addTarget:self action:@selector(scaleAnimation)
   forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(scaleToDefault)
   forControlEvents:UIControlEventTouchDragExit];
    
    
    
    
}



-(void)scaleTosmall
{
    POPBasicAnimation * scaleAnimation =[POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue =[NSValue valueWithCGSize:CGSizeMake(0.80f, 0.80f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"缩小"];
    
}

- (void)scaleAnimation
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"抖动"];
}

- (void)scaleToDefault
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"恢复"];
}























@end
