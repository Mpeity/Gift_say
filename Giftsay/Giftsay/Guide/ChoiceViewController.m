//
//  ChoiceViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/26.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "ChoiceViewController.h"
#import "MainTabBarController.h"

@interface ChoiceViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"me_profilebackground@2x.jpg"]];
    [self _createSubview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_createSubview {
    self.identityView.backgroundColor = [UIColor whiteColor];
    self.identityView.layer.cornerRadius = 5;
    self.identityView.layer.masksToBounds = YES;
    
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"abc_ic_ab_back_holo_light"] forState:UIControlStateNormal];
    self.identityLabel.text = @"请选择您的身份";
    self.identityLabel.textAlignment = NSTextAlignmentCenter;

    self.idTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.idTableView.delegate = self;
    self.idTableView.dataSource = self;
    self.identityView.hidden = YES;
    
    self.genderView.backgroundColor = [UIColor whiteColor];
    self.genderView.layer.cornerRadius = 5;
    self.genderView.layer.masksToBounds = YES;
    self.textLabel.text = @"请选择您的性别";
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    
    self.boyImgView.userInteractionEnabled =YES;
    self.boyImgView.image = [UIImage imageNamed:@"ic_gender_boy"];
    self.boyLabel.text = @"男孩";
    self.boyLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *boyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.boyImgView.width, self.boyImgView.height)];
    [self.boyImgView addSubview:boyBtn];
    [boyBtn addTarget:self action:@selector(boyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.girlImgView.userInteractionEnabled = YES;
    self.girlImgView.image = [UIImage imageNamed:@"ic_gender_girl"];
    self.girlLabel.text = @"女孩";
    self.girlLabel.textAlignment = NSTextAlignmentCenter;
    UIButton *girlBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.girlImgView.width, self.girlImgView.height)];
    [self.girlImgView addSubview:girlBtn];
    [girlBtn addTarget:self action:@selector(girlBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)boyBtnAction:(UIButton *)button {
    self.genderView.hidden = YES;
    self.identityView.hidden = NO;
}

- (void)girlBtnAction:(UIButton *)button {
    self.genderView.hidden = YES;
    self.identityView.hidden = NO;
}

- (IBAction)backBtnAction:(id)sender {
    self.genderView.hidden = NO;
    self.identityView.hidden = YES;
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 3*cell.height, cell.height)];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.center = cell.center;
    [cell.contentView addSubview:textLabel];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(cell.width-cell.height/2, cell.height/4, cell.height/4, cell.height/2)];
    [cell.contentView addSubview:imgView];
    if (indexPath.row == 0) {
        cell.backgroundColor = [UIColor greenColor];
        textLabel.text = @"初中生";
        imgView.image = [UIImage imageNamed:@"ic_old_next_green"];
    } else if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor peachRed];
        textLabel.text = @"高中生";
        imgView.image = [UIImage imageNamed:@"ic_old_next_red"];

    } else if (indexPath.row == 2) {
        cell.backgroundColor = [UIColor mediumOrchid];
        textLabel.text = @"大学生";
        imgView.image = [UIImage imageNamed:@"ic_old_next_purple"];

    } else if (indexPath.row == 3) {
        cell.backgroundColor = [UIColor mediumPink];
        textLabel.text = @"职场新人";
        imgView.image = [UIImage imageNamed:@"ic_old_next_pink"];

    } else {
        cell.backgroundColor = [UIColor orangeColor];
        textLabel.text = @"资深工作党";
        imgView.image = [UIImage imageNamed:@"ic_old_next_brown"];

    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTabBarController *vc = [[MainTabBarController alloc] init];
    [self presentViewController:vc animated:NO completion:nil];
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
