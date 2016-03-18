//
//  TaoBaoViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/16.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "TaoBaoViewController.h"

@interface TaoBaoViewController ()

@end

@implementation TaoBaoViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 从网络直接加载
    // 01 创建webView url
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    NSString *urlStr = _favoriteModel.purchase_url;
    NSURL *url = [NSURL URLWithString:urlStr];
    // 02 创建网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    //    [self.view addSubview:webView];
    [self.view addSubview:webView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
