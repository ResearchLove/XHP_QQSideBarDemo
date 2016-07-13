//
//  SideBarMenuCell.h
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "SideBarMenuModel.h"

@interface SideBarMenuCell : CommonTableViewCell

@property (nonatomic,strong) UILabel *titleLabel;

@property (strong,nonatomic) SideBarMenuModel *sidBarMenModel;

@end
