//
//  FuncTableViewCell.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncTableViewCell.h"
#import "CollectFmbd.h"

@implementation FuncTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.bgImgView.layer.cornerRadius = 7;
    self.bgImgView.layer.masksToBounds = YES;
    self.clickBtn.layer.cornerRadius = 5;
    self.clickBtn.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.bgImgView sd_setImageWithURL:[NSURL URLWithString:self.itemsModel.cover_image_url]];
    self.titleLabel.text = self.itemsModel.title;
    self.titleLabel.textColor = [UIColor whiteColor];
//    self.clickBtn.titleEdgeInsets = UIEdgeInsetsMake(37, -17, 5, 0);
//    self.clickBtn.imageEdgeInsets = UIEdgeInsetsMake(3, 17, 10, 17);
    self.clickBtn.imageEdgeInsets = UIEdgeInsetsMake(3, 10, 24, 10);
    self.clickBtn.titleEdgeInsets = UIEdgeInsetsMake(37,-55, 0, 0);
    [self.clickBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.itemsModel.likes_count] forState:UIControlStateNormal];
    [self.clickBtn setTitle:[NSString stringWithFormat:@"%ld",(long)self.itemsModel.likes_count+1] forState:UIControlStateSelected];
    self.clickBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    self.clickBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    icon_favorite_batch_grey    icon_favorite_batch_red  Sic_action_compact_favourite_normal Sic_action_favourite_selected
    [self.clickBtn setImage:[UIImage imageNamed:@"icon_favorite_batch_grey"] forState:UIControlStateNormal];
    [self.clickBtn setImage:[UIImage imageNamed:@"icon_favorite_batch_red"] forState:UIControlStateSelected];
    
    //    titleEdgeInsets是titleLabel相对于其上下左右的inset，跟tableView的contentInset是类似的；
    //    如果只有title，那titleLabel的 上下左右 都是 相对于Button 的；
    //    如果只有image，那imageView的 上下左右 都是 相对于Button 的；
    //    如果同时有image和label，那image的 上下左 是 相对于Button 的，右 是 相对于label 的；
    //    label的 上下右 是 相对于Button的， 左 是 相对于image 的
    //    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    
#warning 点击按钮 尺寸有点问题
    self.clickBtn.backgroundColor = [UIColor lightGrayColor];
    [self.clickBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickBtnAction:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        button.imageEdgeInsets = UIEdgeInsetsMake(3, 10, 24, 10);
        button.titleEdgeInsets = UIEdgeInsetsMake(37,-35, 0, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(3, 10, 24, 10);
//        button.titleEdgeInsets = UIEdgeInsetsMake(37,-55, 0, 0);
        [[CollectFmbd sharedManager] addIndex:self.itemsModel.identity  WithTitle:self.itemsModel.title WithCoverImgUrl:self.itemsModel.cover_image_url];
    } else {
        button.imageEdgeInsets = UIEdgeInsetsMake(3, 10, 24, 10);
        button.titleEdgeInsets = UIEdgeInsetsMake(37,-55, 0, 0);
//        button.titleEdgeInsets = UIEdgeInsetsMake(37, -17, 5, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(3, 17, 10, 17);
        [[CollectFmbd sharedManager] deleteDataWithIndex:self.itemsModel.identity];
    }
}

- (void)setItemsModel:(ItemsModel *)itemsModel {
    if (_itemsModel != itemsModel) {
        _itemsModel = itemsModel;
    }
    [self setNeedsLayout];
}


@end
