//
//  SideBarMenuModel.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "SideBarMenuModel.h"

@implementation SideBarMenuModel

+(SideBarMenuModel *)CreateMenuItemWithIconPath:(NSString *)iconURL title:(NSString *)title
{
    SideBarMenuModel *sideBarMenuModel = [[SideBarMenuModel alloc]init];
    sideBarMenuModel.iconURL = iconURL;
    sideBarMenuModel.title = title;
    return sideBarMenuModel;
}

@end
