//
//  FuncCollectionViewCell.h
//  Giftsay
//
//  Created by nick_beibei on 16/3/11.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuncTableView.h"
#import "HeaderView.h"

@interface FuncCollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) FuncTableView *funcTableView; // tableView
@property (nonatomic,strong) HeaderView *headerView; // tableView上的headerView
@property (nonatomic,strong) UICollectionView *collectionView; // 除精选以外的视图

@end
