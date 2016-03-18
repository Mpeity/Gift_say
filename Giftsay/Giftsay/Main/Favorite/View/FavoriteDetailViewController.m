//
//  FavoriteDetailViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/16.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FavoriteDetailViewController.h"
#import "TaoBaoViewController.h"

@interface FavoriteDetailViewController ()

@end

@implementation FavoriteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _createSubviews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_createSubviews {
    // 从网络直接加载
    // 01 创建webView url
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    NSString *urlStr = _favoriteModel.url;
    NSURL *url = [NSURL URLWithString:urlStr];
    // 02 创建网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
//    [self.view addSubview:webView];
    
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 300)];
    coverView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8];
    [self.view addSubview:coverView];
    
    // 底部tab的创建
    UIView *tabView = [[UIView alloc] initWithFrame:CGRectMake(0, kHeight-49, kWidth, 49)];
    tabView.backgroundColor = [UIColor whiteColor];
    tabView.layer.borderWidth = 1;
    [self.view addSubview:tabView];
    UIButton *likeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 7, tabView.width*0.40, 35)];
    [tabView addSubview:likeButton];
    likeButton.layer.borderColor = [[UIColor redColor] CGColor];
    likeButton.layer.borderWidth = 1.5;
    likeButton.layer.cornerRadius = 20;
    likeButton.layer.masksToBounds = YES;
    [likeButton setImage:[UIImage imageNamed:@"ic_action_compact_favourite_normal"] forState:UIControlStateNormal];
    [likeButton setImage:[UIImage imageNamed:@"ic_action_compact_favourite_selected"] forState:UIControlStateSelected];
    [likeButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [likeButton setTitle:@"收藏" forState:UIControlStateNormal];
    [likeButton setTitle:@"已收藏" forState:UIControlStateSelected];
    [likeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 10)];
    [likeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [likeButton addTarget:self action:@selector(likeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buyButton = [[UIButton alloc] initWithFrame:CGRectMake(tabView.width*0.40+30, 7, tabView.width*0.50, 35)]; // bg_accent_badge.9
    
//    UIImage *image = [UIImage imageNamed:@"bg_accent_badge.9"];
//    image = [image stretchableImageWithLeftCapWidth:0.5 topCapHeight:0.5]; 拉伸图片
    [buyButton setTitle:@"去淘宝购买" forState:UIControlStateNormal];
    [buyButton setTintColor:[UIColor whiteColor]];
    buyButton.layer.borderWidth = 1.5;
    buyButton.layer.borderColor = [[UIColor redColor] CGColor];
    buyButton.layer.cornerRadius = 20;
    buyButton.layer.masksToBounds = YES;
    buyButton.backgroundColor = [UIColor redColor];
    [buyButton addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [tabView addSubview:buyButton];
}

- (void)likeBtnAction:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)buyBtnAction:(UIButton *)button {
    TaoBaoViewController *vc = [[TaoBaoViewController alloc] init];
    vc.favoriteModel = _favoriteModel;
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)setFavoriteModel:(FavoriteModel *)favoriteModel {
    if (_favoriteModel != favoriteModel) {
        _favoriteModel = favoriteModel;
    }
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
