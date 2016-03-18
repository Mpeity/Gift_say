//
//  ClassifictionViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "ClassifictionViewController.h"
#import "StrategyView.h"
#import "GiftView.h"
#import "SearchViewController.h"

@interface ClassifictionViewController ()
{
    StrategyView *_strategyView; //
    GiftView *_giftView; //
}

@end

@implementation ClassifictionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor waterPink];
    
    [self _createSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_createSubviews {
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"abc_ic_search_api_holo_light"] style:UIBarButtonItemStylePlain target:self action:@selector(barBtnItemAction)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
    segmentedControl.frame = CGRectMake((kWidth-150)/2, 5, 150, 24);
    [segmentedControl insertSegmentWithTitle:@"攻略" atIndex:0 animated:nil];
    [segmentedControl insertSegmentWithTitle:@"礼物" atIndex:1 animated:nil];
    segmentedControl.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar addSubview:segmentedControl];
    self.navigationItem.titleView = segmentedControl;
    [segmentedControl addTarget:self action:@selector(segmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    _strategyView = [[StrategyView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _strategyView.backgroundColor = [UIColor paleGreen];
    _giftView = [[GiftView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _giftView.backgroundColor = [UIColor peruColor];
    [self.view addSubview:_giftView];
    [self.view addSubview:_strategyView];
    _giftView.hidden = YES;
}

#pragma mark - segmentedControlAction
- (void)segmentedControlAction:(UISegmentedControl *)segmentedControl {
    if (segmentedControl.selectedSegmentIndex == 0) {
        _strategyView.hidden = NO;
        _giftView.hidden = YES;
    }
    if (segmentedControl.selectedSegmentIndex == 1) {
        _strategyView.hidden = YES;
        _giftView.hidden = NO;
    }
}

- (void)barBtnItemAction {
    SearchViewController *vc = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
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
