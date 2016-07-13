//
//  MessageViewController.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/11.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"消息"];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.userImageView];
    
    
    // Do any additional setup after loading the view.
}

/**
 *  Getter and Setter
 *
 */
-(UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc]init];
        [_userImageView setFrame:CGRectMake(0,0,USERIMAGEWIDTH,USERIMAGEWIDTH)];
        [_userImageView setImage:[UIImage imageNamed:@"me"]];
        [_userImageView.layer setMasksToBounds:YES];
        [_userImageView.layer setCornerRadius:USERIMAGEWIDTH / 2];
    }
    return _userImageView;
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
