//
//  tieziceshiViewController.m
//  MyIdeas
//
//  Created by HYZ on 16/5/31.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "tieziceshiViewController.h"

@interface tieziceshiViewController ()
@property(nonatomic,strong) UIButton * button;
@end

@implementation tieziceshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"新人在开发初期遇到的各种问题";
    [self Ftest];
}
-(void)Ftest
{
#pragma mark // 1.block方式添加动画，这里需要加上大括号解决报错
 //1.block方式添加动画，这里需要加上大括号解决报错：
    _button = [[UIButton alloc]init];
    _button.frame = CGRectMake(20, 70, 50, 50);
    _button.backgroundColor =[UIColor grayColor];
    _button.tag=1;
    [_button addTarget:self action:@selector(buttonCLick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
#pragma mark //2.使用UITextView输入框上半部仍为空白
 
    UITextField * text  =[[UITextField alloc]init];
    text.frame= CGRectMake(100, 70, 150, 50);
   // 凡是继承UIScrolView的空间都会收到 automaticallyAdjustsScrollViewInsets 属性的影响。默认为YES ，当有UINavigationbar的时候UITextView的表现为上面空白。
    self.automaticallyAdjustsScrollViewInsets = NO;
    text.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:text];
 #pragma mark  //3..在Navigation上自定义了右边按钮，如何取得该按钮对象。以及该按钮的属性设定。

  //  NSInteger tag =1;
   // [self.navigationController.navigationBar viewWithTag:tag];
    //此处button 为暂时代替
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_button];
  #pragma mark //4.计算UITextView中的行数。

    UITextView *textView = [[UITextView alloc]init];
    textView.frame=CGRectMake(20, 150, 150, 50);
    textView.backgroundColor= [UIColor redColor];
    textView.text=@"数热迟寒滑有痰数热迟寒滑有痰数热迟寒滑有痰数热迟寒滑有痰";
    textView.font = [UIFont systemFontOfSize:10];
    NSString *str = textView.text;
    [self.view addSubview:textView];
    CGSize size = [str sizeWithAttributes:@{NSFontAttributeName:textView.font}];
    int colomNumber = textView.contentSize.height/size.height;
    //这个地方多算一行，我也不知道为啥
    NSLog(@"colomNumber%d",colomNumber-1);
#pragma mark//5.更改UISearchBar的cancel按钮显示文本。

    //见  TopsearchViewController 51行
#pragma mark //6..当同一.m文件中出现两个继承于 UIScrollView 的类并设置了代理

    //使用- (void)scrollViewDidScroll:(UIScrollView *)scrollView 时两个视图各自滚动时都会掉用该方法。可能会产生不必要的bug。可以设定对应了tag值来限制实现对应逻辑。
    
#pragma mark //7 UITableViewStylePlain 和 UITableViewStyleGrouped 的区别
    //UITableViewStylePlain只有一组，列表形式
   // UITableViewStyleGrouped可以多组，列表分组形式，
    //另外如果要在UITableViewCell的头视图上放视图，看需求是怎么样，如果需要头视图跟随tableView滚动，最好选用UITableViewStyleGrouped。UITableViewStylePlain设置头视图是之后，头视图不会跟随tableView滚动。当然，强行设置UITableViewStylePlain也行，不过需要在 - (void)scrollViewDidScroll:(UIScrollView *)scrollView 中进行计算处理scrollView.contentInset
    
 #pragma mark //8 隐藏返回按钮
    //[self.navigationItem setHidesBackButton:YES animated:NO];
    
#pragma mark //9 取消导航栏返回按钮的title
    
   //[[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
#pragma mark //10 UITableViewCell中的使用cell和cell.contentView的区别
    
    //区别在于进行cell编辑时，比如cell内容向左移或者右移时，第一种方式子视图不会移动，第二种可以，所以这种情况一般使用第二种方式。还有在设置backgroundColor时，使用cell设置时左移或者右移颜色是不会变的，而用cell.contentCell设置时，移动后的空白会显示cell的默认颜色，这种情况视实际情况选择。其实这两种方式在大多数情况是一样，不用纠结
#pragma mark //11项目中需要注意的地方
    /*项目更新的时候(Documents 和 Library 会被保留)
     沙盒路径中三个文件(苹果官方推荐)
     1.Documents：用户产生的数据，都是一些比较重要的数据，比较小。这里面的数据会自动同步到Ituns(文件
     不能太大，如果太大，可能上架时会被拒绝);
     2.Library：1:电影，音乐，图片，报刊,电子书等等等 <2>Preferences文件夹(会被同步),配置文件。
     3.tmp：每次应用重启动都会自动清空
     4.app：(应用程序包) 系统隐藏的。*/
    
 #pragma mark //12 取得当前的点和之前的点，转换坐标系，判断当前点是否在视图内 
    /*CGPoint currentPoint = [touch locationInView:self];
     CGPoint previousPoint = [touch previousLocationInView:self];
     currentPoint = [self convertPoint:currentPoint toView:_myView];
     _isInside = [_myView pointInside:currentPoint withEvent:event];*/
 #pragma mark      //13多线程中更改刷新界面在主线程还是子线程
    /*主线程。在子线程中能更新的UI界面只是一个假象，实际上是子线程运行完毕，回到主线程继续执行UI更新的函数栈，由于时间很短，导致这个错觉。若子线程一直在执行，则主线程执行不了UI更新栈中的内容，UI界面也就不会更新。*/
   #pragma mark        //14 NSString转NSDictionary
    /*NSData *infoData = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
     NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:infoData options:NSJSONReadingMutableContainers error:nil];*/
    
    //转其他也类似，先转成NSData再转成其他的类
    #pragma mark   //15  从服务器GET回来的数据NSData有时候中文乱码
    /*NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
     NSMutableString *mutableString = [[NSMutableString alloc] initWithData:data encoding:enc];*/
 #pragma mark   //16   //BOOL和bool的区别
    /*Objective-C 中的BOOL实际上是一种对带符号的字符类型（signed char）的类型定义（typedef），它使用8位的存储空间。通过#define指令把YES定义为1，NO定义为0。*/
    /*注意：Objective-C 并不会将BOOL作为仅能保存YES或NO值的真正布尔类型来处理。编译器仍将BOOL认作8位二进制数，YES 和 NO 值只是在习惯上的一种理解。
     问题：如果不小心将一个大于1字节的整型值（比如short或int）赋给一个BOOL变量，那么只有低位字节会用作BOOL值。如果该低位字节刚好为0（比如8960，写成十六进制为0x2300），BOOL值将会被认作是0，即NO值。而对于bool类型，只有true和false的区别，即0为false，非0为true。
     举例：
     BOOL b1=8960; // 实际是 NO，因为8960换成十六进制为0x2300，BOOL 只有8位存储空间，取0x2300的低8位，00，所以是NO
     bool b2=8960; //实际是true，因为bool类型，非0即为true。*/
    
   #pragma mark   //17  //Xcode7HTTP协议改为了HTTPS协议，导致应用不正常
    /*
     <key>NSAppTransportSecurity</key>
     
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>*/
  #pragma mark   //18.如何让TableView滚动到顶端：
    /*//两种滚动到顶部的方法都可以
     // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
     // [_centerTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
     [_centerTableView setContentOffset:(CGPoint){0,0} animated:YES];*/
    
   #pragma mark   //19.could not find developer image  
    //Xcode版本不够手机高
}

-(void)buttonCLick:(UIButton*)sender
{
    switch (sender.tag) {
        case 1:
            //block方式添加动画，这里需要加上大括号解决报错：
        {
            CGPoint center = _button.center;
            center.y-=20;
            if(center.y>10){
            [UIView animateWithDuration:1 animations:^{
                _button.center =center;
            }];
            }
        }
            break;
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
