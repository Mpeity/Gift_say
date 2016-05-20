//
//  CollectTableViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/5/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsModel.h"

@interface CollectTableViewCell : UITableViewCell

@property (nonatomic,strong) ItemsModel *itemModel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
