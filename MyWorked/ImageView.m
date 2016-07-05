//
//  ImageView.m
//  MyWorked
//
//  Created by HYZ on 16/7/5.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.f;
        self.layer.masksToBounds = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imageView];
    }
    return self;
}

#pragma mark - Property Setters

- (void)setImage:(UIImage *)image
{
    [self.imageView setImage:image];
    _image = image;
}

@end
