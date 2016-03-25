//
//  CommonCollectionViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/21.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "CommonCollectionViewCell.h"

@implementation CommonCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.icon_imgView sd_setImageWithURL:[NSURL URLWithString:self.channelModel.icon_url]];
    self.nameLabel.text = self.channelModel.icon_name;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setChannelModel:(ChannelsModel *)channelModel {
    if (_channelModel != channelModel) {
        _channelModel = channelModel;
    }
    [self setNeedsLayout];
}




@end
