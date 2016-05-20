//
//  LoginViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "LoginViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>

@interface LoginViewController ()<TencentSessionDelegate>{
    UIButton *qqLoginBtn;
    TencentOAuth *tencentOAuth;
    NSArray *permissions;
    UILabel *resultLable;
    UILabel *tokenLable;
    UIWebView *qqWebView;
}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    tencentOAuth=[[TencentOAuth alloc]initWithAppId:TencentAPPId andDelegate:self];
//    //查看本地 有没有上一次QQ登录的信息
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSDictionary *authData = [defaults objectForKey:@"TencentOAuthData"];
//    NSLog(@"Tencent -------%@",authData);
//    if ([authData objectForKey:@"AccessTokenKey"] && [authData objectForKey:@"ExpirationDateKey"] && [authData objectForKey:@"openId"])
//    {
//        [tencentOAuth setAccessToken:[authData objectForKey:@"AccessTokenKey"]];
//        [tencentOAuth setExpirationDate:[authData objectForKey:@"ExpirationDateKey"]];
//        [tencentOAuth setOpenId:[authData objectForKey:@"openId"]];
//        
//    }
}

////qq登陆
//- (IBAction)loginBtnClick:(UIButton *)sender {
//    
//    if ([tencentOAuth isSessionValid]) {
//        [tencentOAuth getUserInfo];
//    }
//    else {
//        [self qqLog];
//    }
//}
////qq登陆
//- (void)qqLog{
//    //2,初始 lable
//    resultLable=[[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 36)];
//    tokenLable=[[UILabel alloc]initWithFrame:CGRectMake(30, 150, 200, 36)];
//    [self.view addSubview:resultLable];
//    [self.view addSubview:tokenLable];
//    
//    permissions= [NSArray arrayWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
//    [tencentOAuth authorize:permissions inSafari:NO];
//}
//
//
//
//
//#pragma mark -- TencentSessionDelegate
//
////登陆完成调用
//- (void)tencentDidLogin
//{
//    resultLable.text = @"登录完成";
//    if (tencentOAuth.accessToken && 0 != [tencentOAuth.accessToken length])
//    {
//        // 记录登录用户的OpenID、Token以及过期时间
//        NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
//                                  tencentOAuth.accessToken, @"AccessTokenKey",
//                                  tencentOAuth.expirationDate, @"ExpirationDateKey",
//                                  tencentOAuth.openId,@"openId",nil];
//        [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"TencentOAuthData"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        tokenLable.text = tencentOAuth.accessToken;
//    }
//    else
//    {
//        tokenLable.text = @"登录不成功 没有获取accesstoken";
//    }
//    
//}
//
////非网络错误导致登录失败：
//-(void)tencentDidNotLogin:(BOOL)cancelled
//{
//    NSLog(@"tencentDidNotLogin");
//    if (cancelled)
//    {
//        resultLable.text = @"用户取消登录";
//    }else{
//        resultLable.text = @"登录失败";
//    }
//}
//// 网络错误导致登录失败：
//-(void)tencentDidNotNetWork
//{
//    NSLog(@"tencentDidNotNetWork");
//    resultLable.text = @"无网络连接，请设置网络";
//}
//
//-(void)getUserInfoResponse:(APIResponse *)response
//{
//    NSLog(@"respons:%@",response.jsonResponse);
//    uModel = [[UserModel alloc] init];
//    [uModel setValuesForKeysWithDictionary:response.jsonResponse];
//    
//    userID = [ChineseToPinyin pinyinFromChiniseString:uModel.nickname];
//    password1 = @"19lou";
//    [DGTools setObject:[userID lowercaseString] forKey:kUserID];
//    [DGTools setObject:password1 forKey:kPassword];
//    [self huanxinRegist];
//}
//
//
//
////环信注册
//- (void)huanxinRegist{
//    
//    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:userID password:password1 withCompletion:^(NSString *username, NSString *password, EMError *error) {
//        if (!error) {
//            NSLog(@"注册成功！");
//        }
//        [self huanxinLog:userID password:password1];
//    } onQueue:nil];
//}
//
////异步登陆
//- (void)huanxinLog:(NSString *)uID password:(NSString *)pwd{
//    
//    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:uID password:pwd completion:^(NSDictionary *loginInfo, EMError *error) {
//        NSLog(@"---loginInfo:%@",loginInfo);
//        NSLog(@"---error:%@",error);
//        NSLog(@"成功登陆");
//        ChatRoomViewController *chatRoomVC = [[ChatRoomViewController alloc] init];
//        chatRoomVC.userModel = uModel;
//        [self presentViewController:chatRoomVC animated:YES completion:nil];
//    } onQueue:nil];
//}
@end
