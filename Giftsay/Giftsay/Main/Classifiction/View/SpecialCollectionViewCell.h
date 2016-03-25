//
//  SpecialCollectionViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/23.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialDetailModel.h"

@interface SpecialCollectionViewCell : UICollectionViewCell
//@property (nonatomic,copy) NSString *title;
//@property (nonatomic,copy) NSString *url;
//@property (nonatomic,copy) NSString *share_msg;
//@property (nonatomic,assign) NSInteger likes_count;
@property (nonatomic,strong) SpecialDetailModel *specialDetailModel;

@property (weak, nonatomic) IBOutlet UIImageView *likeImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *likes_countLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UIButton *clickBtn;


@end
