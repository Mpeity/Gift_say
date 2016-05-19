//
//  IndividualViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "IndividualViewController.h"
#import "LogInViewController.h"
#import "SetupViewController.h"
#import "CodeScanController.h"
#import "CollectFmbd.h"
#import "ItemsModel.h"
#import "FavoriteModel.h"
#import "PlayerViewController.h"
#import "ItemsViewController.h"
#import "CollectTableViewCell.h"


static NSString *giftCell = @"giftCell";

@interface IndividualViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *_bgImgView; //头部背景
    UIView *_funcView; // 功能框视图
    UIButton *_giftBtn; // 礼物按钮
    UIButton *_strategyBtn; // 攻略按钮
    UIButton *_logInBtn; // 登录按钮
    UITableView *_giftTableView; //
    UITableView *_strategTableyView; //
    UIImageView *_scrollImgView; // 滑动条
}

@property (nonatomic,strong) NSMutableArray *countArray;

@property (nonatomic,strong) NSMutableArray *giftArray;

@end

@implementation IndividualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self performSelector:@selector(_loadData) withObject:nil afterDelay:3];
    [self _createSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 左边button响应方法
- (void)leftAction {
    
}

#pragma mark - 右边设置button响应方法
- (void)setupBtnAction:(UIButton *)button {
    SetupViewController *vc = [[SetupViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark - 右边二维码扫描button响应方法
- (void)scanBtnAction:(UIButton *)button {
    NSLog(@"扫描");
    CodeScanController *vc = [[CodeScanController alloc] init];
//    [self presentViewController:vc animated:NO completion:nil];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)playerBtnAction:(UIButton *)button {
    PlayerViewController *vc = [[PlayerViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:NO];
        [self presentViewController:vc animated:NO completion:nil];

}


#pragma mark - 创建子视图
- (void)_createSubviews {
    self.navigationController.navigationBarHidden = YES;

    // 头部背景视图
    _bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight*0.35)];
    _bgImgView.userInteractionEnabled = YES;
    _bgImgView.image = [UIImage imageNamed:@"个人背景.jpg"];
    [self.view addSubview:_bgImgView];
    
    // 左边button  icon_login_message
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 25, 20, 20)];
    [leftButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"icon_message"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(playerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bgImgView addSubview:leftButton];
    
    
    // 右边设置button
    UIButton *setupBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth-40, 25, 20, 20)];
    [setupBtn addTarget:self action:@selector(setupBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [setupBtn setImage:[UIImage imageNamed:@"me_settings"] forState:UIControlStateNormal];
    [_bgImgView addSubview:setupBtn];
    
    // 右边扫描button  ic_toolkit_zebra_scanner
    UIButton *scanBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth-90, 25, 20, 20)];
    [scanBtn setImage:[UIImage imageNamed:@"icon_scan"] forState:UIControlStateNormal];
    [scanBtn addTarget:self action:@selector(scanBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [_bgImgView addSubview:scanBtn];
    
    
    
    // 头部视图登录按钮  Sme_avatar_boy
    _logInBtn = [[UIButton alloc] initWithFrame:CGRectMake((_bgImgView.width-70)/2, (_bgImgView.height-100)/2, 70, 100)];
    [_bgImgView addSubview:_logInBtn];
    [_logInBtn setImage:[UIImage imageNamed:@"Sme_avatar_girl"] forState:UIControlStateNormal];
    [_logInBtn setTitle:@"未登录" forState:UIControlStateNormal];
    [_logInBtn setTitle:@"已登录" forState:UIControlStateSelected];
    [_logInBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_logInBtn addTarget:self action:@selector(logInBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //    titleEdgeInsets是titleLabel相对于其上下左右的inset，跟tableView的contentInset是类似的；
    //    如果只有title，那titleLabel的 上下左右 都是 相对于Button 的；
    //    如果只有image，那imageView的 上下左右 都是 相对于Button 的；
    //    如果同时有image和label，那image的 上下左 是 相对于Button 的，右 是 相对于label 的；
    //    label的 上下右 是 相对于Button的， 左 是 相对于image 的
    
    [_logInBtn setTitleEdgeInsets:UIEdgeInsetsMake(80, -130, 0, 0)];
    [_logInBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 30, 0)];
    

    
    
    
    // 功能框视图
    _funcView = [[UIView alloc] initWithFrame:CGRectMake(0, _bgImgView.height, kWidth, kHeight*0.1)];
    UIImageView *funcBgImgView = [[UIImageView alloc] initWithFrame:_funcView.bounds];
    [funcBgImgView sd_setImageWithURL:[NSURL URLWithString:@"http://image7.360doc.com/DownloadImg/2010/01/1013/2141262_216.jpg"]];
    [_funcView addSubview:funcBgImgView];
    [self.view addSubview:_funcView];
  
//    _funcView.backgroundColor = [UIColor lavender];
    
//    [self.view addSubview:_funcView];
//    NSArray *titleArray = @[@"购物车",@"订单",@"礼券",@"客服"];
//    // Xicon_cart  Xicon_coupon  Xicon_order Xicon_service
//    NSArray *imgNameArray = @[@"Xicon_cart",@"Xicon_order",@"Xicon_coupon",@"Xicon_service"];
//    for (int i = 0; i<4; i++) {
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20+i*90, 0, 70, _funcView.height)];
//        [_funcView addSubview:button];
//        [button setTitle:titleArray[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setFont:[UIFont systemFontOfSize:14]];
//        [button setImage:[UIImage imageNamed:imgNameArray[i]] forState:UIControlStateNormal];
//        button.tag = i;
//        button.titleEdgeInsets = UIEdgeInsetsMake(43, -50, 3, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(10, 20, 26.7, 20);
//    }
    
    
    
    
    // 礼物按钮
    _giftBtn = [[UIButton alloc] initWithFrame:CGRectMake(-2, CGRectGetMaxY(_funcView.frame)+10, kWidth/2+2, kHeight*0.06)];
    _giftBtn.layer.borderWidth = 1;
    _giftBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    [_giftBtn setTitle:@"礼物" forState:UIControlStateNormal];
    [_giftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_giftBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [_giftBtn addTarget:self action:@selector(giftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_giftBtn];
    
    // 攻略按钮
    _strategyBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth/2, CGRectGetMaxY(_funcView.frame)+10, kWidth/2+2, kHeight*0.06)];
    _strategyBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _strategyBtn.layer.borderWidth = 1;
    [_strategyBtn setTitle:@"攻略" forState:UIControlStateNormal];
    [_strategyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_strategyBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [_strategyBtn addTarget:self action:@selector(strategyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_strategyBtn];
    
    // 滑动条
    _scrollImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_giftBtn.frame)-2, kWidth/2, 2)];
    _scrollImgView.image = [UIImage imageNamed:@"bg_datepicker.9"];
    [self.view addSubview:_scrollImgView];
    
    // 礼物收藏视图
    _giftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_giftBtn.frame), kWidth, kHeight*0.4) style:UITableViewStylePlain];
//    [_giftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:giftCell];
    _giftTableView.delegate = self;
    _giftTableView.dataSource = self;
    _giftTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    [self.view addSubview:_giftTableView];
    // 攻略收藏视图
    _strategTableyView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_giftBtn.frame), kWidth, kHeight*0.4) style:UITableViewStylePlain];
    [_strategTableyView registerClass:[UITableViewCell class] forCellReuseIdentifier:giftCell];
    _strategTableyView.delegate = self;
    _strategTableyView.dataSource = self;
    [self.view addSubview:_strategTableyView];
    _strategTableyView.hidden = YES;
}

- (void)_loadData {
    [[CollectFmbd sharedManager] readAllProvinces:^(FMDatabase *db, BOOL success, NSArray *resultArray) {
        self.countArray = [resultArray mutableCopy];
    }];
    [_strategTableyView reloadData];
}



#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
//        UITableViewCellStyleDefault,    // 左侧显示textLabel（不显示detailTextLabel），imageView可选（显示在最左边）
//        UITableViewCellStyleValue1,        // 左侧显示textLabel、右侧显示detailTextLabel（默认蓝色），imageView可选（显示在最左边）
//        UITableViewCellStyleValue2,        // 左侧依次显示textLabel(默认蓝色)和detailTextLabel，imageView可选（显示在最左边）
//        UITableViewCellStyleSubtitle    // 左上方显示textLabel，左下方显示detailTextLabel（默认灰色）,imageView可选（显示在最左边）
//    };
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:giftCell forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellStyleDefault;
        ItemsModel *itemsModel = [[ItemsModel alloc] init];
        itemsModel = self.countArray[indexPath.row];
    NSLog(@"%@",self.countArray);
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:itemsModel.cover_image_url]];
        cell.textLabel.text = itemsModel.title;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemsModel *itemsModel = [[ItemsModel alloc] init];
    itemsModel = self.countArray[indexPath.row];
    ItemsViewController *vc = [[ItemsViewController alloc] init];
    vc.itemsModel = itemsModel;
    [self presentViewController:vc animated:NO completion:nil];
    
}


#pragma mark - 头部视图登录按钮
- (void)logInBtnAction:(UIButton *)button {
    button.selected = !button.selected;
    LogInViewController *vc = [[LogInViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark - 功能框视图点击礼物按钮
- (void)giftBtnAction:(UIButton *)button {
    _giftTableView.hidden = NO;
    [self.view addSubview:_giftTableView];
    _strategTableyView.hidden = YES;
    [_strategTableyView removeFromSuperview];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    CGFloat x = button.center.x;
    _scrollImgView.center = CGPointMake(x, CGRectGetMaxY(_giftBtn.frame)-2);
    [UIView commitAnimations];
}

#pragma mark - 功能框视图点击攻略按钮
- (void)strategyBtnAction:(UIButton *)button {
    [self _loadData];
    _giftTableView.hidden = YES;
    [_giftTableView removeFromSuperview];
    [self.view addSubview:_strategTableyView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    CGFloat x = button.center.x;
    _scrollImgView.center = CGPointMake(x, CGRectGetMaxY(_giftBtn.frame)-2);
    [UIView commitAnimations];
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
