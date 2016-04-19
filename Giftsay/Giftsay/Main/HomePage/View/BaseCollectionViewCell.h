//
//  BaseCollectionViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseModel.h"

@interface BaseCollectionViewCell : UICollectionViewCell


@property (nonatomic,strong) BaseModel *baseModel;


@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@property (weak, nonatomic) IBOutlet UIImageView *bgImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;



@end
