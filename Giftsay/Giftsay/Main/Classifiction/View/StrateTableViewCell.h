//
//  StrateTableViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/17.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonModel.h"
@interface StrateTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *headerLabel;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIView *cellView;

@property (nonatomic,strong) CommonModel *commonModel;


@end
