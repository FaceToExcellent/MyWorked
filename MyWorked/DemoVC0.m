//
//  DemoVC0.m
//  MyWorked
//
//  Created by HYZ on 16/6/22.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "DemoVC0.h"
#define kTimeInterval 0.8
@interface DemoVC0 ()

@end

@implementation DemoVC0
{
    NSTimer *_timer;
    CGFloat _widthRatio;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _widthRatio =0.4;
    _timer =[NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(animatiom1) userInfo:nil repeats:YES];
    //将edgesForExtendedLayout属性设置为UIRectEdgeNone，这样布局就是从导航栏下面开始了
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view0.sd_layout.leftSpaceToView(self.view,20).topSpaceToView(self.view,80).heightIs(130).widthRatioToView(self.view,_widthRatio);
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0, 10)
    .topEqualToView(self.view0)
    .heightIs(60)
    .widthRatioToView(self.view0, 0.5);
    
    self.view2.sd_layout
    .leftSpaceToView(self.view1, 10)
    .topEqualToView(self.view1)
    .heightRatioToView(self.view1, 1)
    .widthIs(50);
    
    self.view3.sd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1, 10)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view4.sd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3, 1)
    .widthRatioToView(self.view2, 1);
    
    
    [self.view0 addSubview:self.view5];
    self.view5.sd_layout
    .centerYEqualToView(self.view0)
    .rightSpaceToView(self.view0, 10)
    .widthRatioToView(self.view0, 0.5)
    .heightIs(20);
}

-(void)animatiom1
{
    if (_widthRatio>=0.4) {
        _widthRatio =0.1;
    }else
    {
        _widthRatio =0.4;
    }
    
    [UIView animateWithDuration:0.8 animations:^{
        self.view0.sd_layout.widthRatioToView(self.view,_widthRatio);
        [self.view0 updateLayout];//调用此方法开启view0动画效果
        [self.view5 updateLayout];
        /*
         调用[self.view0 updateLayout]就可以实现view0和其它兄弟view一起动画，view0和view5是父子关系，如果view0需要动画要再主动调用一次[self.view5 updateLayout]
         */
    }];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [_timer invalidate];
    _timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
