




#import <UIKit/UIKit.h>

#import "SDChatModel.h"
#import "MLEmojiLabel.h"

@interface SDChatTableViewCell : UITableViewCell

@property (nonatomic, strong) SDChatModel *model;

@property (nonatomic, copy) void (^didSelectLinkTextOperationBlock)(NSString *link, MLEmojiLabelLinkType type);

@end
