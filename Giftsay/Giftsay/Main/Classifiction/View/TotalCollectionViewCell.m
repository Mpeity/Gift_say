//
//  TotalCollectionViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/22.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "TotalCollectionViewCell.h"

@implementation TotalCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.titleLabel.numberOfLines = 0;
    self.layer.cornerRadius = 7;
    self.layer.masksToBounds = YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setTotalModel:(TotalModel *)totalModel {
    if (_totalModel != totalModel) {
        _totalModel = totalModel;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.totalModel.cover_image_url]];
    self.subtitleLabel.text = self.totalModel.subtitle;
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    self.subtitleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.text = self.totalModel.title;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.splitLineImgView.image = [UIImage imageNamed:@"ig_topic_horizontal_rule.9.png"];
    
}

@end
