//
//  RootTabBarController.h
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/11.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageViewController.h"
#import "ContactPersonViewController.h"
#import "DynamicViewController.h"
#import "NavigationViewController.h"

@class RootTabBarController;


@interface RootTabBarController : UITabBarController

@property (strong,nonatomic) MessageViewController *messageVC;
@property (strong,nonatomic) ContactPersonViewController *contactPersonVC;
@property (strong,nonatomic) DynamicViewController *dynamicVC;



@end
