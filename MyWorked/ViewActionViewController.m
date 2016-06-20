
#import "ViewActionViewController.h"


@interface ViewActionViewController()




@end

@implementation ViewActionViewController

- (void)viewDidLoad {
    
    UIImageView * image = [[UIImageView alloc]init];
    image.frame=CGRectMake(100, 100, 100, 100);
    //本来是白色
     [image setImage:[self image:[UIImage imageNamed:@"i_searchtop"] WithColor:[UIColor blueColor]]];
    [self.view addSubview:image];
    
 
    
  
    
}
//改变图片颜色
- (UIImage *)image:(UIImage *)image WithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end