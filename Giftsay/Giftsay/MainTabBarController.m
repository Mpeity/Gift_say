//
//  MainTabBarController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createSubViewControllers];
    [self _createTabBarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 创建五个ViewController
- (void)_createSubViewControllers {
    NSArray *names = @[@"HomePage",@"Favorite",@"Classifiction",@"Individual",@"More"];
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    for (NSString *name in names) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:[NSBundle mainBundle]];
        BaseViewController *vc = [storyboard instantiateInitialViewController];
        [vcArray addObject:vc];
    }
    self.viewControllers = vcArray;
}

#pragma mark - 自定义TabBar
- (void)_createTabBarView {
    NSArray *imgNames = @[@"ic_tab_home_normal",@"ic_tab_select_normal",@"ic_tab_category_normal",@"ic_tab_profile_normal",@""];
//    for (int i = 0; i<imgNames.count; i++) {
//        UIBarButtonItem *buttonTtem = [[UIBarButtonItem alloc] init];
//        buttonTtem.tag = 100+i;
//        buttonTtem.image = [UIImage imageNamed:imgNames[i]];
//        [self.tabBar addSubview:buttonTtem];
//    }
    
    NSArray *titles = @[@"",@"",@"",@"",@""];
    
    for (int i = 0; i<5; i++) {
        CGFloat width = kWidth/5;
        CGFloat height = self.tabBar.height;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

        [button setImage:[UIImage imageNamed:imgNames[i]] forState:UIControlStateNormal];

        button.titleLabel.font = [UIFont systemFontOfSize:11];
        //调整image title 位置
        button.titleEdgeInsets = UIEdgeInsetsMake(30, -18, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 20, 0, 0);

        [self.tabBar addSubview:button];
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
