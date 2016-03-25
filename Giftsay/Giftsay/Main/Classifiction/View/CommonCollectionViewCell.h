//
//  CommonCollectionViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/21.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelsModel.h"

@interface CommonCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon_imgView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic,strong) ChannelsModel *channelModel;

@end
