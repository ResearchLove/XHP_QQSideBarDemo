//
//  SideBarMenuViewController.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/12.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "SideBarMenuViewController.h"
#import "SideBarMenuCell.h"
#import "SideBarMenuHelper.h"
#import "SideBarMenuModel.h"
#import "UIView+Frame.h"

@interface SideBarMenuViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIImageView *userImageView;
@property (strong,nonatomic) UILabel *userNameLabel;
@property (strong,nonatomic) UILabel *toplineLabel;
@property (strong,nonatomic) UILabel *indSigLabel;
@property (strong,nonatomic) UILabel *bottomLabel;

@property (strong,nonatomic) UIImageView *settingImageView;
@property (strong,nonatomic) UILabel *settingLabel;
@property (strong,nonatomic) UILabel *verticalLabel;
@property (strong,nonatomic) UILabel *nightLabel;

@end

@implementation SideBarMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    SideBarMenuHelper *sideBarMenHelper = [[SideBarMenuHelper alloc]init];
    self.dataAry = sideBarMenHelper.dataAry;
    
    [self.view addSubview:self.userImageView];
    [self.view addSubview:self.userNameLabel];
    [self.view addSubview:self.toplineLabel];
    [self.view addSubview:self.indSigLabel];
    [self.view addSubview:self.bottomLabel];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[SideBarMenuCell class] forCellReuseIdentifier:@"SideBarMenuCell"];
    [self.view addSubview:self.settingImageView];
    [self.view addSubview:self.settingLabel];
    [self.view addSubview:self.verticalLabel];
    [self.view addSubview:self.nightLabel];
    
    [self layoutSubviews];
    
    // Do any additional setup after loading the view.
}

-(void)layoutSubviews
{
    CGFloat spaceX = 15.0f;
    CGFloat imageWidth = USERIMAGEWIDTH;
    CGFloat spaceY = self.view.frameHeight * 0.1;
    [_userImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    CGFloat labelX = imageWidth + spaceX * 2;
    CGFloat labelWidht = self.view.frameWidth  - labelX - self.view.frameWidth * 0.3;
    CGSize size = [_userNameLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidht ? labelWidht : size.width;
    CGFloat labelHeight = 40.0f;
    [_userNameLabel setFrame:CGRectMake(labelX, spaceY, size.width, labelHeight)];
    
    spaceY += imageWidth + 10.0f;
    labelWidht = self.view.frameWidth - spaceX - self.view.frameWidth * 0.3;
    labelHeight = 0.5f;
    [_toplineLabel setFrame:CGRectMake(spaceX, spaceY, labelWidht, labelHeight)];
    
    labelWidht = self.view.frameWidth - self.view.frameWidth * 0.35 - spaceX * 2;
    size = [_indSigLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    size.width = size.width > labelWidht ? labelWidht : size.width;
    labelHeight = 30.0f;
    spaceY += 5.0f;
    [_indSigLabel setFrame:CGRectMake(spaceX, spaceY, size.width, labelHeight)];
    
    spaceY += labelHeight + 5.0f;
    labelWidht = self.view.frameWidth - spaceX - self.view.frameWidth * 0.3;
    labelHeight = 0.5f;
    [_bottomLabel setFrame:CGRectMake(spaceX, spaceY, labelWidht, labelHeight)];
    
    spaceX = 0.0f;
    spaceY += 10.0f;
    CGFloat tableWidth = self.view.frameWidth * 0.65;
    CGFloat tableHeight = self.view.frameHeight * 0.55;
    [_tableView setFrame:CGRectMake(spaceX, spaceY, tableWidth, tableHeight)];
    
    spaceX = 20.0f;
    imageWidth = SETTINGWIDTH;
    spaceY = self.view.frameHeight - imageWidth - 20;
    [_settingImageView setFrame:CGRectMake(spaceX, spaceY, imageWidth, imageWidth)];
    
    spaceX += imageWidth + 10.0f;
    labelHeight = 30.0f;
    labelWidht = 40.0f;
    spaceY += 5.0f;
    [_settingLabel setFrame:CGRectMake(spaceX, spaceY, labelWidht, labelHeight)];
    
    spaceX += labelWidht + 20.0f;
    labelHeight = 40.0f;
    spaceY -= 5.0f;
    labelWidht = 1.0f;
    [_verticalLabel setFrame:CGRectMake(spaceX, spaceY, labelWidht, labelHeight)];
    
    spaceX += 30.0f;
    spaceY += 5.0f;
    labelWidht = 50.0f;
    labelHeight = 30.0f;
    [_nightLabel setFrame:CGRectMake(spaceX, spaceY, labelWidht, labelHeight)];

}


/**
 *  UITableViewDataSources
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataAry  count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideBarMenuModel *sideBarModel = [self.dataAry objectAtIndex:indexPath.row];
    SideBarMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SideBarMenuCell"];
    [cell setTopLineStyle:CellLineStyleNone];
    [cell setBottonLineStyle:CellLineStyleNone];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.sidBarMenModel = sideBarModel;
    return cell;
}

/**
 *  UITableViewDelegate
 *
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SideBarMenuModel *sideBarModel = [self.dataAry objectAtIndex:indexPath.row];
    if (_delegate && [_delegate respondsToSelector:@selector(sideBarMenuViewController:clickMenuItem:)]) {
        [_delegate sideBarMenuViewController:self clickMenuItem:sideBarModel.title];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;

}
/**
 *  Getter and Setter
 *
 */

-(UIImageView *)userImageView
{
    if (_userImageView == nil) {
        _userImageView = [[UIImageView alloc]init];
        [_userImageView setImage:[UIImage imageNamed:@"me"]];
        [_userImageView.layer setMasksToBounds:YES];
        [_userImageView.layer setCornerRadius:USERIMAGEWIDTH / 2];
    }
    return _userImageView;
}

-(UILabel *)userNameLabel
{
    if (_userNameLabel == nil) {
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:17.0f];
        _userNameLabel.textColor = [UIColor whiteColor];
        [_userNameLabel setText:@"肖海平"];
    }
    return _userNameLabel;
}

-(UILabel *)toplineLabel
{
    if (_toplineLabel == nil) {
        _toplineLabel = [[UILabel alloc]init];
        [_toplineLabel setBackgroundColor:[UIColor whiteColor]];
    }
    return _toplineLabel;
}


-(UILabel *)indSigLabel
{
    if (_indSigLabel == nil) {
        _indSigLabel = [[UILabel alloc]init];
        _indSigLabel.font = [UIFont systemFontOfSize:15.0f];
        _indSigLabel.textColor = [UIColor whiteColor];
        _indSigLabel.text = @"你觉得人家变了，还不如说自己停止不前！";
    }
    return _indSigLabel;
}

-(UILabel *)bottomLabel
{
    if (_bottomLabel == nil) {
        _bottomLabel = [[UILabel alloc]init];
        [_bottomLabel setBackgroundColor:[UIColor whiteColor]];
    }
    return _bottomLabel;
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
    }
    return _tableView;
}

-(UIImageView *)settingImageView
{
    if (_settingImageView == nil) {
        _settingImageView = [[UIImageView alloc]init];
        [_settingImageView setImage:[UIImage imageNamed:@"setting"]];
    }
    return _settingImageView;
}

-(UILabel *)settingLabel
{
    if (_settingLabel == nil) {
        _settingLabel = [[UILabel alloc]init];
        [_settingLabel setText:@"设置"];
        _settingLabel.textColor = [UIColor whiteColor];
    }
    return _settingLabel;
}

-(UILabel *)verticalLabel
{
    if (_verticalLabel == nil) {
        _verticalLabel = [[UILabel alloc]init];
        _verticalLabel.backgroundColor = [UIColor whiteColor];
    }
    return _verticalLabel;

}

-(UILabel *)nightLabel
{
    if (_nightLabel == nil) {
        _nightLabel = [[UILabel alloc]init];
        [_nightLabel setText:@"夜间"];
        _nightLabel.textColor = [UIColor whiteColor];
    }
    return _nightLabel;
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
