//
//  FuncCollectionView.m
//  Giftsay
//
//  Created by nick_beibei on 16/3/14.
//  Copyright © 2016年 nick_beibei. All rights reserved.
//

#import "FuncCollectionView.h"
#import "FuncCollectionViewCell.h"
#import "ChannelsModel.h"
#import "BaseModel.h"

static NSString *cellId = @"cellId";
@implementation FuncCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        specialMutableArray = [[NSMutableArray alloc] init];
        [self _createSubviews];
    }
    return self;
}


- (void)_createSubviews {
    [self registerClass:[FuncCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    self.delegate = self;
    self.dataSource = self;    
}



- (void)setAllArray:(NSMutableArray *)allArray {
    if (_allArray != allArray) {
        _allArray = allArray;
    }
}

#pragma mark - Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _allArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FuncCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.tag = indexPath.row;
    if (indexPath.row == 0) {
        cell.funcTableView.hidden = NO;
        cell.collectionView.hidden = YES;
        [cell.collectionView removeFromSuperview];
    } else {
        ChannelsModel *channelsModel = [[ChannelsModel alloc] init];
        channelsModel = _allArray[indexPath.row];
        cell.channelsModel = channelsModel;
        cell.funcTableView.hidden = YES;
        [cell.contentView addSubview:cell.collectionView];
        cell.collectionView.hidden = NO;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != self.currentIndex) {        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
    }
}




@end
