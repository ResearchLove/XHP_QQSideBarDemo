//
//  SideBarMenuModel.h
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SideBarMenuModel : NSObject

@property(strong,nonatomic) NSString *iconURL;
@property(strong,nonatomic) NSString *title;

+(SideBarMenuModel *)CreateMenuItemWithIconPath:(NSString *)iconURL title:(NSString *)title;

@end
