

#import "DemoVC4.h"

@implementation DemoVC4


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//  --------- attributedString测试：行间距为8 ---------------------------
    
    NSString *text = @"Auto-Layout-Showcase - swift,AutoLayout 进阶 Demo，宽高比约束、比例约束、不等约束、视差约束、低优先级约束等高级用法，无需写码即可进行复杂页面布局，Demo 还动态模拟了各屏幕下的效果。来自百度知道 iOS 小组的内部分享。UIView-FDCollapsibleConstraints - 一个AutoLayout辅助工具，最优雅的方式解决自动布局中子View的动态显示和隐藏的问题。第二个Demo模拟了一个经典的FlowLayout，任意一个元素隐藏时，底下的元素需要自动“顶”上来，配合这个扩展，你可以在IB里连一连，选一选，不用一行代码就能搞定。Autolayout_Demo - 在项目中用自动布局实现的类似抽屉效果。当view隐藏的时候也隐藏其autolayout的NSLayoutAttribute - 当view隐藏的时候也隐藏其autolayout的NSLayoutAttribute，从而不用大量的代码工作。SDAutoLayout - AutoLayout 一行代码搞定自动布局！支持Cell、Label和Tableview高度自适应，致力于做最简单易用的AutoLayout库。";
    /*//   NSParagraphStyleAttributeName 段落的风格（设置首行，行间距，对齐方式什么的）看自己需要什么属性，写什么
     NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
     paragraphStyle.lineSpacing = 10;// 字体的行间距
     paragraphStyle.firstLineHeadIndent = 20.0f;//首行缩进
     paragraphStyle.alignment = NSTextAlignmentJustified;//（两端对齐的）文本对齐方式：（左，中，右，两端对齐，自然）
     paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略 ( "...wxyz" ,"abcd..." ,"ab...yz")
     paragraphStyle.headIndent = 20;//整体缩进(首行除外)
     paragraphStyle.tailIndent = 20;//
     paragraphStyle.minimumLineHeight = 10;//最低行高
     paragraphStyle.maximumLineHeight = 20;//最大行高
     paragraphStyle.paragraphSpacing = 15;//段与段之间的间距
     paragraphStyle.paragraphSpacingBefore = 22.0f;//段首行空白空间
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;//从左到右的书写方向（一共➡️三种）
    paragraphStyle.lineHeightMultiple = 15;
    paragraphStyle.hyphenationFactor = 1;//连字属性 在iOS，唯一支持的值分别为0和1*/
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    UIColor *color = [UIColor blackColor];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName: paragraphStyle}];
    
    
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    label.font=[UIFont systemFontOfSize:12];
    label.attributedText = string;
    
    label.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 0)
    .autoHeightRatio(0);
    
    // 标注lable的text为attributedString
    label.isAttributedContent = YES;
    
//  --------- attributedString测试：行间距为8 ---------------------------
    
}

@end
