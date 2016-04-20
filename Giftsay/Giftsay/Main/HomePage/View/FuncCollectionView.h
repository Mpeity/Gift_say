//
//  FuncCollectionView.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/14.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuncTableView.h"

@interface FuncCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,strong) NSMutableDictionary *funcDic; //

@property (nonatomic,strong) NSMutableArray *allArray;

@property (nonatomic,assign)NSInteger currentIndex;//记录 中间cell 的索引




@end
