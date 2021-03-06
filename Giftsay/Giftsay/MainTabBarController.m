//
//  MainTabBarController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseViewController.h"
#import "HomePageViewController.h"

@interface MainTabBarController ()
{
    NSDictionary *_infoDic;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tabBar.translucent = NO;
    [self _createSubViewControllers];
    [self _createTabBarView];
    NSLog(@"%@",_allArray);
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setObject:_allArray forKey:@"data"];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"dataNotification" object:self userInfo:dic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:@"dataNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)notificationAction:(NSNotification *)notification {
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationHome" object:self userInfo:notification.userInfo];
    _infoDic = [[NSDictionary alloc] init];
    _infoDic = [notification.userInfo mutableCopy];
    NSArray *dataArray = [notification.userInfo objectForKey:@"data"];
    if (dataArray != nil && dataArray.count != 0) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:dataArray] forKey:@"HomeData"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

#pragma mark - 创建五个ViewController
- (void)_createSubViewControllers {
    NSArray *names = @[@"HomePage",@"Favorite",@"Classifiction",@"Individual"];
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    for (NSString *name in names) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]];
        BaseViewController *vc = [storyboard instantiateInitialViewController];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcArray addObject:nav];
    }
    self.viewControllers = vcArray;
}

- (void)setAllArray:(NSMutableArray *)allArray {
    if (_allArray != allArray) {
        _allArray = allArray;
    }
}

#pragma mark - 自定义TabBar
- (void)_createTabBarView {
    NSArray *imgNames = @[@"Xic_tab_home_normal",@"Xic_tab_select_normal",@"Xic_tab_category_normal",@"Xic_tab_profile_normal"];
    NSArray *selectedImgNames = @[@"Xic_tab_home_selected",@"Xic_tab_select_selected",@"Xic_tab_category_selected.png",@"Xic_tab_profile_selected"];
    NSArray *titles = @[@"首页",@"热门",@"分类",@"个人"];
    for (int i = 0; i<imgNames.count; i++) {
        // 可以自定义title、图⽚
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:[UIImage imageNamed:imgNames[i]] tag:i];
        //渲染保持原图
        tabBarItem.selectedImage = [[UIImage imageNamed:selectedImgNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem = tabBarItem;
    }
}

//#pragma mark - CreateTabBar 创建底部的tabBar
//- (void)_createTabBarView {
//    // 把原tabBar上的按钮移除
//    for (UIView *view in self.tabBar.subviews) {
//        Class class = NSClassFromString(@"UITabBarButton");
//        if ([view isKindOfClass:class]) {
//            [view removeFromSuperview];
//        }
//    }
//    
//    // 创建底部标签视图
//    _tabBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth , 49)];
//    _tabBarView.userInteractionEnabled = YES;
//    [self.tabBar addSubview:_tabBarView];
//    
//    // 添加背景图片 （未选好）
//    _selectImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 49)];
//    _selectImgView.image = [UIImage imageNamed:@""];
//    [self.tabBar addSubview:_selectImgView];
//    // 底部标签视图 添加5个button
//    NSArray *imageNames = @[ @"tabbar_home_highlighted@2x",
//                             @"tabbar_discover_highlighted@2x",
//                             @"tabbar_compose_background_icon_add@2x",
//                             @"tabbar_profile_highlighted@2x",
//                             @"tabbar_more_highlighted@2x"
//                             ];
//    
//    CGFloat kItemWidth = kScreenWidth/5.0;
//    for (int i = 0; i<imageNames.count; i++) {
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*kItemWidth, 0, kItemWidth, 49)];
//        [button setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
//        button.tag = i;
//        [button addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//        [self.tabBar addSubview:button];
//    }
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
