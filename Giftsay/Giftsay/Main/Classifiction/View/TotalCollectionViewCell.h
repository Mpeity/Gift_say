//
//  TotalCollectionViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/22.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TotalModel.h"

@interface TotalCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) TotalModel *totalModel;


@property (weak, nonatomic) IBOutlet UIImageView *splitLineImgView;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
