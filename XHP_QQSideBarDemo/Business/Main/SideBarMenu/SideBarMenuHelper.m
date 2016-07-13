//
//  SideBarMenuHelper.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "SideBarMenuHelper.h"
#import "SideBarMenuModel.h"

@implementation SideBarMenuHelper

-(id)init
{
    if (self = [super init]) {
        self.dataAry = [[NSMutableArray alloc]init];
        [self initTestData];
    }
    return self;
}

-(void)initTestData
{
    SideBarMenuModel *sideBarMenuModelOne = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"开通会员"];
    SideBarMenuModel *sideBarMenuModelTwo = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"QQ钱包"];
    SideBarMenuModel *sideBarMenuModelThree = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"网上营业厅"];
    SideBarMenuModel *sideBarMenuModelFour = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"个性装扮"];
    SideBarMenuModel *sideBarMenuModelFive = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"我的收藏"];
    SideBarMenuModel *sideBarMenuModelSix = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"我的相册"];
    SideBarMenuModel *sideBarMenuModelSeven = [SideBarMenuModel CreateMenuItemWithIconPath:@"" title:@"我的文件"];
    
    [self.dataAry addObjectsFromArray:@[sideBarMenuModelOne,sideBarMenuModelTwo,sideBarMenuModelThree,sideBarMenuModelFour,sideBarMenuModelFive,sideBarMenuModelSix,sideBarMenuModelSeven]];
    


}

@end
