//
//  SetupViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/29.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()
{
    UINavigationBar *_navBar;
}

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backBtnAction {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)_createSubviews {
    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, kWidth, 64)];
    [self.view addSubview:_navBar];
    _navBar.barTintColor = [UIColor redColor];
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 31, 10, 20)];
    [backBtn setImage:[UIImage imageNamed:@"ic_old_backward"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((kWidth-100)/2, 31, 100, 20)];
    titleLabel.text = @"礼物说";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
    [_navBar addSubview:titleLabel];
    [_navBar addSubview:backBtn];

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
