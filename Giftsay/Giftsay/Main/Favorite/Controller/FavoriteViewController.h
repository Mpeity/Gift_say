//
//  FavoriteViewController.h
//  Giftsay
//
//  Created by nick_beibei on 16/2/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "BaseViewController.h"

@interface FavoriteViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) NSMutableDictionary *favoriteDic;

@property (nonatomic,strong) NSMutableArray *favoriteArray;

@property (nonatomic,strong) UICollectionView *favoriteCollectionView;

@end
