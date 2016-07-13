//
//  SideBarMenuViewController.h
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "CommonViewController.h"

#define USERIMAGEWIDTH 50.0f

#define SETTINGWIDTH  35.0f


@class SideBarMenuViewController;

@protocol SideBarMenuViewControllerDelegate <NSObject>

-(void) sideBarMenuViewController:(SideBarMenuViewController *)sideBarMenuViewController clickMenuItem:(NSString *)title;

@end

@interface SideBarMenuViewController : CommonViewController

@property (strong,nonatomic) NSMutableArray *dataAry;

@property (weak,nonatomic) id <SideBarMenuViewControllerDelegate> delegate;

@end
