//
//  DecayViewController.m
//  MyWorked
//
//  Created by HYZ on 16/7/2.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "DecayViewController.h"
#import "POP.h"
#import "UIColor+CustomColors.h"
@interface DecayViewController ()<POPAnimationDelegate>
@property(nonatomic)UIControl *dragView;
@end

@implementation DecayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self addDragView];
    
}

-(void)addDragView{
    
    UIPanGestureRecognizer *recognizer =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    
    self.dragView =[[UIControl alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.dragView.center =self.view.center;
    self.dragView.layer.cornerRadius =CGRectGetWidth(self.dragView.bounds)/2;
    self.dragView.backgroundColor = [UIColor customBlueColor];
    [self.dragView addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.dragView addGestureRecognizer:recognizer];
    
    [self.view addSubview:self.dragView];
    
    
}
- (void)touchDown:(UIControl *)sender {
    [sender.layer pop_removeAllAnimations];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation =[recognizer translationInView:self.view];
    recognizer.view.center =CGPointMake(recognizer.view.center.x+translation.x, recognizer.view.center.y+translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity =[recognizer velocityInView:self.view];
        POPDecayAnimation * positonAnimation =[POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positonAnimation.delegate=self;
        positonAnimation.velocity =[NSValue valueWithCGPoint:velocity];
        [recognizer.view.layer pop_addAnimation:positonAnimation forKey:@"随便一写"];
        
    }
    
   
    
    
    
    
    
}

-(void)pop_animationDidApply:(POPDecayAnimation *)anim
{
    BOOL  isDragViewOutsideOfSuperView =!CGRectContainsRect(self.view.frame, self.dragView.frame);
    if (isDragViewOutsideOfSuperView) {
        CGPoint currentVelocity =[anim.velocity CGPointValue  ];
        //这句我也不是很懂
        CGPoint velocity = CGPointMake(currentVelocity.x, -currentVelocity.y);
        POPSpringAnimation * positionAnimation =[POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        positionAnimation.velocity =[NSValue valueWithCGPoint:velocity];
        positionAnimation.toValue =[NSValue valueWithCGPoint:self.view.center];
        [self.dragView.layer pop_addAnimation:positionAnimation forKey:@"layerPositionAnimation"];
    }
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
