//
//  BaseWebViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/4/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()

@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 从网络直接加载
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, kWidth, kHeight-20)];
    NSURL *url = [NSURL URLWithString:self.baseModel.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 20, 20)];
    [backBtn setImage:[UIImage imageNamed:@"com_taobao_tae_sdk_web_view_title_bar_back.9"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}

- (void)backBtnAction:(UIButton *)button {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)setBaseModel:(BaseModel *)baseModel {
    if (_baseModel != baseModel) {
        _baseModel = baseModel;
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
