//
//  SpecialCollectionViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/23.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "SpecialCollectionViewCell.h"

@implementation SpecialCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.cornerRadius = 7;
    self.layer.masksToBounds = YES;
    self.clickBtn.layer.cornerRadius = 5;
    self.clickBtn.layer.masksToBounds = YES;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.specialDetailModel.cover_image_url]];
    self.titleLabel.text = self.specialDetailModel.title;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.clickBtn.titleEdgeInsets = UIEdgeInsetsMake(37, -17, 5, 0);
    self.clickBtn.imageEdgeInsets = UIEdgeInsetsMake(3, 17, 10, 17);
    [self.clickBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.specialDetailModel.likes_count] forState:UIControlStateNormal];
    [self.clickBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.specialDetailModel.likes_count+1] forState:UIControlStateSelected];
    self.clickBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    self.clickBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.clickBtn setImage:[UIImage imageNamed:@"Sic_action_compact_favourite_normal"] forState:UIControlStateNormal];
    [self.clickBtn setImage:[UIImage imageNamed:@"Sic_action_favourite_selected"] forState:UIControlStateSelected];
    
//    titleEdgeInsets是titleLabel相对于其上下左右的inset，跟tableView的contentInset是类似的；
//    如果只有title，那titleLabel的 上下左右 都是 相对于Button 的；
//    如果只有image，那imageView的 上下左右 都是 相对于Button 的；
//    如果同时有image和label，那image的 上下左 是 相对于Button 的，右 是 相对于label 的；
//    label的 上下右 是 相对于Button的， 左 是 相对于image 的
//    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    
#warning 点击按钮 尺寸有点问题
    self.clickBtn.backgroundColor = [UIColor lightGrayColor];
    [self.clickBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.likeImgView.hidden = YES;
    self.likes_countLabel.hidden = YES;
}

- (void)clickBtnAction:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        button.imageEdgeInsets = UIEdgeInsetsMake(3, 10, 24, 10);
        button.titleEdgeInsets = UIEdgeInsetsMake(37,-55, 0, 0);
    } else {
        button.imageEdgeInsets = UIEdgeInsetsMake(3, 17, 10, 17);
        button.titleEdgeInsets = UIEdgeInsetsMake(37, -17, 5, 0);
    }
}

- (void)setSpecialDetailModel:(SpecialDetailModel *)specialDetailModel {
    if (_specialDetailModel != specialDetailModel) {
        _specialDetailModel = specialDetailModel;
    }
    [self setNeedsLayout];
}

@end
