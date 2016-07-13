//
//  SideBarMenuCell.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "SideBarMenuCell.h"

@implementation SideBarMenuCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(void)layoutSubviews
{
    self.leftFreeSpace = 20.0f;
    
    CGFloat spaceX = 20.0f;
    CGFloat labelHeight = 30.0f;
    CGFloat spaceY = self.frameHeight * 0.5 - labelHeight * 0.5;
    CGFloat labelWidth = self.frameWidth - spaceX * 2;
    [_titleLabel setFrame:CGRectMake(spaceX, spaceY, labelWidth, labelHeight)];
    
    [super layoutSubviews];
}

/**
 *  Getter and Setter
 *
 *  @return
 */
-(UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:17.0f];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

-(void)setSidBarMenModel:(SideBarMenuModel *)sidBarMenModel
{
    [_titleLabel setText:sidBarMenModel.title];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
