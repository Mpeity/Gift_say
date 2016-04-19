//
//  BaseUIView.h
//  Giftsay
//
//  Created by nick_beibei on 16/4/18.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuncCollectionView.h"


@interface BaseUIView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) FuncCollectionView *funcCollectionView;


@end
