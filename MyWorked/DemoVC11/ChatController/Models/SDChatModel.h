


#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SDMessageTypeSendToOthers,
    SDMessageTypeSendToMe
} SDMessageType;

@interface SDChatModel : NSObject

@property (nonatomic, assign) SDMessageType messageType;

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *imageName;

@end
