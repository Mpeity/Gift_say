//
//  FuncTableViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsModel.h"

@interface FuncTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;

@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@property (nonatomic,strong) ItemsModel *itemsModel;
@end
