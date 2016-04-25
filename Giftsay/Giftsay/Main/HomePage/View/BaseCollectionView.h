//
//  BaseCollectionView.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/25.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelsModel.h"

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSMutableArray *allArray;
@property (nonatomic,strong) ChannelsModel *channelsModel;

@end
