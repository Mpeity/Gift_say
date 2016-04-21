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
    NSLog(@"%lu",(unsigned long)self.allArray.count);
    return self.allArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FuncCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.tag = indexPath.row;
    if (indexPath.row == 0) {
        cell.funcTableView.hidden = NO;
        cell.headerView.hidden = NO;
        cell.collectionView.hidden = YES;
    } else {
        cell.funcTableView.hidden = YES;
        cell.headerView.hidden = YES;
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
