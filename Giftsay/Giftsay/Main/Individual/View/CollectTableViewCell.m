//
//  CollectTableViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/5/19.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "CollectTableViewCell.h"

@implementation CollectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.numberOfLines = 0;
}



- (void)setItemModel:(ItemsModel *)itemModel {
    if (_itemModel != itemModel) {
        _itemModel = itemModel;
    }
    [self setNeedsDisplay];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSString *urlStr = self.itemModel.cover_image_url;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    self.titleLabel.text = self.itemModel.description; //
    self.titleLabel.font = [UIFont systemFontOfSize:15];
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
