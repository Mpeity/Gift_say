//
//  ChoiceViewController.m
//  Giftsay
//
//  Created by nick_beibei on 16/2/26.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "ChoiceViewController.h"
#import "MainTabBarController.h"
#import "ChannelsModel.h"
#import "CommonModel.h"
#import "HomePageViewController.h"

@interface ChoiceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableDictionary *_identityDic; //
    NSMutableArray *_boyArray;
    NSMutableArray *_girlArray;
}

@end

@implementation ChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor lavender];
    _identityDic = [[NSMutableDictionary alloc] init];
    [self _createArray];
    [self _createSubview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 各个模块初始化数据
- (void)_createArray {
    _boyArray = [[NSMutableArray alloc] init];
    _girlArray = [[NSMutableArray alloc] init];
    NSMutableArray *boyMiddle = [[NSMutableArray alloc] init];
    NSMutableArray *boyHigh = [[NSMutableArray alloc] init];
    NSMutableArray *boyCollege = [[NSMutableArray alloc] init];
    NSMutableArray *boyNew = [[NSMutableArray alloc] init];
    NSMutableArray *boyOld = [[NSMutableArray alloc] init];
    NSMutableArray *girlMiddle = [[NSMutableArray alloc] init];
    NSMutableArray *girlHigh = [[NSMutableArray alloc] init];
    NSMutableArray *girlCollege = [[NSMutableArray alloc] init];
    NSMutableArray *girlNew = [[NSMutableArray alloc] init];
    NSMutableArray *girlOld = [[NSMutableArray alloc] init];
    girlMiddle = [@[_allMutaleArray[5],_allMutaleArray[1],_allMutaleArray[4],_allMutaleArray[3],_allMutaleArray[2],_allMutaleArray[25],_allMutaleArray[10],_allMutaleArray[12],_allMutaleArray[14],_allMutaleArray[11],_allMutaleArray[15],_allMutaleArray[13]]  mutableCopy];
    girlHigh = [@[_allMutaleArray[5],_allMutaleArray[1],_allMutaleArray[4],_allMutaleArray[3],_allMutaleArray[2],_allMutaleArray[25],_allMutaleArray[10],_allMutaleArray[12],_allMutaleArray[15],_allMutaleArray[14],_allMutaleArray[13],_allMutaleArray[11]] mutableCopy];
    girlCollege = [@[_allMutaleArray[1],_allMutaleArray[5],_allMutaleArray[3],_allMutaleArray[9],_allMutaleArray[4],_allMutaleArray[6],_allMutaleArray[2],_allMutaleArray[10],_allMutaleArray[25],_allMutaleArray[15],_allMutaleArray[12],_allMutaleArray[13],_allMutaleArray[14],_allMutaleArray[11]] mutableCopy];
    girlNew = [@[_allMutaleArray[1],_allMutaleArray[5],_allMutaleArray[3],_allMutaleArray[9],_allMutaleArray[6],_allMutaleArray[4],_allMutaleArray[2],_allMutaleArray[25],_allMutaleArray[15],_allMutaleArray[10],_allMutaleArray[12],_allMutaleArray[13],_allMutaleArray[11],_allMutaleArray[14]] mutableCopy];
    girlOld = [@[_allMutaleArray[1],_allMutaleArray[5],_allMutaleArray[3],_allMutaleArray[4],_allMutaleArray[6],_allMutaleArray[2],_allMutaleArray[15],_allMutaleArray[10],_allMutaleArray[12],_allMutaleArray[13],_allMutaleArray[14],_allMutaleArray[11]] mutableCopy];
    boyMiddle = [@[_allMutaleArray[4],_allMutaleArray[0],_allMutaleArray[5],_allMutaleArray[3],_allMutaleArray[2],_allMutaleArray[14],_allMutaleArray[10],_allMutaleArray[12],_allMutaleArray[11],_allMutaleArray[15],_allMutaleArray[13]] mutableCopy];
    boyHigh = [@[_allMutaleArray[4],_allMutaleArray[5],_allMutaleArray[0],_allMutaleArray[3],_allMutaleArray[2],_allMutaleArray[10],_allMutaleArray[14],_allMutaleArray[12],_allMutaleArray[13],_allMutaleArray[11],_allMutaleArray[15]] mutableCopy];
    boyCollege = [@[_allMutaleArray[0],_allMutaleArray[4],_allMutaleArray[3],_allMutaleArray[6],_allMutaleArray[2],_allMutaleArray[10],_allMutaleArray[15],_allMutaleArray[12],_allMutaleArray[14],_allMutaleArray[13],_allMutaleArray[11]] mutableCopy];
    boyNew = [@[_allMutaleArray[0],_allMutaleArray[3],_allMutaleArray[4],_allMutaleArray[5],_allMutaleArray[6],_allMutaleArray[2],_allMutaleArray[15],_allMutaleArray[13],_allMutaleArray[10],_allMutaleArray[12],_allMutaleArray[14],_allMutaleArray[11]] mutableCopy];
    boyOld = [@[_allMutaleArray[0],_allMutaleArray[4],_allMutaleArray[3],_allMutaleArray[6],_allMutaleArray[2],_allMutaleArray[15],_allMutaleArray[10],_allMutaleArray[13],_allMutaleArray[12],_allMutaleArray[14],_allMutaleArray[11]] mutableCopy];
    [_girlArray addObject:girlMiddle];
    [_girlArray addObject:girlHigh];
    [_girlArray addObject:girlCollege];
    [_girlArray addObject:girlNew];
    [_girlArray addObject:girlOld];
    [_boyArray addObject:boyMiddle];
    [_boyArray addObject:boyHigh];
    [_boyArray addObject:boyCollege];
    [_boyArray addObject:boyNew];
    [_boyArray addObject:boyOld];
}

- (void)setAllMutaleArray:(NSMutableArray *)allMutaleArray {
    if (_allMutaleArray != allMutaleArray) {
        _allMutaleArray = allMutaleArray;
    }
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
    [_identityDic setObject:@"boy" forKey:@"boy"];
}

- (void)girlBtnAction:(UIButton *)button {
    self.genderView.hidden = YES;
    self.identityView.hidden = NO;
    [_identityDic setObject:@"girl" forKey:@"girl"];

}

- (IBAction)backBtnAction:(id)sender {
    self.genderView.hidden = NO;
    self.identityView.hidden = YES;
}

#pragma mark - tableViewDelegate

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
        imgView.image = [UIImage imageNamed:@"Xic_old_next_green"];
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
    if ([[_identityDic objectForKey:@"boy"] isEqualToString:@"boy"]) {
        MainTabBarController *vc = [[MainTabBarController alloc] init];
        vc.allArray = _boyArray[indexPath.row];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:_boyArray[indexPath.row] forKey:@"data"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"dataNotification" object:self userInfo:dic];
        [self presentViewController:vc animated:NO completion:nil];
    }
    if ([[_identityDic objectForKey:@"girl"] isEqualToString:@"girl"]) {
        MainTabBarController *vc = [[MainTabBarController alloc] init];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        vc.allArray = _girlArray[indexPath.row];
        [dic setObject:_girlArray[indexPath.row] forKey:@"data"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"dataNotification" object:self userInfo:dic];
        [self presentViewController:vc animated:NO completion:nil];
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
