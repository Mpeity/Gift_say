//
//  FavoriteCollectionViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/15.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteModel.h"

@interface FavoriteCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) FavoriteModel *favoriteModel;
@property (nonatomic,strong) NSMutableDictionary *favoriteDic;


//@property (nonatomic,copy) NSString *cover_image_url; //
//@property (nonatomic,copy) NSString *cover_webp_url; //
//@property (nonatomic,copy) NSString *descriptions; //
//@property (nonatomic,strong) NSMutableArray *image_urls; //
//@property (nonatomic,assign) NSInteger likes_count; //
//@property (nonatomic,copy) NSString *price; //
//@property (nonatomic,copy) NSString *purchase_url; //
//@property (nonatomic,strong) NSURL *url; //

@property (weak, nonatomic) IBOutlet UIButton *clickButton;

@property (weak, nonatomic) IBOutlet UIImageView *coverImgView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *likesCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *likeImgView;

@end
