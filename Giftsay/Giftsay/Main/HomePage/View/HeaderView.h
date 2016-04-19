//
//  HeaderView.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray *headerArray;



@end
