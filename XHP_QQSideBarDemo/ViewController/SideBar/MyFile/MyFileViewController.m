//
//  MyFileViewController.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/13.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MyFileViewController.h"
#import "NavigationBar.h"

@interface MyFileViewController ()

@end

@implementation MyFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的文件"];
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
    // Do any additional setup after loading the view.
}


-(void)backEvent:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
    
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
