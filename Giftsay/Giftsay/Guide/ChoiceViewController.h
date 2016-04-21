//
//  ChoiceViewController.h
//  Giftsay
//
//  Created by nick_beibei on 16/2/26.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *genderView;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) IBOutlet UIImageView *boyImgView;

@property (weak, nonatomic) IBOutlet UIImageView *girlImgView;

@property (weak, nonatomic) IBOutlet UILabel *girlLabel;

@property (weak, nonatomic) IBOutlet UILabel *boyLabel;

@property (weak, nonatomic) IBOutlet UIView *identityView;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@property (weak, nonatomic) IBOutlet UILabel *identityLabel;

@property (weak, nonatomic) IBOutlet UITableView *idTableView;

@property (nonatomic,strong) NSMutableArray *allMutaleArray;



@end
