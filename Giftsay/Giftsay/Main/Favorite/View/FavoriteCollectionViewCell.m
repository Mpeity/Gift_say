//
//  FavoriteCollectionViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FavoriteCollectionViewCell.h"

@implementation FavoriteCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.backgroundColor = [UIColor clearColor];
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.descriptionLabel.numberOfLines = 0;
}


- (void)setFavoriteModel:(FavoriteModel *)favoriteModel {
    if (_favoriteModel != favoriteModel) {
        _favoriteModel = favoriteModel;
    }
    [self setNeedsDisplay];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSString *urlStr = self.favoriteModel.cover_image_url;
    [self.coverImgView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    self.descriptionLabel.text = self.favoriteModel.name; //
    self.descriptionLabel.font = [UIFont systemFontOfSize:15];
    self.likesCountLabel.text = [NSString stringWithFormat:@"%.1fK",round(self.favoriteModel.likes_count)/1000];
    self.likesCountLabel.textAlignment = NSTextAlignmentCenter;
    self.likesCountLabel.textColor = [UIColor grayColor];
    self.likesCountLabel.font = [UIFont systemFontOfSize:14];
    self.likeImgView.image = [UIImage imageNamed:@"ic_small_heart_normal"];
    self.priceLabel.text = self.favoriteModel.price;
    self.priceLabel.textColor = [UIColor redColor];
}






@end
