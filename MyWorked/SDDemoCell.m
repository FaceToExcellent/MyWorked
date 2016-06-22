//
//  SDDemoCell.m
//  MyWorked
//
//  Created by HYZ on 16/6/22.
//  Copyright © 2016年 HYZ. All rights reserved.
//

#import "SDDemoCell.h"
#import "UIView+SDAutoLayout.h"
@implementation SDDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _titleLabel=[[UILabel alloc]init];
    _titleLabel.textColor=[UIColor grayColor];
    _titleLabel.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titleLabel];
    CGFloat margin = 10 ;
    
    _titleLabel.sd_layout.leftSpaceToView(self.contentView,margin).topSpaceToView(self.contentView,margin).rightSpaceToView(self.contentView,margin).heightIs(20);
    
    
    _contentLabel=[[UILabel alloc]init];
    _contentLabel.textColor=[UIColor grayColor];
    _contentLabel.font=[UIFont systemFontOfSize:12];
    [self.contentView addSubview:_contentLabel];
    
    _contentLabel.sd_layout.leftEqualToView(_titleLabel).rightEqualToView(_titleLabel).topSpaceToView(_titleLabel,margin).autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:self.contentLabel bottomMargin:margin];
    
    
    
}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
