//
//  GiftView.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/17.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftView : UIView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (nonatomic,strong) NSMutableDictionary *favoriteDic;

@property (nonatomic,strong) NSMutableArray *favoriteArray;

@property (nonatomic,strong) UICollectionView *favoriteCollectionView;



@end
