//
//  RootViewController.m
//  XHP_QQSideBarDemo
//
//  Created by xiaohaiping on 16/7/11.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "RootViewController.h"
#import "RootTabBarController.h"
#import "SideBarMenuViewController.h"
#import "WalletViewController.h"
#import "MyFileViewController.h"
#import "MyPhotoAlbumViewController.h"

typedef NS_ENUM(NSInteger,State){
    StateHome,
    StateMenu
};//状态（Home or SideMenu）

static const CGFloat viewSlideHorizonRatio = 0.50;
static const CGFloat viewHeightNarrowRatio = 0.75;
static const CGFloat menuStartNarrowRatio  = 0.70;

@interface RootViewController () <SideBarMenuViewControllerDelegate>

@property (strong,nonatomic) RootTabBarController *rootTabBarController;
@property (strong,nonatomic) SideBarMenuViewController *sideBarMenuVC;
@property (strong,nonatomic) UIImageView *backgroundImageView;
@property (strong,nonatomic) UIView *coverView;

@property (assign,nonatomic) State state;
@property (assign,nonatomic) CGFloat distance;
@property (assign,nonatomic) CGFloat leftDistance;
@property (assign,nonatomic) CGFloat menuCenterStartX; // menu起始中点的X
@property (assign,nonatomic) CGFloat menuCenterEndX;   // menu缩放结束中点的X
@property (assign,nonatomic) CGFloat panStartX;        // 拖动开始的X值

@property (strong,nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.state = StateHome;
    self.menuCenterStartX = WIDTH_SCREEN * menuStartNarrowRatio / 2.0;
    self.menuCenterEndX = self.view.center.x;
    self.leftDistance = WIDTH_SCREEN * viewSlideHorizonRatio;
    
    [self.view addSubview:self.backgroundImageView];
    
    [self.view addSubview:self.sideBarMenuVC.view];
    
    [self.view addSubview:self.coverView];
    
    [self.view addSubview:self.rootTabBarController.view];
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerEvent:)];
    [self.rootTabBarController.view addGestureRecognizer:panGestureRecognizer];
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerEvent:)];
    _tapGestureRecognizer.enabled = NO;
    [self.rootTabBarController.view addGestureRecognizer:_tapGestureRecognizer];
    
    UITapGestureRecognizer *userImageTopGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userImageTopGestureRecognizerEvent:)];
    [self.rootTabBarController.messageVC.userImageView addGestureRecognizer:userImageTopGestureRecognizer];
    
    [self addChildViewController:self.rootTabBarController];
    

    
    // Do any additional setup after loading the view.
}

/**
 *  设置状态栏的样式
 *
 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
    
}

/**
 *   处理滑动事件
 *
 *  @param recognizer
 */
- (void)panGestureRecognizerEvent:(UIPanGestureRecognizer *)recognizer {
    //当滑动水平大于75时禁止滑动
    if(recognizer.state == UIGestureRecognizerStateBegan){
        self.panStartX = [recognizer locationInView:self.view].x;
    }
    
    if (self.state == StateHome && self.panStartX >= 75) {
        return;
    }
    
    CGFloat x = [recognizer translationInView:self.view].x;
    
    //禁止在主页面的时候向左滑动
    if(self.state == StateHome  && x < 0){
        return;
    }
    
    CGFloat distance = self.distance + x;
    //当手势停止时执行操作
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        if(distance >= WIDTH_SCREEN * viewSlideHorizonRatio / 2.0){
            [self showSideBarMenu];
        }else{
            [self showHome];
        }
        return;
    }
    
    CGFloat proportion = (viewHeightNarrowRatio - 1) * distance / self.leftDistance + 1;
    if (proportion < viewHeightNarrowRatio || proportion > 1) {
        return;
    }
    self.rootTabBarController.view.center = CGPointMake(self.view.center.x + distance, self.view.center.y);
    self.rootTabBarController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
    
    self.rootTabBarController.messageVC.userImageView.alpha = self.coverView.alpha = 1 - distance / self.leftDistance;
    
    CGFloat menuProportion = distance * (1 - menuStartNarrowRatio) / self.leftDistance + menuStartNarrowRatio;
    CGFloat menuCenterMove = distance * (self.menuCenterEndX - self.menuCenterStartX) / self.leftDistance;
    self.sideBarMenuVC.view.center = CGPointMake(self.menuCenterStartX + menuCenterMove, self.view.center.y);
    self.sideBarMenuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion);
}

/**
 *  处理屏幕点击事件
 *
 */
- (void)tapGestureRecognizerEvent:(UIPanGestureRecognizer *)recognizer
{
    [self showHome];
}

/**
 *  添加点击头像点击手势
 */
- (void)userImageTopGestureRecognizerEvent:(UIPanGestureRecognizer *)recognizer
{
    [self showSideBarMenu];
}

/**
 *  展示侧边栏
 */
-(void)showSideBarMenu
{
    _tapGestureRecognizer.enabled = YES;   //打开手势
    self.distance =  self.leftDistance;
    self.state = StateMenu;
    [self doSlide:viewHeightNarrowRatio];
}

/**
 *  展示主页面
 */
-(void)showHome
{
    _tapGestureRecognizer.enabled = NO;  //禁用手势
    self.distance = 0;
    self.state = StateHome;
    [self doSlide:1];
}

/**
 *  实现滑动效果
 *
 *  @param proportion 滑动比例
 */
-(void)doSlide:(CGFloat)proportion
{
    [UIView animateWithDuration:0.3 animations:^{
        self.rootTabBarController.view.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
        self.rootTabBarController.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, proportion, proportion);
        self.rootTabBarController.messageVC.userImageView.alpha =  self.coverView.alpha = proportion == 1 ? 1 : 0;
        CGFloat menuCenterX;
        CGFloat menuProportion;
        
        if (proportion == 1) {
            menuCenterX = self.menuCenterStartX;
            menuProportion = menuStartNarrowRatio;
        } else {
            menuCenterX = self.menuCenterEndX;
            menuProportion = 1;
        }
        self.sideBarMenuVC.view.center = CGPointMake(menuCenterX, self.view.center.y);
        self.sideBarMenuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuProportion, menuProportion);
    }];
}

/**
 *  Getter and Setter
 *
 */
-(UIImageView *)backgroundImageView
{
    if (_backgroundImageView == nil) {
        _backgroundImageView = [[UIImageView alloc]init];
        _backgroundImageView.frame = [[UIScreen mainScreen] bounds];
        [_backgroundImageView setImage:[UIImage imageNamed:@"sideMenuBackground"]];
    }
    return _backgroundImageView;
}

-(SideBarMenuViewController *)sideBarMenuVC
{
    if (_sideBarMenuVC == nil) {
        _sideBarMenuVC = [[SideBarMenuViewController alloc]init];
        _sideBarMenuVC.view.frame = [[UIScreen mainScreen] bounds];
        _sideBarMenuVC.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, menuStartNarrowRatio, menuStartNarrowRatio);
        _sideBarMenuVC.view.center = CGPointMake(self.menuCenterStartX, self.sideBarMenuVC.view.center.y);
        _sideBarMenuVC.delegate = self;
    }
    return _sideBarMenuVC;
}

-(RootTabBarController *)rootTabBarController
{
    if (_rootTabBarController == nil) {
        _rootTabBarController = [[RootTabBarController alloc]init];
        [_rootTabBarController.view setFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];

    }
    return _rootTabBarController;
}

-(UIView *)coverView
{
    if (_coverView == nil) {
        _coverView = [[UIView alloc]init];
        [_coverView setFrame:[UIScreen mainScreen].bounds];
        _coverView.backgroundColor = [UIColor blackColor];
    }
    return _coverView;
}

/**
 *  SideBarMenuViewControllerDelegate
 *
 */
-(void)sideBarMenuViewController:(SideBarMenuViewController *)sideBarMenuViewController clickMenuItem:(NSString *)title
{
    if ([title isEqualToString:@"QQ钱包"]) {
        WalletViewController *welletVC = [[WalletViewController alloc]init];
        welletVC.hidesBottomBarWhenPushed = YES;
        [(UINavigationController *)[_rootTabBarController.viewControllers objectAtIndex:_rootTabBarController.selectedIndex] pushViewController:welletVC animated:YES];
        [self showHome];
    }else if ([title isEqualToString:@"我的相册"]){
        MyPhotoAlbumViewController *myPhoAlbVC = [[MyPhotoAlbumViewController alloc]init];
        myPhoAlbVC.hidesBottomBarWhenPushed = YES;
        [(UINavigationController *)[_rootTabBarController.viewControllers objectAtIndex:_rootTabBarController.selectedIndex] pushViewController:myPhoAlbVC animated:YES];
        [self showHome];
    }else if([title isEqualToString:@"我的文件"]){
        MyFileViewController *myFilVC = [[MyFileViewController alloc]init];
         myFilVC.hidesBottomBarWhenPushed = YES;
        [(UINavigationController *)[_rootTabBarController.viewControllers objectAtIndex:_rootTabBarController.selectedIndex] pushViewController:myFilVC animated:YES];
        [self showHome];
    }
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
