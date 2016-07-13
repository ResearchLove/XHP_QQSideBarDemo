//
//  RootTabBarController.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/11.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "RootTabBarController.h"


@interface RootTabBarController ()



@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.tabBar setTintColor:UIColorFromRGB(0x00BFFF)];
    
    NavigationViewController *messageNavVC = [[NavigationViewController alloc]initWithRootViewController:self.messageVC];
    NavigationViewController *contactPersonNavVC = [[NavigationViewController alloc]initWithRootViewController:self.contactPersonVC];
    NavigationViewController *dynamicNavVC = [[NavigationViewController alloc]initWithRootViewController:self.dynamicVC];
    [self setViewControllers:@[messageNavVC,contactPersonNavVC,dynamicNavVC]];
    
    // Do any additional setup after loading the view.
}


-(MessageViewController *)messageVC
{
    if (_messageVC == nil) {
        _messageVC = [[MessageViewController alloc]init];
        [_messageVC.tabBarItem setTitle:@"消息"];
        [_messageVC.tabBarItem setImage:[UIImage imageNamed:@"tabBar_message"]];
        [_messageVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabBar_messageSE"]];
    }
    return _messageVC;
}

-(ContactPersonViewController *)contactPersonVC
{
    if (_contactPersonVC == nil) {
        _contactPersonVC = [[ContactPersonViewController alloc]init];
        [_contactPersonVC.tabBarItem setTitle:@"联系人"];
        [_contactPersonVC.tabBarItem setImage:[UIImage imageNamed:@"tabBar_contactPerson"]];
        [_contactPersonVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabBar_contactPersonSE"]];
    }
    return _contactPersonVC;
    
}

-(DynamicViewController *)dynamicVC
{
    if (_dynamicVC == nil) {
        _dynamicVC = [[DynamicViewController alloc]init];
        [_dynamicVC.tabBarItem setTitle:@"动态"];
        [_dynamicVC.tabBarItem setImage:[UIImage imageNamed:@"tabBar_dynamic"]];
        [_dynamicVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"tabBar_dynamicSE"]];
    }
    return _dynamicVC;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
